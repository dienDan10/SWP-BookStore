package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Order;

import java.util.List;

public interface OrderDAO {

    Order saveOrder(Order order);
    void updateOrder(Order order);
    void deleteOrder(long id);
    Order findOrderById(long id);
    List<Order> findOrdersByUserId(long userId);
    List<Order> findOrdersByUserIdAndStatus(long userId, String status);
    List<Order> findOrderByStatus(String status);
    long findOrderCount();
}
