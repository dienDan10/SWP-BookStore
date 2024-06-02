package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Cart;

public interface CartDAO {
    void addCart(Cart cart);
    void removeCart(long id);
    Cart findCartById(long id);
    void updateCart(Cart cart);

}
