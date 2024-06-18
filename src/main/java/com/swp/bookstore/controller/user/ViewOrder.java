package com.swp.bookstore.controller.user;

import com.swp.bookstore.config.OrderStatus;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.OrderService;
import com.swp.bookstore.service.serviceImpl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name="ViewOrder", urlPatterns = "/view-order")
public class ViewOrder extends HttpServlet {

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // get orders by status
        List<Order> processingOrders = orderService.findOrdersByUserIdAndStatus(user.getId(), OrderStatus.DANG_XU_LY);
        List<Order> deliveringOrders = orderService.findOrdersByUserIdAndStatus(user.getId(), OrderStatus.DANG_GIAO);
        List<Order> receivedOrders = orderService.findOrdersByUserIdAndStatus(user.getId(), OrderStatus.DA_NHAN);
        List<Order> cancelledOrders = orderService.findOrdersByUserIdAndStatus(user.getId(), OrderStatus.DA_HUY);
        // sort order by newest
        Collections.reverse(processingOrders);
        Collections.reverse(deliveringOrders);
        Collections.reverse(cancelledOrders);
        // save to request
        req.setAttribute("processingOrders", processingOrders);
        req.setAttribute("deliveringOrders", deliveringOrders);
        req.setAttribute("receivedOrders", receivedOrders);
        req.setAttribute("cancelledOrders", cancelledOrders);
        // send to user-orders page
        req.getRequestDispatcher("user-orders.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
