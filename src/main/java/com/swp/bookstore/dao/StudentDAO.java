package com.swp.bookstore.dao;

import com.swp.bookstore.Student;
import com.swp.bookstore.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class StudentDAO {
    private EntityManager em = JPAUtil.getEntityManager();

    public List<Student> getStudents() {
        TypedQuery<Student> query = em.createQuery("select u from Student u", Student.class);
        query.setFirstResult(5).setMaxResults(5);
        return query.getResultList();
    }

    public int count() {
        TypedQuery<Student> query = em.createQuery("select count(u) from Student u", Student.class);
        return query.getResultList().size();
    }
}
