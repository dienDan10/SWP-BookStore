package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.BookDAO;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

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
    public List<Book> findBestSeller(int num) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b order by b.soldNum desc", Book.class);
        query.setFirstResult(0);
        query.setMaxResults(num);
        return query.getResultList();
    }

    @Override
    public List<Book> getNextProductPage(int pageSize, int currentPage) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b", Book.class);
        query.setFirstResult(currentPage * pageSize);
        query.setMaxResults(pageSize);
        List<Book> list = new ArrayList<>();
        try {

            list = query.getResultList();

        } catch (NoResultException e) {
            System.out.println("Cannot fetch next product page");
        } finally {
            em.close();
        }


        return list;
    }
}
