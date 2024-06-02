package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Author;

import java.util.List;

public interface AuthorDAO {
    List<Author> findAll();
}
