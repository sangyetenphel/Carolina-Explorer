package com.carolina_explorer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.carolina_explorer.entity.Tourist;
import com.carolina_explorer.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping("/reviews")
    public String createReview(
            @RequestParam Long bookingId,
            @RequestParam Long tourId,
            @RequestParam int rating,
            @RequestParam String comment,
            HttpSession session
    ) {

        Tourist tourist = (Tourist) session.getAttribute("loggedInUser");

        if (tourist == null) {
            return "redirect:/login";
        }

        reviewService.createReview(
                bookingId,
                tourist.getUserId(),
                tourId,
                rating,
                comment
        );

        return "redirect:/profile";
    }
}