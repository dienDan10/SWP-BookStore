package com.swp.bookstore.service;

import com.swp.bookstore.entity.OrderDetail;

public interface OrderDetailService {
    void addOrderDetail(OrderDetail orderDetail);
    void updateOrderDetail(OrderDetail orderDetail);
    OrderDetail findById(long id);
}
