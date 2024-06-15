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

@WebServlet(name="ViewDeliveringOrder", urlPatterns = "/view-delivering-order")
public class ViewDeliveringOrder extends HttpServlet {
    private OrderService orderService;
    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get new order
        List<Order> deliveringOrders = orderService.findOrdersByStatus(OrderStatus.DANG_GIAO);
        // send to order management page
        req.setAttribute("orders", deliveringOrders);
        req.getRequestDispatcher("deliveringorder.jsp").forward(req, resp);
    }
}
