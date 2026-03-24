package com.carolina_explorer.service;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private TouristRepository touristRepository;

    @Autowired
    private TourRepository tourRepository;

    public Booking createBooking(Booking booking) {

        Long touristId = booking.getTourist().getUserId();
        Long tourId = booking.getTour().getTourId();

        Tourist tourist = touristRepository.findById(touristId)
                .orElseThrow(() -> new RuntimeException("Tourist not found"));

        Tour tour = tourRepository.findById(tourId)
                .orElseThrow(() -> new RuntimeException("Tour not found"));

        // Prevent duplicate booking
        if (bookingRepository.existsByTouristAndTour(tourist, tour)) {
            throw new IllegalArgumentException("Booking already exists");
        }

        // reattach full objects
        booking.setTourist(tourist);
        booking.setTour(tour);

        return bookingRepository.save(booking);
    }

    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    public List<Booking> getBookingsByTourist(Long touristId) {
        return bookingRepository.findByTouristUserId(touristId);
    }

    public List<Booking> getBookingsByTour(Long tourId) {
        return bookingRepository.findByTourTourId(tourId);
    }
}