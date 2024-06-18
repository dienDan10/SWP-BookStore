package com.swp.bookstore.controller.seller;

import com.swp.bookstore.config.OrderStatus;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.entity.OrderDetail;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.OrderService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.OrderServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name= "AcceptOrder", urlPatterns = "/accept-order")
public class AcceptOrder extends HttpServlet {

    //Create Service's Instance
    private OrderService orderService;
    private BookService bookService;

    //Initialize
    @Override
    public void init() throws ServletException {
        orderService = new OrderServiceImpl();
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path
        String context = req.getContextPath();

        //Get order by Id then accept it
        String orderId = req.getParameter("orderId");
        Order order = orderService.findOrderById(Long.parseLong(orderId));
        List<OrderDetail> orderDetails = order.getOrderDetails();
        for (OrderDetail orderDetail : orderDetails) {
            Book book = bookService.findById(orderDetail.getBookId());
            if(orderDetail.getQuantity() <= book.getQuantity()) {
                book.setQuantity(book.getQuantity() - orderDetail.getQuantity());
            } else {
                book.setQuantity(0);
            }
            bookService.updateBook(book);
        }
        order.setStatus(OrderStatus.DANG_GIAO);
        orderService.updateOrder(order);
        resp.sendRedirect(context + "/manage-order");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
