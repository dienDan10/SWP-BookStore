package com.swp.bookstore.controller.seller;

import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="DeletePublisher",urlPatterns = "/delete-publisher")
public class DeletePublisher extends HttpServlet {

    private PublisherService publisherService;
    @Override
    public void init() throws ServletException {
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //get context path
        String context = req.getContextPath();
        //get publisherid from request
        int publisherId = Integer.parseInt(req.getParameter("publisherId"));
        try{
            publisherService.deletePublisher(publisherId);
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
