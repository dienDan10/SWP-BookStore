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

@WebServlet(name="UpdateAuthor", urlPatterns = "/update-author")
public class UpdateAuthor extends HttpServlet {

    //Initialize service
    private AuthorService authorService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        authorService = new AuthorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path
        String context = req.getContextPath();
        //Get author's information
        String id = req.getParameter("id");
        String authorName = req.getParameter("authorName");
        //Get a author that was chosen to update
        Author author = authorService.findById(Integer.parseInt(id));
        //Set Author object's info
        author.setName(authorName);
        authorService.updateAuthor(author);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
