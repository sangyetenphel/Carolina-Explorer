package com.carolina_explorer.controller;

import com.carolina_explorer.entity.Review;
import com.carolina_explorer.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @PostMapping
    public Review createReview(@RequestBody Review review) {
        return reviewService.createReview(review);
    }

    @GetMapping
    public List<Review> getAll() {
        return reviewService.getAllReviews();
    }

    @GetMapping("/tour/{id}")
    public List<Review> getByTour(@PathVariable Long id) {
        return reviewService.getReviewsByTour(id);
    }

    @GetMapping("/tourist/{id}")
    public List<Review> getByTourist(@PathVariable Long id) {
        return reviewService.getReviewsByTourist(id);
    }
}