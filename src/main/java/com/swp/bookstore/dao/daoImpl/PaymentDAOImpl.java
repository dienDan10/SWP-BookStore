package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.PaymentDAO;
import com.swp.bookstore.entity.Payment;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;

import java.time.LocalDateTime;

public class PaymentDAOImpl implements PaymentDAO {
    @Override
    public Payment savePayment(Payment payment) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(payment);
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("Save payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
        System.out.println(payment);
        return payment;
    }

    @Override
    public Payment findById(long id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Payment payment = null;
        try {
            tx.begin();
            payment = em.find(Payment.class, id);
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("find payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return payment;
    }

    @Override
    public void updatePayment(Payment payment) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(payment);
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("find payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public long getTotalIncomeByDayAgo(int day) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime daysAgo = today.minusDays(day);
        Query query = em.createQuery("select sum(p.amount) from Payment p where p.createdTime between :daysAgo and :today");
        query.setParameter("daysAgo", daysAgo);
        query.setParameter("today", today);
        long totalIncome = 0;
        try {
            tx.begin();
            totalIncome = (long) query.getSingleResult();
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("find payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return totalIncome;
    }

    @Override
    public long getTotalIncomeByMonthAgo(int month) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        LocalDateTime today = LocalDateTime.now();
        LocalDateTime daysAgo = today.minusMonths(month);
        Query query = em.createQuery("select sum(p.amount) from Payment p where p.createdTime between :daysAgo and :today");
        query.setParameter("daysAgo", daysAgo);
        query.setParameter("today", today);
        long totalIncome = 0;
        try {
            tx.begin();
            totalIncome = (long) query.getSingleResult();
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("find payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return totalIncome;
    }

    @Override
    public long getTotalIncome() {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Query query = em.createQuery("select sum(p.amount) from Payment p");
        long totalIncome = 0;
        try {
            tx.begin();
            totalIncome = (long) query.getSingleResult();
            tx.commit();
        } catch (Exception ex) {
            tx.rollback();
            System.out.println("find payment failed");
            ex.printStackTrace();
        } finally {
            em.close();
        }
        return totalIncome;
    }
}
