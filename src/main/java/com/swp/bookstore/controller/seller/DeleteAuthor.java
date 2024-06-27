package com.swp.bookstore.controller.seller;

import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="DeleteAuthor",urlPatterns = "/delete-author")
public class DeleteAuthor extends HttpServlet {
    //Initialize service
    private AuthorService authorService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        authorService = new AuthorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get context path
        String context = req.getContextPath();
        //get authorid from request
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        try{
            authorService.deleteAuthor(authorId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
