package com.carolina_explorer.controller;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.User;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TourGuideService;
import com.carolina_explorer.service.BookingService;
import com.carolina_explorer.service.ReviewService;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/guides")
public class TourGuideController {

    @Autowired
    private TourGuideService tourGuideService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ReviewService reviewService;

    // SHOW SIGNUP PAGE
    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("guide", new TourGuide());
        return "guide-signup";
    }

    // HANDLE FORM SUBMISSION
    @PostMapping("/signup")
    public String registerGuide(@ModelAttribute TourGuide guide) {

        guide.setRole(UserRole.TOUR_GUIDE);

        guide.setPasswordHash(passwordEncoder.encode(guide.getPasswordHash()));

        tourGuideService.createTourGuide(guide);

        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String guideDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null || user.getRole() != UserRole.TOUR_GUIDE) {
            return "redirect:/login";
        }

        TourGuide guide = tourGuideService.getGuideWithTours(user.getUserId());

        //  MOCK DATA for now (we connect DB later)
        model.addAttribute("guide", guide);
        
        double rating = reviewService.getAverageRatingForGuide(user.getUserId());
        model.addAttribute("rating", rating);

        double earnings = bookingService.calculateEarningsForGuide(user.getUserId());
        model.addAttribute("earnings", earnings);

        int count = bookingService
            .getAcceptedBookingsForGuide(user.getUserId())
            .size();

        model.addAttribute("upcomingToursCount", count);

        model.addAttribute("bookings", bookingService.getPendingBookingsForGuide(user.getUserId()));

        model.addAttribute(
            "upcomingBookings",
            Optional.ofNullable(
                bookingService.getAcceptedBookingsForGuide(user.getUserId())
            ).orElse(new ArrayList<>())
        );

        return "guide-dashboard";
    }
}