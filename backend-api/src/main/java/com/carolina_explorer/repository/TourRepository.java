package com.carolina_explorer.repository;

import com.carolina_explorer.entity.Tour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TourRepository extends JpaRepository<Tour, Long> {

    // Filter by city
    List<Tour> findByCity(String city);

    // Filter by category
    List<Tour> findByCategory(String category);

    // Filter by price less than
    List<Tour> findByPriceLessThanEqual(Double price);
}