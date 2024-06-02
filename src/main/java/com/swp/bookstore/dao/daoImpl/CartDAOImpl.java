package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.CartDAO;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class CartDAOImpl implements CartDAO {

    @Override
    public void addCart(Cart cart) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try {
            em.persist(cart);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("Add to cart failed");
        } finally {
            em.close();
        }
    }

    @Override
    public void removeCart(long id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try {
            Cart cart = em.find(Cart.class, id);
            em.remove(cart);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("remove from cart failed");
        } finally {
            em.close();
        }
    }

    @Override
    public Cart findCartById(long id) {
        EntityManager em = JPAUtil.getEntityManager();

        return em.find(Cart.class, id);
    }

    @Override
    public void updateCart(Cart cart) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        try {
            em.merge(cart);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("update from cart failed");
        } finally {
            em.close();
        }
    }
}
