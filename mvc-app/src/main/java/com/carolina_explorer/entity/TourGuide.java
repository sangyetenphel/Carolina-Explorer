package com.carolina_explorer.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

<<<<<<< HEAD

=======
>>>>>>> main
import java.util.List;

@Entity
@Table(name = "tour_guides")
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@PrimaryKeyJoinColumn(name = "tour_guide_id")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class TourGuide extends User {

<<<<<<< HEAD
=======
    // Allow long bios 
    @Column(columnDefinition = "TEXT")
>>>>>>> main
    private String bio;

    private Integer yearsOfExperience;

<<<<<<< HEAD
    @OneToMany(mappedBy = "tourGuide", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("tourGuide")
    private List<Tour> tours;

=======
    private String profileImageUrl;

    @OneToMany(mappedBy = "tourGuide", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("tourGuide")
    private List<Tour> tours;
>>>>>>> main
}