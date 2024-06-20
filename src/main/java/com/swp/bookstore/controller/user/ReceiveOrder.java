package com.swp.bookstore.controller.user;

import com.swp.bookstore.config.OrderStatus;
import com.swp.bookstore.config.PaymentStatus;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.entity.Payment;
import com.swp.bookstore.service.OrderService;
import com.swp.bookstore.service.PaymentService;
import com.swp.bookstore.service.serviceImpl.OrderServiceImpl;
import com.swp.bookstore.service.serviceImpl.PaymentServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name="ReceiveOrder", urlPatterns = "/receive-order")
public class ReceiveOrder extends HttpServlet {
    private OrderService orderService;
    private PaymentService paymentService;

    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
        paymentService = new PaymentServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");
        // get order
        Order order = orderService.findOrderById(Integer.parseInt(orderId));
        // update order status
        order.setStatus(OrderStatus.DA_NHAN);
        order.setReceivedTime(LocalDateTime.now());
        orderService.updateOrder(order);
        // update payment status
        Payment payment = order.getPayment();
        payment.setStatus(PaymentStatus.PAYED);
        paymentService.updatePayment(payment);
        // send to user orders page
        HttpSession session = req.getSession();
        session.setAttribute("page", "1");
        resp.sendRedirect(req.getContextPath() +  "/view-order");
    }
}
