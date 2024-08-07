package com.swp.bookstore.controller.common;

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

@WebServlet(name="FormatImage", urlPatterns = "/format-image")
public class FormatImage extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get all book from db
        List<Book> books = bookService.findAll();
        // update book image
        for (Book book : books) {
            // /img/book-image/name.jpeg --> name.jpeg
            String[] frontImages = book.getImageFront().split("/");
            String[] backImages = book.getImageBack().split("/");
            book.setImageFront(frontImages[frontImages.length-1]);
            book.setImageBack(backImages[backImages.length-1]);
            bookService.updateBook(book);
        }

    }
}
