package com.swp.bookstore.service;

import com.swp.bookstore.entity.Book;

public interface BookService {

    void updateBook(Book book);
    void deleteBook(int id);
    Book findById(int id);
    void addBook(Book book);
    Book getBookAndRaingsByBookID(int bookId);
}
