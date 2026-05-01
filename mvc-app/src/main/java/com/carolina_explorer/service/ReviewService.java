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

    public Review createReview(
            Long bookingId,
            Long touristId,
            Long tourId,
            int rating,
            String comment
    ) {

        Booking booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        // Prevent duplicate reviews
        if (reviewRepository.existsByBooking(booking)) {
            throw new IllegalArgumentException("Review already exists for this booking");
        }

        // Prevent reviewing future tours
        if (booking.getTourDate().isAfter(java.time.LocalDate.now())) {
            throw new IllegalArgumentException("Cannot review future tours");
        }

        // Optional: ensure correct user
        if (!booking.getTourist().getUserId().equals(touristId)) {
            throw new RuntimeException("Unauthorized review attempt");
        }

        Review review = new Review();
        review.setBooking(booking);
        review.setRating(rating);
        review.setComment(comment);

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

    public double getAverageRatingForGuide(Long guideId) {

        List<Review> reviews = reviewRepository
            .findByBookingTourTourGuideUserId(guideId);

        if (reviews.isEmpty()) return 0;

        double total = 0;

        for (Review r : reviews) {
            total += r.getRating();
        }

        return total / reviews.size();
    }
}