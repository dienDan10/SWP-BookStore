package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Book;

public interface BookDAO {

    void addBook(Book book);
    void updateBook(Book book);
    void deleteBook(int id);
    Book findById(int id);
    Book getBookAndRaingsByBookID(int bookId);

}
