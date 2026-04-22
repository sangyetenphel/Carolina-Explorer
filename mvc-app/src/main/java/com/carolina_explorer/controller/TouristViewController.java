package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TouristViewController {

    @Autowired
    private TourService tourService;

    // HOME PAGE
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("tours", tourService.getAllTours());
        return "index";
    }

    // TOURS PAGE (handles BOTH search + city click)
    @GetMapping("/tours")
    public String getTours(
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String date,
            @RequestParam(required = false) Integer guests,
            Model model
    ) {

        List<Tour> tours;

        if (city != null && !city.isEmpty()) {
            tours = tourService.getToursByCity(city);
        } else {
            tours = tourService.getAllTours();
        }

        model.addAttribute("tours", tours);
        model.addAttribute("selectedCity", city);

        return "tours"; // your second page (city-style UI)
    }

    // TOUR DETAILS PAGE
    @GetMapping("/tours/{id}")
    public String getTourDetails(@PathVariable Long id, Model model) {

        Tour tour = tourService.getTourById(id)
                .orElseThrow(() -> new RuntimeException("Tour not found"));

        model.addAttribute("tour", tour);

        return "tour-details";
    }
}