package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Rating;

import java.util.List;

public interface RatingDAO {
    void saveRating(Rating rating);
    List<Rating> findAllRatingByBookId(long bookId);
}
