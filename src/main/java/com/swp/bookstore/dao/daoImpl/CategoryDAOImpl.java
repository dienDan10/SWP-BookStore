package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.CategoryDAO;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {
    @Override
    public List<Category> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Category> query = em.createQuery("select a from Category a", Category.class);
        return query.getResultList();
    }

    @Override
    public Category findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Category> query = em.createQuery("select a from Category a where a.id = :id", Category.class);
        query.setParameter("id", id);
        return query.getSingleResult();
    }
}
