package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.RatingDAO;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.*;

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
        TypedQuery<Rating> query = em.createQuery("select r from Rating r where r.bookId = :bookId order by r.id desc ", Rating.class);
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

    @Override
    public long countRatings() {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Query query = em.createQuery("select count(r) from Rating r");
        long count = 0;
        try {
            tx.begin();
            count = (long) query.getSingleResult();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot find ratings");
        } finally {
            em.close();
        }
        return count;
    }
}
