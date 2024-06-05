package com.swp.bookstore.service;

import com.swp.bookstore.entity.Author;

import java.util.List;

public interface AuthorService {
    List<Author> findAll();
    void addAuthor(Author author);
    Author findAuthorByName(String name);
}
