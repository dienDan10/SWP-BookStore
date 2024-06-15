package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.RatingDAO;
import com.swp.bookstore.dao.daoImpl.RatingDAOImpl;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.service.RatingService;

import java.util.List;

public class RatingServiceImpl implements RatingService {
    private RatingDAO ratingDAO = new RatingDAOImpl();

    @Override
    public void saveRating(Rating rating) {
        ratingDAO.saveRating(rating);
    }

    @Override
    public List<Rating> findAllRatingsByBookId(long bookId) {
        return ratingDAO.findAllRatingByBookId(bookId);
    }
}
