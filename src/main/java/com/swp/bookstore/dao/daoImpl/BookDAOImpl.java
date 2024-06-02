package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.BookDAO;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class BookDAOImpl implements BookDAO {

    @Override
    public void addBook(Book book) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void updateBook(Book book) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteBook(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Book book = em.find(Book.class, id);
            em.remove(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public Book findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        return em.find(Book.class, id);
    }

    @Override
    public Book getBookAndRaingsByBookID(int bookId) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        TypedQuery<Book> query = em.createQuery("select b from Book b join fetch Rating where b.id = :id", Book.class);
        return query.getSingleResult();
    }
}
