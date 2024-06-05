package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.AddressDAO;
import com.swp.bookstore.entity.Address;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class AddressDAOImpl implements AddressDAO {

    @Override
    public Address findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        return em.find(Address.class, id);
    }

    @Override
    public void save(Address address) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        try {
            em.persist(address);
            em.getTransaction().commit();
        } catch (NoResultException e) {
            em.getTransaction().rollback();
            System.out.println("Save Address Failed");
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(int addressId) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        try {
            Address address = em.find(Address.class, addressId);
            em.remove(address);
            em.getTransaction().commit();
        } catch (NoResultException e) {
            em.getTransaction().rollback();
            System.out.println("Remove Address Failed");
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Address address) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        try {
            em.merge(address);
            em.getTransaction().commit();
        } catch (NoResultException e) {
            em.getTransaction().rollback();
            System.out.println("Update Address Failed");
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Address> findAllByUserId(long userId) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Address> query = em.createQuery("select a from Address a where a.userId = :userId", Address.class);
        query.setParameter("userId", userId);
        List<Address> addressList = new ArrayList<>();
        try {
            addressList = query.getResultList();
        } catch (NoResultException e) {
            System.out.println("Find All Address By user Id Failed");
            e.printStackTrace();
        } finally {
            em.close();
        }
        return addressList;
    }
}
