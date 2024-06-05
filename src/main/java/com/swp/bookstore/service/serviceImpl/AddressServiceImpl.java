package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.AddressDAO;
import com.swp.bookstore.dao.daoImpl.AddressDAOImpl;
import com.swp.bookstore.entity.Address;
import com.swp.bookstore.service.AddressService;

import java.util.List;

public class AddressServiceImpl implements AddressService {

    private AddressDAO addressDAO = new AddressDAOImpl();

    @Override
    public Address findById(int id) {
        return addressDAO.findById(id);
    }

    @Override
    public void save(Address address) {
        addressDAO.save(address);
    }

    @Override
    public void delete(int addressId) {
        addressDAO.delete(addressId);
    }

    @Override
    public void update(Address address) {
        addressDAO.update(address);
    }

    @Override
    public List<Address> findAllByUserId(long userId) {
        return addressDAO.findAllByUserId(userId);
    }
}
