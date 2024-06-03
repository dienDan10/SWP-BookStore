package com.swp.bookstore.service;

import com.swp.bookstore.entity.Book;

import java.util.List;

public interface BookService {

    void updateBook(Book book);
    void deleteBook(int id);
    Book findById(int id);
    void addBook(Book book);
    List<Book> findBestSeller(int num);
    List<Book> getNextProductPage(int pageSize, int currentPage);
}