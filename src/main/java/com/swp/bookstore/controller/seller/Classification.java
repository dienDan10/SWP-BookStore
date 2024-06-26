package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="Classification",urlPatterns = "/classification")
public class Classification extends HttpServlet {
    private CategoryService categoryService;
    private PublisherService publisherService;
    private AuthorService authorService;

    @Override
    public void init() throws ServletException {
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
        authorService = new AuthorServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get all category,publisher,author from database
        List<Category> categories = categoryService.findAll();
        List<Publisher> publishers = publisherService.findAll();
        List<Author> authors = authorService.findAll();
        //add category,publisher,author to request
        req.setAttribute("categories", categories);
        req.setAttribute("publishers", publishers);
        req.setAttribute("authors", authors);
        //send to product management page
        req.getRequestDispatcher("classification.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
