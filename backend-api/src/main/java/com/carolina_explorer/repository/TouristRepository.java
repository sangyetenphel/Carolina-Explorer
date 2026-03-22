package com.carolina_explorer.repository;

import com.carolina_explorer.entity.Tourist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TouristRepository extends JpaRepository<Tourist, Long> {

    Tourist findByEmail(String email);
}