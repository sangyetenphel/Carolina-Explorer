package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.service.TouristService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/tourists")
public class TouristController {

    @Autowired
    private TouristService touristService;

    @PostMapping
    public ResponseEntity<Tourist> createTourist(@RequestBody Tourist tourist) {
        Tourist created = touristService.createTourist(tourist);
        return new ResponseEntity<>(created, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Tourist>> getAllTourists() {
        return new ResponseEntity<>(touristService.getAllTourists(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Tourist> getTouristById(@PathVariable Long id) {
        Optional<Tourist> tourist = touristService.getTouristById(id);
        return tourist.map(t -> new ResponseEntity<>(t, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @GetMapping("/email/{email}")
    public ResponseEntity<Tourist> getTouristByEmail(@PathVariable String email) {
        Tourist tourist = touristService.getTouristByEmail(email);
        return tourist != null
                ? new ResponseEntity<>(tourist, HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Tourist> updateTourist(@PathVariable Long id, @RequestBody Tourist details) {
        Optional<Tourist> existing = touristService.getTouristById(id);

        if (existing.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        try {
            Tourist updated = touristService.updateTourist(id, details);
            return new ResponseEntity<>(updated, HttpStatus.OK);
        } catch (RuntimeException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTourist(@PathVariable Long id) {
        touristService.deleteTourist(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}