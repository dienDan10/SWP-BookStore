package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.CategoryDAO;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
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

    @Override
    public Category findByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        TypedQuery<Category> query = em.createQuery("select c from Category c where lower(c.name) = :name", Category.class);
        query.setParameter("name", name.toLowerCase());
        Category category = null;
        try {
            tx.begin();
            category = query.getSingleResult();
            tx.commit();
        } catch (NoResultException e) {
            tx.rollback();
            System.out.println("Cannot find publisher with name " + name);
            e.printStackTrace();
        } finally {
            em.close();
        }
        return category;
    }
}
