package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Book;

import java.util.List;

public interface BookDAO {

    void addBook(Book book);
    void updateBook(Book book);
    void deleteBook(int id);
    Book findById(int id);
    List<Book> findBestSeller(int num);
    List<Book> getNextProductPage(int pageSize, int currentPage);
}
