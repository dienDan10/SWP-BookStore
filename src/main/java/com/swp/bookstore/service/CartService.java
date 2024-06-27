package com.swp.bookstore.service;

import com.swp.bookstore.entity.Cart;

import java.util.List;

public interface CartService {
    void addCart(Cart cart);
    void removeCart(long id);
    Cart findCartById(long id);
    void updateCart(Cart cart);
    Cart findCartByUserIdAndBookId(long userId, long bookId);
    List<Cart> findAllByUserId(long userId);
    List<Cart> findCartsByBookId(long bookId);
}
