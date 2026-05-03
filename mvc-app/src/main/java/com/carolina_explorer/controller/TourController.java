package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.entity.TourImage;
import com.carolina_explorer.service.TourService;
import com.carolina_explorer.service.TourGuideService;

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
            @RequestParam("imageUrls") List<String> imageUrls
    ) {

        // FIX ITINERARY FORMATTING
        String formatted = tour.getItinerary()
                .replaceAll("(?=\\d{1,2}:\\d{2}\\s?(AM|PM))", "\n\n")
                .trim();

        tour.setItinerary(formatted);


        // For now grabbing the first tour guide since no login
        TourGuide guide = tourGuideService.getAllTourGuides().get(0);

        tour.setTourGuide(guide);

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