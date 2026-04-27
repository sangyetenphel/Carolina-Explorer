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
    public String home(
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String date,
            @RequestParam(required = false) Integer guests,
            Model model
    ) {
        model.addAttribute("tours", tourService.getAllTours());

        model.addAttribute("featuredTours", tourService.getTopTours());


        // model.addAttribute("selectedCity", city != null ? city : "");
        // model.addAttribute("selectedDate", date != null ? date : "");
        // model.addAttribute("selectedGuests", guests != null ? guests : "");

        return "index";
    }

    // TOURS PAGE (handles BOTH search + city click)
    @GetMapping("/tours")
    public String getTours(
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String date,
            @RequestParam(required = false) Integer guests,

            @RequestParam(required = false) Double minPrice,
            @RequestParam(required = false) Double maxPrice,
            @RequestParam(required = false) Integer groupSize,
            @RequestParam(required = false) String category,
            Model model
    ) {

        // List<Tour> tours;

        // if (city != null && !city.isEmpty()) {
        //     tours = tourService.getToursByCity(city);
        // } else {
        //     tours = tourService.getAllTours();
        // }

        List<Tour> tours = tourService.getAllTours();

        // FILTER BY CITY
        if (city != null && !city.isEmpty()) {
            tours = tours.stream()
                    .filter(t -> t.getCity().name().equalsIgnoreCase(city))
                    .toList();
        }

        // FILTER BY PRICE
        if (minPrice != null) {
            tours = tours.stream()
                    .filter(t -> t.getPrice() >= minPrice)
                    .toList();
        }

        if (maxPrice != null) {
            tours = tours.stream()
                    .filter(t -> t.getPrice() <= maxPrice)
                    .toList();
        }

        // FILTER BY GROUP SIZE
        if (guests != null) {
            tours = tours.stream()
                .filter(t -> t.getMinGuests() <= guests && t.getMaxGuests() >= guests)
                .toList();
        }

        // FILTER BY CATEGORY
        if (category != null && !category.isEmpty()) {
            tours = tours.stream()
                    .filter(t -> t.getCategory().name().equalsIgnoreCase(category))
                    .toList();
        }

        model.addAttribute("tours", tours);
        model.addAttribute("selectedCity", city != null ? city : "");
        model.addAttribute("selectedDate", date != null ? date : "");
        model.addAttribute("selectedGuests", guests != null ? guests : "");

        return "tours";
    }

    // TOUR DETAILS PAGE
    @GetMapping("/tours/{id}")
    public String getTourDetails(
            @PathVariable Long id,
            @RequestParam(required = false) Boolean review,
            @RequestParam(required = false) Long bookingId,
            Model model
    ) {

        Tour tour = tourService.getTourById(id)
                .orElseThrow(() -> new RuntimeException("Tour not found"));

        model.addAttribute("tour", tour);
        model.addAttribute("reviewMode", review != null && review);
        model.addAttribute("bookingId", bookingId);

        return "tour-details";
    }
}