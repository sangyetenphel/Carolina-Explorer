package com.carolina_explorer.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class TourGuide extends User {

    @Enumerated(EnumType.STRING)
    private City tourGuideCity;

    private int yearsOfExperience;

    private String bio;
}

enum City {
    ASHEVILLE,
    CHARLOTTE,
    RALEIGH,
    WILMINGTON
}