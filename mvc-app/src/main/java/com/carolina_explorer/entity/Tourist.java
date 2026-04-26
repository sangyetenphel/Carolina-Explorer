package com.carolina_explorer.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tourists")
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@PrimaryKeyJoinColumn(name = "tourist_id")
public class Tourist extends User {
    // No extra fields needed for now
    @Column(name = "profile_image")
    private String profileImage;
}