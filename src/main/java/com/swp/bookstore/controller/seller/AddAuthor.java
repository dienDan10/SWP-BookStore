package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Author;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="AddAuthor",urlPatterns="/add-author")
public class AddAuthor extends HttpServlet {

    //Initialize service
    private AuthorService authorService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        authorService = new AuthorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path string
        String context = req.getContextPath();
        //Get author's information
        String authorName = req.getParameter("authorName");
        //Create new Author
        Author author = new Author();
        author.setName(authorName);
        authorService.addAuthor(author);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
