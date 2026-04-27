package com.carolina_explorer.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carolina_explorer.entity.Booking;
import com.carolina_explorer.entity.Review;
import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.service.BookingService;
import com.carolina_explorer.service.TouristService;
import com.carolina_explorer.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/profile")
public class TouristProfileController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private TouristService touristService;

    @Autowired
    private ReviewService reviewService;

    @GetMapping
    public String profile(HttpSession session, Model model) {

        Tourist tourist = (Tourist) session.getAttribute("loggedInUser");

        if (tourist == null) {
            return "redirect:/login";
        }

        // Refresh user from DB
        Tourist fullTourist = touristService.getTouristById(tourist.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Get ALL bookings
        List<Booking> bookings = bookingService.getBookingsByTourist(fullTourist.getUserId());

        LocalDate today = LocalDate.now();

        // Upcoming trips
        List<Booking> upcomingBookings = bookings.stream()
                .filter(b -> b.getTourDate() != null && !b.getTourDate().isBefore(today))
                .toList();

        // Past trips (Where I've been)
        List<Booking> pastBookings = bookings.stream()
                .filter(b -> b.getTourDate() != null && b.getTourDate().isBefore(today))
                .toList();

        // Reviews
        List<Review> reviews = reviewService.getReviewsByTourist(fullTourist.getUserId());

        // Send to frontend
        model.addAttribute("tourist", fullTourist);
        model.addAttribute("bookings", bookings);
        model.addAttribute("tripCount", bookings.size());

        model.addAttribute("upcomingBookings", upcomingBookings);
        model.addAttribute("pastBookings", pastBookings);

        model.addAttribute("upcomingCount", upcomingBookings.size());

        model.addAttribute("reviews", reviews);
        model.addAttribute("reviewCount", reviews.size());

        return "profile";
    }

    @PostMapping("/avatar")
    public String updateAvatar(
            @RequestParam String imageUrl,
            jakarta.servlet.http.HttpSession session
    ) {

        Tourist tourist = (Tourist) session.getAttribute("loggedInUser");

        if (tourist == null) {
            return "redirect:/login";
        }

        Tourist fullTourist = touristService.getTouristById(tourist.getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));

        fullTourist.setProfileImage(imageUrl);

        touristService.save(fullTourist);

        // update session
        session.setAttribute("loggedInUser", fullTourist);

        return "redirect:/profile";
    }
}