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
        if (bookingRepository.existsByTourAndTourDate(tour, booking.getTourDate())) {
            throw new IllegalArgumentException("This date is already booked");
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

    public List<Booking> getPendingBookingsForGuide(Long guideId) {
        return bookingRepository.findByTour_TourGuide_UserIdAndStatus(guideId, BookingStatus.PENDING);
    }

    public void acceptBooking(Long id) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow();
        booking.setStatus(BookingStatus.ACCEPTED);
        bookingRepository.save(booking);
    }

    public void rejectBooking(Long id) {
        Booking booking = bookingRepository.findById(id)
                .orElseThrow();
        booking.setStatus(BookingStatus.REJECTED);
        bookingRepository.save(booking);
    }

    public List<Booking> getAcceptedBookingsForGuide(Long guideId) {
        return bookingRepository.findByTour_TourGuide_UserIdAndStatus(guideId, BookingStatus.ACCEPTED);
    }

    public double calculateEarningsForGuide(Long guideId) {

        List<Booking> bookings =
            bookingRepository.findByTour_TourGuide_UserIdAndStatus(
                guideId,
                BookingStatus.ACCEPTED
            );

        double total = 0;

        for (Booking b : bookings) {
            if (b.getTour() != null && b.getGroupSize() != null) {
                total += b.getTour().getPrice() * b.getGroupSize();
            }
        }

        return total;
    }
}