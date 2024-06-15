package com.swp.bookstore.controller.seller;

import com.swp.bookstore.config.OrderStatus;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.service.OrderService;
import com.swp.bookstore.service.serviceImpl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ManageOrder", urlPatterns = "/manage-order")
public class ManageOrder extends HttpServlet {
    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get new order
        List<Order> newOrders = orderService.findOrdersByStatus(OrderStatus.DANG_XU_LY);
        // send to order management page
        req.setAttribute("orders", newOrders);
        req.getRequestDispatcher("order-management.jsp").forward(req, resp);
    }
}
