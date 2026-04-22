package com.carolina_explorer.service;

import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.repository.TouristRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TouristService {

    @Autowired
    private TouristRepository touristRepository;

    public Tourist createTourist(Tourist tourist) {
        return touristRepository.save(tourist);
    }

    public Optional<Tourist> getTouristById(Long id) {
        return touristRepository.findById(id);
    }

    public List<Tourist> getAllTourists() {
        return touristRepository.findAll();
    }

    public Tourist updateTourist(Long id, Tourist touristDetails) {
        return touristRepository.findById(id).map(tourist -> {

            if (touristDetails.getEmail() != null) {
                tourist.setEmail(touristDetails.getEmail());
            }

            if (touristDetails.getFirstName() != null) {
                tourist.setFirstName(touristDetails.getFirstName());
            }

            if (touristDetails.getLastName() != null) {
                tourist.setLastName(touristDetails.getLastName());
            }

            return touristRepository.save(tourist);

        }).orElseThrow(() -> new RuntimeException("Tourist not found"));
    }

    public void deleteTourist(Long id) {
        touristRepository.deleteById(id);
    }

    public Tourist getTouristByEmail(String email) {
        return touristRepository.findByEmail(email);
    }
}