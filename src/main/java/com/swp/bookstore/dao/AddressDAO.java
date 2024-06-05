package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Address;

import java.util.List;

public interface AddressDAO {
    Address findById(int id);
    void save(Address address);
    void delete(int addressId);
    void update(Address address);
    List<Address> findAllByUserId(long userId);
}
