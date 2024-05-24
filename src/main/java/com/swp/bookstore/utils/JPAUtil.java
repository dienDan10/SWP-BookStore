package com.swp.bookstore.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {

    private static EntityManagerFactory emf;

    static {
        emf = Persistence.createEntityManagerFactory("default");
    }

    private JPAUtil() {

    }

    public static EntityManager getEntityManager() {
        if (emf == null || !emf.isOpen()) { // create entity manager factory
            emf = Persistence.createEntityManagerFactory("default");
        }

        return emf.createEntityManager();
    }

//    public static void shutDown() {
//        if (emf != null && emf.isOpen()) {
//            emf.close();
//        }
//    }

}
