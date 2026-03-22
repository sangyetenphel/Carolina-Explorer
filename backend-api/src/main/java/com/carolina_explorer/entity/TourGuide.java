package com.carolina_explorer.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.List;

@Entity
@Table(name = "tour_guides")
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@PrimaryKeyJoinColumn(name = "tour_guide_id")
public class TourGuide extends User {

    private String bio;

    private Integer yearsOfExperience;

    @OneToMany(mappedBy = "tourGuide", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("tourGuide")
    private List<Tour> tours;
}