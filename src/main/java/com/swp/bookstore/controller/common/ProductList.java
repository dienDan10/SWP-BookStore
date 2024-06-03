package com.swp.bookstore.controller.common;

import com.swp.bookstore.config.Page;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.PublisherService;
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

@WebServlet(name="ProductList", urlPatterns = "/product-list")
public class ProductList extends HttpServlet {

    private BookService bookService;
    private CategoryService categoryService;
    private PublisherService publisherService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get first 10 product from database
        List<Book> books = bookService.getNextProductPage(Page.PAGE_SIZE, 0);
        // get category
        List<Category> categories = categoryService.findAll();
        // get publisher
        List<Publisher> publishers = publisherService.findAll();

        req.setAttribute("books", books);
        req.setAttribute("categories", categories);
        req.setAttribute("publishers", publishers);
        int currentPage = 1; // set current page to 1
        req.setAttribute("currentPage", currentPage);
        req.getRequestDispatcher("product-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
