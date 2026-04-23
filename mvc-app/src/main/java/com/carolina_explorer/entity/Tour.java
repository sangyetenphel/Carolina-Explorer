package com.carolina_explorer.entity;

import jakarta.persistence.*;
<<<<<<< HEAD
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;
=======
import lombok.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
>>>>>>> main

@Entity
@Table(name = "tours")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tour {

<<<<<<< HEAD
    @Transient
    private Long tourGuideId;

=======
>>>>>>> main
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tourId;

<<<<<<< HEAD
=======
    // RELATIONSHIP
>>>>>>> main
    @ManyToOne
    @JoinColumn(name = "tour_guide_id", nullable = false)
    @JsonIgnoreProperties({"tours", "hibernateLazyInitializer", "handler"})
    private TourGuide tourGuide;

<<<<<<< HEAD
=======
    // BASIC INFO
>>>>>>> main
    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    private City city;

<<<<<<< HEAD
    @Column(nullable = false)
    private Double price;

    private Double duration; // hours

=======
>>>>>>> main
    @Enumerated(EnumType.STRING)
    private Category category;

    @Enumerated(EnumType.STRING)
    private GroupType groupType;

<<<<<<< HEAD
=======
    private Integer durationHours;

    // PRICING
    @Column(nullable = false)
    private Double price;

    private Integer minGuests;
    private Integer maxGuests;

    private Integer ageRequirement;

    // DETAILS
    @Column(columnDefinition = "TEXT")
    private String itinerary;

    @Column(columnDefinition = "TEXT")
    private String includes;

    // AVAILABILITY
    private LocalDate availableDate;

    private Double rating;
    private Integer reviewCount;

    // IMAGES
    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourImage> images;

    // TIMESTAMPS
>>>>>>> main
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false)
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}