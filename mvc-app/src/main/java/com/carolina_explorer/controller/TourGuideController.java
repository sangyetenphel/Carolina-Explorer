package com.carolina_explorer.controller;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TourGuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/guides")
public class TourGuideController {

    @Autowired
    private TourGuideService tourGuideService;

    // SHOW SIGNUP PAGE
    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("guide", new TourGuide());
        return "guide-signup";
    }

    // HANDLE FORM SUBMISSION
    @PostMapping("/signup")
    public String registerGuide(@ModelAttribute TourGuide guide) {

        // set role automatically
        guide.setRole(UserRole.TOUR_GUIDE);

        // DEBUG (optional but helpful)
        System.out.println("Guide registered: " + guide.getEmail());

        tourGuideService.createTourGuide(guide);

        return "redirect:/tours/create";
    }
}