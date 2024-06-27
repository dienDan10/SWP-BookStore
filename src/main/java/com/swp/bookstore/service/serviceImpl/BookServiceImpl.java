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
    public void deleteBook(long id) {
        bookDAO.deleteBook(id);
    }

    @Override
    public Book findById(long id) {
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

    @Override
    public List<Book> getNextProductPage(int pageSize, int currentPage) {
        return bookDAO.getNextProductPage(pageSize, currentPage);
    }

    @Override
    public List<Book> getBookByCategoryByPage(int pageSize, int currentPage, int categoryId) {
        return bookDAO.getBookByCategoryByPage(pageSize,currentPage,categoryId);
    }

    @Override
    public List<Book> getBookByPublisherByPage(int pageSize, int currentPage, int publisherId) {
        return bookDAO.getBookByPublisherByPage(pageSize,currentPage,publisherId);
    }

    @Override
    public List<Book> getBookBySearchByPage(int pageSize, int currentPage, String search) {
        return bookDAO.getBookBySearchByPage(pageSize,currentPage,search);
    }

    @Override
    public List<Book> findAll() {
        return bookDAO.findAll();
    }

    @Override
    public long countBooks() {
        return bookDAO.countBooks();
    }

    @Override
    public void deactivateBook(long id) { bookDAO.deactivateBook(id); }
}
