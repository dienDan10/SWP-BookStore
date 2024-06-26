package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.PublisherDAO;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class PublisherDAOImpl implements PublisherDAO {
    @Override
    public List<Publisher> findAll() {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Publisher> query = em.createQuery("select a from Publisher a", Publisher.class);
        return query.getResultList();
    }

    @Override
    public Publisher findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        Publisher publisher = em.find(Publisher.class, id);
        return publisher;
    }

    @Override
    public Publisher findByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        TypedQuery<Publisher> query = em.createQuery("select p from Publisher p where lower(p.name) = :name", Publisher.class);
        query.setParameter("name", name.toLowerCase());
        Publisher publisher = null;
        try {
            tx.begin();
            publisher = query.getSingleResult();
            tx.commit();
        } catch (NoResultException e) {
            tx.rollback();
            System.out.println("Cannot find publisher with name " + name);
            e.printStackTrace();
        } finally {
            em.close();
        }
        return publisher;
    }

    @Override
    public void addPublisher(Publisher publisher) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.persist(publisher);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void updatePublisher(Publisher publisher) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            em.merge(publisher);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void deletePublisher(int id){
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Publisher publisher = em.find(Publisher.class, id);
            em.remove(publisher);
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}
