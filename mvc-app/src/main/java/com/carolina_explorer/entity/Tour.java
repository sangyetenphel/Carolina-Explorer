package com.carolina_explorer.entity;

import jakarta.persistence.*;
import lombok.*;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "tours")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tour {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long tourId;

    // RELATIONSHIP
    @ManyToOne
    @JoinColumn(name = "tour_guide_id", nullable = false)
    @JsonIgnoreProperties({"tours", "hibernateLazyInitializer", "handler"})
    private TourGuide tourGuide;

    // BASIC INFO
    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Enumerated(EnumType.STRING)
    private City city;

    @Enumerated(EnumType.STRING)
    private Category category;

    @Enumerated(EnumType.STRING)
    private GroupType groupType;

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

    private LocalTime startTime;

    private Double rating;
    private Integer reviewCount;

    // IMAGES
    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TourImage> images;

    // TIMESTAMPS
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