package com.carolina_explorer.repository;

import com.carolina_explorer.entity.TourGuide;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TourGuideRepository extends JpaRepository<TourGuide, Long> {
    TourGuide findByEmail(String email);
}