package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Booking;
import com.carolina_explorer.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    // CREATE booking
    @PostMapping
    public Booking createBooking(@RequestBody Booking booking) {
        return bookingService.createBooking(booking);
    }

    // GET all
    @GetMapping
    public List<Booking> getAllBookings() {
        return bookingService.getAllBookings();
    }

    // GET by tourist
    @GetMapping("/tourist/{id}")
    public List<Booking> getByTourist(@PathVariable Long id) {
        return bookingService.getBookingsByTourist(id);
    }

    // GET by tour
    @GetMapping("/tour/{id}")
    public List<Booking> getByTour(@PathVariable Long id) {
        return bookingService.getBookingsByTour(id);
    }
}