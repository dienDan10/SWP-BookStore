package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.OrderDAO;
import com.swp.bookstore.dao.daoImpl.OrderDAOImpl;
import com.swp.bookstore.entity.Order;
import com.swp.bookstore.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrderDAO orderDAO = new OrderDAOImpl();

    @Override
    public Order saveOrder(Order order) {
        return orderDAO.saveOrder(order);
    }

    @Override
    public void updateOrder(Order order) {
        orderDAO.updateOrder(order);
    }

    @Override
    public void deleteOrder(long id) {
        orderDAO.deleteOrder(id);
    }

    @Override
    public Order findOrderById(long id) {
        return orderDAO.findOrderById(id);
    }

    @Override
    public List<Order> findOrdersByUserId(long userId) {
        return orderDAO.findOrdersByUserId(userId);
    }

    @Override
    public List<Order> findOrdersByUserIdAndStatus(long userId, String status) {
        return orderDAO.findOrdersByUserIdAndStatus(userId, status);
    }

    @Override
    public List<Order> findOrdersByStatus(String status) {
        return orderDAO.findOrderByStatus(status);
    }

    @Override
    public long countOrders() {
        return orderDAO.findOrderCount();
    }
}
