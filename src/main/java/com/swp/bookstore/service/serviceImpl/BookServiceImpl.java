package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.BookDAO;
import com.swp.bookstore.dao.daoImpl.BookDAOImpl;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDAO bookDAO = new BookDAOImpl();

    @Override
    public void updateBook(Book book) {
        bookDAO.updateBook(book);
    }

    @Override
    public void deleteBook(int id) {
        bookDAO.deleteBook(id);
    }

    @Override
    public Book findById(int id) {
        return bookDAO.findById(id);
    }

    @Override
    public void addBook(Book book) {
        bookDAO.addBook(book);
    }

    @Override
    public List<Book> findBestSeller(int num) {
        return bookDAO.findBestSeller(num);
    }
}
