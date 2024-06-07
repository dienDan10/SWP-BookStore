package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Address;

import java.util.List;

public interface AddressDAO {
    Address findById(long id);
    void save(Address address);
    void delete(long addressId);
    void update(Address address);
    List<Address> findAllByUserId(long userId);
    int countAddressByUserId(long userId);
    void setDefaultAddress(long addressId, long userId);
}
