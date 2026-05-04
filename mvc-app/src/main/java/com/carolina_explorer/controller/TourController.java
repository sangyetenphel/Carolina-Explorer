package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.TourImage;
import com.carolina_explorer.entity.User;
import com.carolina_explorer.entity.UserRole;
import com.carolina_explorer.service.TourGuideService;
import com.carolina_explorer.service.TourService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;



@Controller
@RequestMapping("/tours")
public class TourController {

    @Autowired
    private TourService tourService;

    @Autowired
    private TourGuideService tourGuideService;

    // SHOW CREATE FORM
        @GetMapping("/create")
        public String showCreateForm(Model model) {

            if (!model.containsAttribute("tour")) {
                model.addAttribute("tour", new Tour());
            }

            return "create-tour";
        }

    // CREATE TOUR
    @PostMapping("/create")
    public String createTour(
            @ModelAttribute Tour tour,
            @RequestParam("imageUrls") List<String> imageUrls,
            HttpSession session
    ) {

        // check type instead of direct cast
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null || user.getRole() != UserRole.TOUR_GUIDE) {
            return "redirect:/login";
        }

        // always fetch full guide from DB
        TourGuide guide = tourGuideService.getGuideWithTours(user.getUserId());

        // fix itinerary
        String formatted = tour.getItinerary()
            .replaceAll("(?<!^)\\s*(\\d{1,2}:\\d{2}\\s?(AM|PM))", "\n\n$1")
            .trim();

        tour.setItinerary(formatted);

        // set correct guide
        tour.setTourGuide(guide);

        // images
        List<TourImage> imageList = new ArrayList<>();

        for (String url : imageUrls) {
            if (url != null && !url.isBlank()) {
                TourImage img = new TourImage();
                img.setImageUrl(url.trim());
                img.setTour(tour);
                imageList.add(img);
            }
        }

        tour.setImages(imageList);

        tourService.createTour(tour);

        return "redirect:/";
    }
}