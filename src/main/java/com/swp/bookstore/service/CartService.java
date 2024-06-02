package com.swp.bookstore.service;

import com.swp.bookstore.entity.Cart;

public interface CartService {
    void addCart(Cart cart);
    void removeCart(long id);
    Cart findCartById(long id);
    void updateCart(Cart cart);

}
