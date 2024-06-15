package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.OrderDetailDAO;
import com.swp.bookstore.dao.daoImpl.OrderDetailDAOImpl;
import com.swp.bookstore.entity.OrderDetail;
import com.swp.bookstore.service.OrderDetailService;

public class OrderDetailServiceImpl implements OrderDetailService {
    private OrderDetailDAO orderDetailDAO = new OrderDetailDAOImpl();

    @Override
    public void addOrderDetail(OrderDetail orderDetail) {
        orderDetailDAO.addOrderDetail(orderDetail);
    }

    @Override
    public void updateOrderDetail(OrderDetail orderDetail) {
        orderDetailDAO.updateOrderDetail(orderDetail);
    }

    @Override
    public OrderDetail findById(long id) {
        return orderDetailDAO.findById(id);
    }
}
