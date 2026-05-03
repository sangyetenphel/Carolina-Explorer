package com.carolina_explorer.controller;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.service.BookingService;
// import com.carolina_explorer.service.TouristService;
import com.carolina_explorer.service.TourService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

import java.time.LocalDate;

@Controller
@RequestMapping("/bookings")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    // @Autowired
    // private TouristService touristService;

    @Autowired
    private TourService tourService;

    @PostMapping
    public String createBooking(
            @RequestParam Long tourId,
            @RequestParam LocalDate tourDate,
            @RequestParam Integer guests,
            @RequestParam(required = false) GroupType groupType,
            @RequestParam(required = false) String notes,
            HttpSession session,
            RedirectAttributes redirectAttributes
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

        booking.setTourDate(tourDate);
        booking.setGroupSize(guests);
        booking.setGroupType(groupType);
        booking.setSpecialRequest(notes);
        booking.setStatus(BookingStatus.PENDING);

        bookingService.createBooking(booking);

        // FLASH MESSAGE
        redirectAttributes.addFlashAttribute("successMessage", "Booking confirmed!");

        return "redirect:/tours/" + tourId;
    }

    @PostMapping("/{id}/accept")
    public String accept(@PathVariable Long id) {
        bookingService.acceptBooking(id);
        return "redirect:/guides/dashboard?accepted=true";
    }

    @PostMapping("/{id}/reject")
    public String reject(@PathVariable Long id) {
        bookingService.rejectBooking(id);
        return "redirect:/guides/dashboard";
    }
}