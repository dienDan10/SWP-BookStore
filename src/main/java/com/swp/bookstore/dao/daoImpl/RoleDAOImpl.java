package com.swp.bookstore.dao.daoImpl;

import com.swp.bookstore.dao.RoleDAO;
import com.swp.bookstore.entity.Role;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class RoleDAOImpl implements RoleDAO {
    @Override
    public Role findRoleByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        TypedQuery<Role> query = em.createQuery("select r from Role r where r.name = :name", Role.class);
        query.setParameter("name", name);
        Role role = null;
        try {
            role = query.getSingleResult();
        } catch (NoResultException e) {
            System.out.println("No role found " + name);
        } finally {
            em.close();
        }
        return role;
    }
}
