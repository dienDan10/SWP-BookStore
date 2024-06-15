package com.swp.bookstore.service;

import com.swp.bookstore.entity.Address;
import com.swp.bookstore.entity.OrderAddress;

public interface OrderAddressService {
    OrderAddress saveOrderAddress(Address address);
}
