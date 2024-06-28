package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.CartDAO;
import com.swp.bookstore.dao.daoImpl.CartDAOImpl;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.service.CartService;

import java.util.List;

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

    @Override
    public Cart findCartByUserIdAndBookId(long userId, long bookId) {
        return cartDAO.findCartByUserIdAndBookId(userId, bookId);
    }

    @Override
    public List<Cart> findAllByUserId(long userId) {
        return cartDAO.findAllByUserId(userId);
    }

    @Override
    public List<Cart> findCartsByBookId(long bookId) { return cartDAO.findCartsByBookId(bookId); }
}
