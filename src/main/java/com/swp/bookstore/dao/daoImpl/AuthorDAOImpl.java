package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.AuthorDAO;
import com.swp.bookstore.entity.Author;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class AuthorDAOImpl implements AuthorDAO {
    @Override
    public List<Author> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Author> query = em.createQuery("select a from Author a", Author.class);
        return query.getResultList();
    }

    @Override
    public void addAuthor(Author author) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(author);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Author findAuthorByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Author> query = em.createQuery("select a from Author a where lower(a.name) = :name", Author.class);
        query.setParameter("name", name.trim().toLowerCase());
        Author author = null;
        try {
            author = query.getSingleResult();
        } catch (NoResultException e) {
            System.out.println("NoResultException By AuthorName");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return author;
    }

    @Override
    public void updateAuthor(Author author) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(author);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteAuthor(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Author author = em.find(Author.class, id);
            em.remove(author);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Author findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        Author author = em.find(Author.class, id);
        return author;
    }
}
