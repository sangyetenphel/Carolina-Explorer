package com.carolina_explorer.service;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.repository.TourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TourService {

    @Autowired
    private TourRepository tourRepository;

    public Tour createTour(Tour tour) {
        return tourRepository.save(tour);
    }

    public Optional<Tour> getTourById(Long id) {
        return tourRepository.findById(id);
    }

    public List<Tour> getAllTours() {
        return tourRepository.findAll();
    }

    public List<Tour> getToursByCity(String city) {
        return tourRepository.findByCity(city);
    }

    public List<Tour> getToursByCategory(String category) {
        return tourRepository.findByCategory(category);
    }

    public List<Tour> getToursByPrice(Double price) {
        return tourRepository.findByPriceLessThanEqual(price);
    }

    public Tour updateTour(Long id, Tour tourDetails) {
        return tourRepository.findById(id).map(tour -> {

            if (tourDetails.getTitle() != null) {
                tour.setTitle(tourDetails.getTitle());
            }

            if (tourDetails.getDescription() != null) {
                tour.setDescription(tourDetails.getDescription());
            }

            if (tourDetails.getPrice() != null) {
                tour.setPrice(tourDetails.getPrice());
            }

            return tourRepository.save(tour);

        }).orElseThrow(() -> new RuntimeException("Tour not found"));
    }

    public void deleteTour(Long id) {
        tourRepository.deleteById(id);
    }
}