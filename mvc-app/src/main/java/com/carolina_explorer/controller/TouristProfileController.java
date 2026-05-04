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
import com.carolina_explorer.entity.BookingStatus;
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

        // UPCOMING → ONLY accepted + future
        List<Booking> upcomingBookings = bookings.stream()
            .filter(b -> b.getStatus() == BookingStatus.ACCEPTED)
            .filter(b -> b.getTourDate() != null && !b.getTourDate().isBefore(today))
            .toList();

        // PENDING → waiting approval
        List<Booking> pendingBookings = bookings.stream()
            .filter(b -> b.getStatus() == BookingStatus.PENDING)
            .toList();

        // Past trips (ONLY accepted)
        List<Booking> pastBookings = bookings.stream()
                .filter(b -> b.getStatus() == BookingStatus.ACCEPTED)
                .filter(b -> b.getTourDate() != null && b.getTourDate().isBefore(today))
                .toList();

        //  Rejected bookings
        List<Booking> rejectedBookings = bookings.stream()
                .filter(b -> b.getStatus() == BookingStatus.REJECTED)
                .toList();

        // Reviews
        List<Review> reviews = reviewService.getReviewsByTourist(fullTourist.getUserId());

        // Send to frontend
        model.addAttribute("tourist", fullTourist);
        model.addAttribute("bookings", bookings);
        long completedCount = bookings.stream()
                .filter(b -> b.getStatus() == BookingStatus.ACCEPTED)
                .filter(b -> b.getTourDate() != null && b.getTourDate().isBefore(today))
                .count();

        List<Long> reviewedBookingIds = reviews.stream()
        .map(r -> r.getBooking().getBookingId())
        .toList();

        model.addAttribute("reviewedBookingIds", reviewedBookingIds);

        model.addAttribute("tripCount", completedCount);

        model.addAttribute("pendingBookings", pendingBookings);
        model.addAttribute("upcomingBookings", upcomingBookings);
        model.addAttribute("pastBookings", pastBookings);
        model.addAttribute("rejectedBookings", rejectedBookings);

        model.addAttribute("upcomingCount", upcomingBookings.size());
        model.addAttribute("pendingCount", pendingBookings.size());
        model.addAttribute("rejectedCount", rejectedBookings.size());

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