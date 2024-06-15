package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.OrderAddressDAO;
import com.swp.bookstore.entity.OrderAddress;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class OrderAddressDAOImpl implements OrderAddressDAO {
    @Override
    public OrderAddress saveOrderAddress(OrderAddress address) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {

            tx.begin();
            em.persist(address);
            tx.commit();

        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot save OrderAddress");
        } finally {
            em.close();
        }
        return address;
    }
}
