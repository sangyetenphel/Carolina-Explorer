package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.TourImage;
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
        Object user = session.getAttribute("loggedInUser");

        if (!(user instanceof TourGuide)) {
            return "redirect:/login";
        }

        TourGuide guide = (TourGuide) user;

        // fix itinerary
        String formatted = tour.getItinerary()
                .replaceAll("(?=\\d{1,2}:\\d{2}\\s?(AM|PM))", "\n\n")
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