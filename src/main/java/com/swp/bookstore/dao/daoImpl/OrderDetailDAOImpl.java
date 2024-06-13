package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.OrderDetailDAO;
import com.swp.bookstore.entity.OrderDetail;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class OrderDetailDAOImpl implements OrderDetailDAO {
    @Override
    public void addOrderDetail(OrderDetail orderDetail) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(orderDetail);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Save Order Detail Failed");
        } finally {
            em.close();
        }
    }
}
