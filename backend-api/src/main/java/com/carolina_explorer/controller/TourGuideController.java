package com.carolina_explorer.controller;

import com.carolina_explorer.entity.TourGuide;
import com.carolina_explorer.service.TourGuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/tour-guides")
public class TourGuideController {

    @Autowired
    private TourGuideService tourGuideService;

    @PostMapping
    public ResponseEntity<TourGuide> createTourGuide(@RequestBody TourGuide guide) {
        return new ResponseEntity<>(tourGuideService.createTourGuide(guide), HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<TourGuide>> getAllTourGuides() {
        return new ResponseEntity<>(tourGuideService.getAllTourGuides(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TourGuide> getTourGuideById(@PathVariable Long id) {
        Optional<TourGuide> guide = tourGuideService.getTourGuideById(id);
        return guide.map(g -> new ResponseEntity<>(g, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{id}")
    public ResponseEntity<TourGuide> updateTourGuide(@PathVariable Long id, @RequestBody TourGuide details) {
        try {
            return new ResponseEntity<>(tourGuideService.updateTourGuide(id, details), HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTourGuide(@PathVariable Long id) {
        tourGuideService.deleteTourGuide(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}