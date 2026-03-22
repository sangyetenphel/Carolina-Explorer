package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tour;
import com.carolina_explorer.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/tours")
public class TourController {

    @Autowired
    private TourService tourService;

    @PostMapping
    public ResponseEntity<Tour> createTour(@RequestBody Tour tour) {
        return new ResponseEntity<>(tourService.createTour(tour), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Tour>> getAllTours() {
        return new ResponseEntity<>(tourService.getAllTours(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Tour> getTourById(@PathVariable Long id) {
        Optional<Tour> tour = tourService.getTourById(id);
        return tour.map(t -> new ResponseEntity<>(t, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    // 🔍 Filters
    @GetMapping("/city/{city}")
    public ResponseEntity<List<Tour>> getToursByCity(@PathVariable String city) {
        return new ResponseEntity<>(tourService.getToursByCity(city), HttpStatus.OK);
    }

    @GetMapping("/category/{category}")
    public ResponseEntity<List<Tour>> getToursByCategory(@PathVariable String category) {
        return new ResponseEntity<>(tourService.getToursByCategory(category), HttpStatus.OK);
    }

    @GetMapping("/price/{price}")
    public ResponseEntity<List<Tour>> getToursByPrice(@PathVariable Double price) {
        return new ResponseEntity<>(tourService.getToursByPrice(price), HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Tour> updateTour(@PathVariable Long id, @RequestBody Tour details) {
        try {
            return new ResponseEntity<>(tourService.updateTour(id, details), HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTour(@PathVariable Long id) {
        tourService.deleteTour(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}