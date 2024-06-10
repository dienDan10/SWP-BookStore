package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.OrderDAO;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class OrderDAOImpl implements OrderDAO {
    @Override
    public Order saveOrder(Order order) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(order);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot save order");
        } finally {
            em.close();
        }
        return order;
    }

    @Override
    public void updateOrder(Order order) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(order);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot save order");
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteOrder(long id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Order order = em.find(Order.class, id);
            em.remove(order);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot save order");
        } finally {
            em.close();
        }
    }

    @Override
    public Order findOrderById(long id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Order order = null;
        try {
            tx.begin();
            order = em.find(Order.class, id);
            tx.commit();
        } catch (NoResultException e) {
            tx.rollback();
            System.out.println("Cannot find order");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return order;
    }

    @Override
    public List<Order> findOrdersByUserId(long userId) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        List<Order> orders = null;
        TypedQuery<Order> query = em.createQuery("select o from Order o where o.userId = :userId", Order.class);
        query.setParameter("userId", userId);
        try {
            orders = query.getResultList();
        } catch (NoResultException e) {
            e.printStackTrace();
            System.out.println("Cannot find order");
            tx.rollback();
        } finally {
            em.close();
        }
        return orders;
    }

    @Override
    public List<Order> findOrdersByUserIdAndStatus(long userId, String status) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        List<Order> orders = null;
        TypedQuery<Order> query = em.createQuery("select o from Order o where o.userId = :userId and o.status = :status", Order.class);
        query.setParameter("userId", userId);
        query.setParameter("status", status);
        try {
            orders = query.getResultList();
        } catch (NoResultException e) {
            e.printStackTrace();
            System.out.println("Cannot find order");
            tx.rollback();
        } finally {
            em.close();
        }
        return orders;
    }
}
