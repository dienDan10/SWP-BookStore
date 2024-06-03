package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.CartDAO;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;

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
        EntityTransaction tx = em.getTransaction();
        Cart cart = null;
        try {
            tx.begin();
            cart = em.find(Cart.class, id);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            System.out.println("find cart failed");
        } finally {
            em.close();
        }
        return cart;
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

    @Override
    public Cart findCartByUserIdAndBookId(long userId, long bookId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Cart> query = em.createQuery("select c from Cart c join fetch Book b where c.userId = :userId and b.id = :bookId", Cart.class);
        query.setParameter("userId", userId);
        query.setParameter("bookId", bookId);
        Cart cart = null;
        em.getTransaction().begin();
        try {
            List<Cart> carts = query.getResultList();
            for (Cart car : carts) {
                if (car.getBook().getId() == bookId)
                    cart = car;
            }
        } catch (NoResultException e) {
            em.getTransaction().rollback();
            System.out.println("find cart failed");
        } finally {
            em.close();
        }
        return cart;
    }

    @Override
    public List<Cart> findAllByUserId(long userId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Cart> query = em.createQuery("select c from Cart c where c.userId = :userId", Cart.class);
        query.setParameter("userId", userId);
        List<Cart> carts = null;
        try {
            carts = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("No cart found");
        } finally {
            em.close();
        }
        return carts;
    }
}
