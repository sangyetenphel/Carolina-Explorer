package com.carolina_explorer.service;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

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

    // Only the guide who owns the tour can accept or reject its bookings
    public void acceptBooking(Long id, Long guideId) {
        Booking booking = findBookingForGuide(id, guideId);
        booking.setStatus(BookingStatus.ACCEPTED);
        bookingRepository.save(booking);
    }

    public void rejectBooking(Long id, Long guideId) {
        Booking booking = findBookingForGuide(id, guideId);
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

    // Only the tourist who made the booking can cancel it
    public void cancelBooking(Long id, Long touristId) {
        Booking booking = findBooking(id);

        if (!booking.getTourist().getUserId().equals(touristId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN);
        }

        booking.setStatus(BookingStatus.CANCELLED);
        bookingRepository.save(booking);
    }

    private Booking findBooking(Long id) {
        return bookingRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    private Booking findBookingForGuide(Long id, Long guideId) {
        Booking booking = findBooking(id);

        if (!booking.getTour().getTourGuide().getUserId().equals(guideId)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN);
        }

        return booking;
    }

    public List<Booking> getCancelledBookingsForGuide(Long guideId) {
        return bookingRepository.findByTour_TourGuide_UserIdAndStatus(
            guideId,
            BookingStatus.CANCELLED
        );
    }
}