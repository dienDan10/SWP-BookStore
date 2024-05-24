package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.UserDAO;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UserDAOImpl implements UserDAO {


    @Override
    public User findByEmail(String email) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<User> query = em.createQuery("select u from User u where email = :email", User.class);
        query.setParameter("email", email);
        User user = query.getSingleResult();
        if (user == null) {
            return null;
        }
        em.close();
        return user;
    }

    @Override
    public void save(User user) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(user);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}
