package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="DeletePublisher",urlPatterns = "/delete-publisher")
public class DeletePublisher extends HttpServlet {

    private PublisherService publisherService;
    private BookService bookService;
    @Override
    public void init() throws ServletException {
        publisherService = new PublisherServiceImpl();
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        //get context path
        String context = req.getContextPath();
        //get publisherid from request
        int publisherId = Integer.parseInt(req.getParameter("publisherId"));
        try{
            //get all book with publisher id
            List<Book> books = bookService.getBookByPublisherId(publisherId);
            //update book with publisher
            for (Book book : books) {
                book.setPublisher(null);
                book.setActive(false);
                bookService.updateBook(book);
            }
            //delete Publisher by publisher id
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
