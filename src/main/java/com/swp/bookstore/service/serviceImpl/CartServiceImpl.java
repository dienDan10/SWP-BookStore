package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.CartDAO;
import com.swp.bookstore.dao.daoImpl.CartDAOImpl;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.service.CartService;

public class CartServiceImpl implements CartService {
    private CartDAO cartDAO = new CartDAOImpl();

    @Override
    public void addCart(Cart cart) {
        cartDAO.addCart(cart);
    }

    @Override
    public void removeCart(long id) {
        cartDAO.removeCart(id);
    }

    @Override
    public Cart findCartById(long id) {
        return cartDAO.findCartById(id);
    }

    @Override
    public void updateCart(Cart cart) {
        cartDAO.updateCart(cart);
    }
}
