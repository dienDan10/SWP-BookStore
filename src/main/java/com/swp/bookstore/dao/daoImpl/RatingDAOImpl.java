package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.RatingDAO;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class RatingDAOImpl implements RatingDAO {
    @Override
    public void saveRating(Rating rating) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(rating);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Save Rating failed");
        } finally {
            em.close();
        }
    }

    @Override
    public List<Rating> findAllRatingByBookId(long bookId) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        TypedQuery<Rating> query = em.createQuery("select r from Rating r where r.bookId = :bookId", Rating.class);
        query.setParameter("bookId", bookId);
        List<Rating> ratings = new ArrayList<Rating>();
        try {
            tx.begin();
            ratings = query.getResultList();
            tx.commit();
        } catch (NoResultException e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Find All Rating failed");
        } finally {
            em.close();
        }
        return ratings;
    }
}
