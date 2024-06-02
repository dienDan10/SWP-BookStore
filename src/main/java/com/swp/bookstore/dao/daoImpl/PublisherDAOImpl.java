package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.PublisherDAO;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class PublisherDAOImpl implements PublisherDAO {
    @Override
    public List<Publisher> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Publisher> query = em.createQuery("select a from Publisher a", Publisher.class);
        return query.getResultList();
    }
}
