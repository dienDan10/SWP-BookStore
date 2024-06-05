package com.swp.bookstore.service;

import com.swp.bookstore.entity.Address;

import java.util.List;

public interface AddressService {
    Address findById(int id);
    void save(Address address);
    void delete(int addressId);
    void update(Address address);
    List<Address> findAllByUserId(long userId);

}
