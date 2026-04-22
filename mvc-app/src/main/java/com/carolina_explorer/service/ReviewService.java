package com.carolina_explorer.service;

import com.carolina_explorer.entity.*;
import com.carolina_explorer.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private BookingRepository bookingRepository;

    public Review createReview(Review review) {

        Long bookingId = review.getBooking().getBookingId();

        Booking booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        if (reviewRepository.existsByBooking(booking)) {
            throw new IllegalArgumentException("Review already exists for this booking");
        }

        review.setBooking(booking);

        return reviewRepository.save(review);
    }

    public List<Review> getReviewsByTour(Long tourId) {
        return reviewRepository.findByBookingTourTourId(tourId);
    }

    public List<Review> getReviewsByTourist(Long touristId) {
        return reviewRepository.findByBookingTouristUserId(touristId);
    }

    public List<Review> getAllReviews() {
        return reviewRepository.findAll();
    }
}