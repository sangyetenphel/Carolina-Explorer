package com.carolina_explorer.controller;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.User;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TourGuideService;

import jakarta.servlet.http.HttpSession;

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
    private PasswordEncoder passwordEncoder;

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
    public String guideDashboard(HttpSession session) {

        User user = (User) session.getAttribute("loggedInUser");

        if (user == null || user.getRole() != UserRole.TOUR_GUIDE) {
            return "redirect:/login";
        }

        return "guide-dashboard";
    }
}