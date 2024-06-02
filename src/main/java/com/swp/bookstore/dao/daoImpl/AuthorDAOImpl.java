package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.AuthorDAO;
import com.swp.bookstore.entity.Author;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class AuthorDAOImpl implements AuthorDAO {
    @Override
    public List<Author> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Author> query = em.createQuery("select a from Author a", Author.class);
        return query.getResultList();
    }
}
