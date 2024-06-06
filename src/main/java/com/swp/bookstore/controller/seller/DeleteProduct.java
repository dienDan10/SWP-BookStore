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
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name="DeleteProduct",urlPatterns = "/delete-product")
public class DeleteProduct extends HttpServlet {

    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get bookid from request
        int bookId = Integer.parseInt(req.getParameter("bookId"));
        // get book from database
        Book book = bookService.findById(bookId);
        // delete book picture from server
        String imgFront = book.getImageFront();
        String imgBack = book.getImageBack();
        String path = req.getServletContext().getRealPath("");
        Path imageFrontPath = Path.of(path + imgFront);
        Path imageBackPath = Path.of(path + imgBack);
        if (Files.exists(imageFrontPath)) {
            Files.delete(imageFrontPath);
        }
        if (Files.exists(imageBackPath)) {
            Files.delete(imageBackPath);
        }
        //delete book
        bookService.deleteBook(bookId);
        //back to manage product
        resp.sendRedirect("/manage-product");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
