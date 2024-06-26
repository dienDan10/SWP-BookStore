package com.swp.bookstore.service;

import com.swp.bookstore.entity.Address;

import java.util.List;

public interface AddressService {
    Address findById(long id);
    void save(Address address);
    void delete(long addressId);
    void update(Address address);
    List<Address> findAllByUserId(long userId);
    int countByUserId(long userId);
    void setDefaultAddress(long addressId, long userId);

}
