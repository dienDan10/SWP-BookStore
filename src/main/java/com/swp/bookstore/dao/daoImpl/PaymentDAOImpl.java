package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.PaymentDAO;
import com.swp.bookstore.entity.Payment;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

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
}