package com.swp.bookstore.dao;

import com.swp.bookstore.entity.OrderDetail;

public interface OrderDetailDAO {
    void addOrderDetail(OrderDetail orderDetail);
    void updateOrderDetail(OrderDetail orderDetail);
    OrderDetail findById(long id);
}
