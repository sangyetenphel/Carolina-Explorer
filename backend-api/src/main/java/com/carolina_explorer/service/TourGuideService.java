package com.carolina_explorer.service;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.repository.TourGuideRepository;
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

    public TourGuide updateTourGuide(Long id, TourGuide details) {
        return tourGuideRepository.findById(id).map(guide -> {
            if (details.getEmail() != null) {
                guide.setEmail(details.getEmail());
            }
            if (details.getBio() != null) {
                guide.setBio(details.getBio());
            }
            if (details.getYearsOfExperience() != null) {
                guide.setYearsOfExperience(details.getYearsOfExperience());
            }
            return tourGuideRepository.save(guide);
        }).orElseThrow(() -> new RuntimeException("TourGuide not found"));
    }

    public void deleteTourGuide(Long id) {
        tourGuideRepository.deleteById(id);
    }

    public TourGuide getByEmail(String email) {
        return tourGuideRepository.findByEmail(email);
    }
}