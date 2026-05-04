package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Booking;
import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.User;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TourGuideService;
import com.carolina_explorer.service.BookingService;
import com.carolina_explorer.service.ReviewService;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String registerGuide(
            @ModelAttribute TourGuide guide,
            HttpSession session,
            RedirectAttributes redirectAttributes
    ) {

        guide.setRole(UserRole.TOUR_GUIDE);
        guide.setPasswordHash(passwordEncoder.encode(guide.getPasswordHash()));

        TourGuide savedGuide = tourGuideService.createTourGuide(guide);

        session.setAttribute("loggedInUser", savedGuide);

        redirectAttributes.addFlashAttribute("firstTour", true);
        redirectAttributes.addFlashAttribute("successMessage",
            "Account created successfully! Create your first tour.");

        return "redirect:/tours/create";
    }

    @GetMapping("/dashboard")
    public String guideDashboard(HttpSession session, Model model) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null || user.getRole() != UserRole.TOUR_GUIDE) {
            return "redirect:/login";
        }

        TourGuide guide = tourGuideService.getGuideWithTours(user.getUserId());

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

        List<Booking> accepted =
            bookingService.getAcceptedBookingsForGuide(user.getUserId());

        LocalDate today = LocalDate.now();

        List<Booking> upcoming = accepted.stream()
            .filter(b -> b.getTourDate() != null && !b.getTourDate().isBefore(today))
            .toList();

        List<Booking> completed = accepted.stream()
            .filter(b -> b.getTourDate() != null && b.getTourDate().isBefore(today))
            .toList();

        model.addAttribute("upcomingBookings", upcoming);
        model.addAttribute("completedBookings", completed);

        model.addAttribute(
            "cancelledBookings",
            bookingService.getCancelledBookingsForGuide(user.getUserId())
        );

        return "guide-dashboard";
    }
}