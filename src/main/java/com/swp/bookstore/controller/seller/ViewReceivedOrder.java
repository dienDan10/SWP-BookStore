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
import java.util.Collections;
import java.util.List;

@WebServlet(name="ViewReceivedOrder", urlPatterns = "/view-received-order")
public class ViewReceivedOrder extends HttpServlet {
    private OrderService orderService;
    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get new order
        List<Order> receivedOrders = orderService.findOrdersByStatus(OrderStatus.DA_NHAN);
        Collections.sort(receivedOrders, (o1, o2) -> {
            return o1.getReceivedTime().isAfter(o2.getReceivedTime()) ? -1 : 1;
        });
        // send to order management page
        req.setAttribute("orders", receivedOrders);
        req.getRequestDispatcher("receivedorder.jsp").forward(req, resp);
    }
}
