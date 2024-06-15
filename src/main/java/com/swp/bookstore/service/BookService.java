package com.swp.bookstore.service;

import com.swp.bookstore.entity.Book;

import java.util.List;

public interface BookService {

    void updateBook(Book book);
    void deleteBook(long id);
    Book findById(long id);
    void addBook(Book book);
    List<Book> findBestSeller(int num);
    List<Book> getNextProductPage(int pageSize, int currentPage);
    List<Book> getBookByCategoryByPage(int pageSize, int currentPage, int categoryId);
    List<Book> getBookByPublisherByPage(int pageSize, int currentPage, int publisherId);
    List<Book> getBookBySearchByPage(int pageSize, int currentPage, String search);
    List<Book> findAll();
}
