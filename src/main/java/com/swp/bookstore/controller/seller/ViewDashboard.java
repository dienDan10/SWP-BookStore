package com.swp.bookstore.controller.seller;

import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.OrderService;
import com.swp.bookstore.service.RatingService;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.OrderServiceImpl;
import com.swp.bookstore.service.serviceImpl.RatingServiceImpl;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ViewDashboard",urlPatterns = "/view-dashboard")
public class ViewDashboard extends HttpServlet {
    private BookService bookService;
    private OrderService orderService;
    private UserService userService;
    private RatingService ratingService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        orderService = new OrderServiceImpl();
        userService = new UserServiceImpl();
        ratingService = new RatingServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long orderNumber = orderService.countOrders();
        long bookNumber = bookService.countBooks();
        long userNumber = userService.countUsers();
        req.setAttribute("orderNumber", orderNumber);
        req.setAttribute("bookNumber", bookNumber);
        req.setAttribute("userNumber", userNumber);
        req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
