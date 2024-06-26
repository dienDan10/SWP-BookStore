package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="UpdatePublisher", urlPatterns = "/update-publisher")
public class UpdatePublisher extends HttpServlet {

    //Initialize service
    PublisherService publisherService;

    public void init(ServletConfig config) throws ServletException{
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //Get context path
        String context = req.getContextPath();
        //Get publisher's information
        String id = req.getParameter("id");
        String bookName = req.getParameter("publisherName");
        //Get a book that was chosen to update
        Publisher publisher = publisherService.findById(Integer.parseInt(id));
        //Set Publisher object's info
        publisher.setName(bookName);
        publisherService.updatePublisher(publisher);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
