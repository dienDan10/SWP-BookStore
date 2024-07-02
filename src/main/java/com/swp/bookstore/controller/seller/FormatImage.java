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
import java.util.List;

@WebServlet(name="FormatImage", urlPatterns = "/format")
public class FormatImage extends HttpServlet {
    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get all book
        List<Book> books = bookService.findAll();
        // format book image
        for (Book book : books) {
            String[] frontPart = book.getImageFront().split("/");
            String[] backPart = book.getImageBack().split("/");
            book.setImageFront(frontPart[frontPart.length - 1]);
            book.setImageBack(backPart[backPart.length - 1]);
        }
        // save book
        for(Book book : books){
            bookService.updateBook(book);
        }
        resp.sendRedirect(req.getContextPath() + "/manage-product");
    }
}
