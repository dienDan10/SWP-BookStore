package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="AddPublisher",urlPatterns="/add-publisher")
public class AddPublisher extends HttpServlet {

    //Initilize service
    private PublisherService publisherService;

    @Override
    public void init() throws ServletException {
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path string
        String context = req.getContextPath();
        //Get publisher's information
        String publisherName = req.getParameter("publisherName");
        // Create new Publisher
        Publisher publisher = new Publisher();
        publisher.setName(publisherName);
        publisherService.addPublisher(publisher);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
