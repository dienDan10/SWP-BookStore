package com.swp.bookstore.service;

import com.swp.bookstore.entity.Rating;

import java.util.List;

public interface RatingService {
    void saveRating(Rating rating);
    List<Rating> findAllRatingsByBookId(long bookId);
    long countRatings();
}
