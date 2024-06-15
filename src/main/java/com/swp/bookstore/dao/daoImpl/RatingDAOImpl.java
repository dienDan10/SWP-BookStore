package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.RatingDAO;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

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
}
