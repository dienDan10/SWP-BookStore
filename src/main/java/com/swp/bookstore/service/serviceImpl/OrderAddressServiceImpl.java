package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.OrderAddressDAO;
import com.swp.bookstore.dao.daoImpl.OrderAddressDAOImpl;
import com.swp.bookstore.entity.Address;
import com.swp.bookstore.entity.OrderAddress;
import com.swp.bookstore.service.OrderAddressService;

public class OrderAddressServiceImpl implements OrderAddressService {

    private OrderAddressDAO orderAddressDAO = new OrderAddressDAOImpl();

    @Override
    public OrderAddress saveOrderAddress(Address address) {
        // create order address
        OrderAddress orderAddress = new OrderAddress();
        orderAddress.setReceiver(address.getReceiver());
        orderAddress.setPhone(address.getPhone());
        orderAddress.setProvince(address.getProvince());
        orderAddress.setDistrict(address.getDistrict());
        orderAddress.setTown(address.getTown());
        orderAddress.setVillage(address.getVillage());
        orderAddress.setDetail(address.getDetail());
        // save order address
        return orderAddressDAO.saveOrderAddress(orderAddress);
    }
}
