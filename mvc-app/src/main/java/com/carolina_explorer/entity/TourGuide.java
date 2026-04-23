package com.carolina_explorer.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

@Entity
@Table(name = "tour_guides")
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@PrimaryKeyJoinColumn(name = "tour_guide_id")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class TourGuide extends User {

    // Allow long bios 
    @Column(columnDefinition = "TEXT")
    private String bio;

    private Integer yearsOfExperience;

    private String profileImageUrl;

    @OneToMany(mappedBy = "tourGuide", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("tourGuide")
    private List<Tour> tours;
}