package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Book;

import java.util.List;

public interface BookDAO {

    void addBook(Book book);
    void updateBook(Book book);
    void deleteBook(long id);
    Book findById(long id);
    List<Book> findBestSeller(int num);
    List<Book> getNextProductPage(int pageSize, int currentPage);
    List<Book> getBookByCategoryByPage(int pageSize, int currentPage, int categoryId);
    List<Book> getBookByPublisherByPage(int pageSize, int currentPage, int publisherId);
    List<Book> getBookBySearchByPage(int pageSize, int currentPage, String search);
    List<Book> findAll();
    long countBooks();
    void deactivateBook(long id);
}
