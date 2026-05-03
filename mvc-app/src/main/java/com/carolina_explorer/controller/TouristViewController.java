package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Review;
import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.service.ReviewService;
import com.carolina_explorer.service.TourService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class TouristViewController {

    @Autowired
    private TourService tourService;

    @Autowired
    private ReviewService reviewService;

    // HOME PAGE
    @GetMapping("/")
    public String home(
            @RequestParam(required = false) String city,
            @RequestParam(required = false) String date,
            @RequestParam(required = false) Integer guests,
            Model model,
            HttpSession session
    ) {

        List<Tour> tours = tourService.getAllTours();

        for (Tour t : tours) {
            double avg = reviewService.getAverageRatingForTour(t.getTourId());
            int count = reviewService.getReviewCountForTour(t.getTourId());

            t.setRating(avg);
            t.setReviewCount(count);
        }

        List<Tour> featured = tourService.getTopTours();

        for (Tour t : featured) {
            double avg = reviewService.getAverageRatingForTour(t.getTourId());
            int count = reviewService.getReviewCountForTour(t.getTourId());

            t.setRating(avg);
            t.setReviewCount(count);
        }

        model.addAttribute("tours", tours);
        model.addAttribute("featuredTours", featured);

        model.addAttribute("loggedInUser", session.getAttribute("loggedInUser"));


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

        for (Tour t : tours) {
            double avg = reviewService.getAverageRatingForTour(t.getTourId());
            int count = reviewService.getReviewCountForTour(t.getTourId());

            t.setRating(avg);
            t.setReviewCount(count);
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
        
        double avg = reviewService.getAverageRatingForTour(id);
        int count = reviewService.getReviewCountForTour(id);

        List<Review> reviews = reviewService.getReviewsByTour(id);

        tour.setRating(avg);
        tour.setReviewCount(count);

        model.addAttribute("tour", tour);
        model.addAttribute("reviews", reviews);
        model.addAttribute("reviewMode", review != null && review);
        model.addAttribute("bookingId", bookingId);

        return "tour-details";
    }
}