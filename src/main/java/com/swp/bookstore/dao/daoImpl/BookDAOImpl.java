package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.BookDAO;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.*;

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
    public void deleteBook(long id) {
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
    public Book findById(long id) {
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

    @Override
    public List<Book> getBookByCategoryByPage(int pageSize, int currentPage, int categoryId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b where b.category.id = :categoryId", Book.class);
        query.setParameter("categoryId", categoryId);
        query.setFirstResult(currentPage * pageSize);
        query.setMaxResults(pageSize);
        List<Book> list = new ArrayList<>();
        try {

            list = query.getResultList();

        } catch (NoResultException e) {
            System.out.println("Cannot fetch next product page by category");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public List<Book> getBookByPublisherByPage(int pageSize, int currentPage, int publisherId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b where b.publisher.id = :publisherId", Book.class);
        query.setParameter("publisherId", publisherId);
        query.setFirstResult(currentPage * pageSize);
        query.setMaxResults(pageSize);
        List<Book> list = new ArrayList<>();
        try {

            list = query.getResultList();

        } catch (NoResultException e) {
            System.out.println("Cannot fetch next product page by publisher");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public List<Book> getBookBySearchByPage(int pageSize, int currentPage, String search) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b where lower(b.name) like :search", Book.class);
        query.setParameter("search", "%" + search.toLowerCase() + "%");
        query.setFirstResult(currentPage * pageSize);
        query.setMaxResults(pageSize);
        List<Book> list = new ArrayList<>();
        try {

            list = query.getResultList();

        } catch (NoResultException e) {
            System.out.println("Cannot fetch next product page by search");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return list;
    }

    @Override
    public List<Book> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("select b from Book b", Book.class);
        return query.getResultList();
    }

    @Override
    public long countBooks() {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        Query query = em.createQuery("select count(o) from Book o");
        long count = 0;
        try {
            tx.begin();
            count = (long) query.getSingleResult();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            System.out.println("Cannot find order");
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public void deactivateBook(long id) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Book book = em.find(Book.class, id);
            book.setActive(false);
            em.merge(book);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
    public List<Book> getBookByCategory(int categoryId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b WHERE b.category.id = :categoryId", Book.class);
        query.setParameter("categoryId", categoryId);
        List<Book> books = new ArrayList<>();
        try {
            books = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("No books found for the given category");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }

    public List<Book> getBookByPublisherId(int publisherId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b WHERE b.publisher.id = :publisherId", Book.class);
        query.setParameter("publisherId", publisherId);
        List<Book> books = new ArrayList<>();
        try {
            books = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("No books found for the given publisher");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }

    public List<Book> getBookByAuthorId(int authorId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Book> query = em.createQuery("SELECT b FROM Book b WHERE b.author.id = :authorId", Book.class);
        query.setParameter("authorId", authorId);
        List<Book> books = new ArrayList<>();
        try {
            books = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("No books found for the given author");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return books;
    }
}
