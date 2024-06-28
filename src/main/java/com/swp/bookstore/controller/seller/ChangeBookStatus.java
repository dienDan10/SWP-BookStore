package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ChangeBookStatus", urlPatterns = "/change-book-status")
public class ChangeBookStatus extends HttpServlet {

    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("bookId"));
        Book book = bookService.findById(id);
        book.setActive(!book.isActive());
        bookService.updateBook(book);
        resp.sendRedirect(req.getContextPath() + "/manage-product");
    }
}
