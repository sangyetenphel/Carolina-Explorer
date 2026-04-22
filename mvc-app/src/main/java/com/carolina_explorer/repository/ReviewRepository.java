package com.carolina_explorer.repository;

import com.carolina_explorer.entity.Booking;
import com.carolina_explorer.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByBookingTourTourId(Long tourId);

    List<Review> findByBookingTouristUserId(Long touristId);

    boolean existsByBooking(Booking booking);
}