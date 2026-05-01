package com.carolina_explorer.repository;

import com.carolina_explorer.entity.Booking;
import com.carolina_explorer.entity.BookingStatus;
import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.entity.Tourist;

import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByTouristUserId(Long userId);

    List<Booking> findByTourTourId(Long tourId);

    boolean existsByTouristAndTour(Tourist tourist, Tour tour);

    List<Booking> findByTour_TourGuide_UserIdAndStatus(Long guideId, BookingStatus status);

    boolean existsByTourAndTourDate(Tour tour, LocalDate tourDate);
}