package com.carolina_explorer.service;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.repository.TourGuideRepository;

import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TourGuideService {

    @Autowired
    private TourGuideRepository tourGuideRepository;

    public TourGuide createTourGuide(TourGuide guide) {
        return tourGuideRepository.save(guide);
    }

    public List<TourGuide> getAllTourGuides() {
        return tourGuideRepository.findAll();
    }

    public Optional<TourGuide> getTourGuideById(Long id) {
        return tourGuideRepository.findById(id);
    }

    public TourGuide updateTourGuide(Long id, TourGuide updatedGuide) {

        return tourGuideRepository.findById(id).map(guide -> {

            if (updatedGuide.getFirstName() != null) {
                guide.setFirstName(updatedGuide.getFirstName());
            }

            if (updatedGuide.getLastName() != null) {
                guide.setLastName(updatedGuide.getLastName());
            }

            if (updatedGuide.getEmail() != null) {
                guide.setEmail(updatedGuide.getEmail());
            }

            // if (updatedGuide.getBio() != null) {
            //     guide.setBio(updatedGuide.getBio());
            // }

            // if (updatedGuide.getYearsOfExperience() != null) {
            //     guide.setYearsOfExperience(updatedGuide.getYearsOfExperience());
            // }

            return tourGuideRepository.save(guide);

        }).orElseThrow(() -> new RuntimeException("Tour guide not found"));
    }

    public void deleteTourGuide(Long id) {
        tourGuideRepository.deleteById(id);
    }

    public TourGuide getByEmail(String email) {
        return tourGuideRepository.findByEmail(email);
    }

    @Transactional
    public TourGuide getGuideWithTours(Long id) {
        return tourGuideRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Guide not found"));
    }
}