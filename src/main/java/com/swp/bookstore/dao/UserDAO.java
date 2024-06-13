package com.swp.bookstore.dao;

import com.swp.bookstore.entity.User;

import java.util.List;

public interface UserDAO {
    /*
     * Find a user by email
     * return a user instance if found, null otherwise
     * */
    User findByEmail(String email);

    void save(User user);

    void update(User user);

    List<User> findAll();

    User findById(long id);
}
