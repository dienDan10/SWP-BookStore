package com.swp.bookstore.controller.seller;


import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ManageProduct",urlPatterns = "/manage-product")
public class ManageProduct extends HttpServlet {

    private BookService bookService;
    private PublisherService publisherService;
    private CategoryService categoryService;
    private AuthorService authorService;


    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        publisherService = new PublisherServiceImpl();
        categoryService = new CategoryServiceImpl();
        authorService = new AuthorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get all book from database
        List<Book> books = bookService.findAll();
        List<Publisher> publishers = publisherService.findAll();
        List<Category> categories = categoryService.findAll();
        List<Author> authors = authorService.findAll();
        // format date for book
        books.forEach(book -> book.setPublishedDate(book.getPublishedDate().split(" ")[0]));
        //add book to request
        req.setAttribute("books", books);
        req.setAttribute("publishers", publishers);
        req.setAttribute("categories", categories);
        req.setAttribute("authors", authors);
        //send to product management page
        req.getRequestDispatcher("product-management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
