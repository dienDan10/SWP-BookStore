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

@WebServlet(name="CancelOrder",urlPatterns="/cancel-order")
public class CancelOrder extends HttpServlet {
    private OrderService orderService;
    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get Order process by id
        String context = req.getContextPath();
        int id = Integer.parseInt(req.getParameter("id"));
        Order order = orderService.findOrderById(id);
        //update status order process
        order.setStatus(OrderStatus.DA_HUY);
        orderService.updateOrder(order);
        // send to order management page
        resp.sendRedirect(context + "/manage-order");
    }
}
