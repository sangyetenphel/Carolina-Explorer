package com.carolina_explorer.controller;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.service.BookingService;
// import com.carolina_explorer.service.TouristService;
import com.carolina_explorer.service.TourService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;

@Controller
public class BookingController {

    @Autowired
    private BookingService bookingService;

    // @Autowired
    // private TouristService touristService;

    @Autowired
    private TourService tourService;

    @PostMapping("/bookings")
    public String createBooking(
            @RequestParam Long tourId,
            @RequestParam LocalDate date,
            @RequestParam Integer guests,
            @RequestParam(required = false) GroupType groupType,
            @RequestParam(required = false) String notes,
            HttpSession session
    ) {

        // Get logged in user
        Tourist tourist = (Tourist) session.getAttribute("loggedInUser");

        if (tourist == null) {
            return "redirect:/login";
        }

        // Tourist tourist = touristService.getTouristById(touristId)
        //         .orElseThrow();

        Tour tour = tourService.getTourById(tourId)
                .orElseThrow();

        Booking booking = new Booking();
        booking.setTourist(tourist);
        booking.setTour(tour);

        booking.setTourDate(date);
        booking.setGroupSize(guests);
        booking.setGroupType(groupType);
        booking.setSpecialRequest(notes);

        bookingService.createBooking(booking);

        return "redirect:/tours?booking=success";
    }
}