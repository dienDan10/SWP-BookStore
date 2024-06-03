package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.service.CartService;
import com.swp.bookstore.service.serviceImpl.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="UpdateCart", urlPatterns = "/update-cart")
public class UpdateCart extends HttpServlet {

    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cartId = Integer.parseInt(req.getParameter("cartId"));
        String action = req.getParameter("action");

        switch (action) {
            case "plus":
                increaseCart(cartId);
                break;
            case "minus":
                decreaseCart(cartId);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }

    private void increaseCart(int cartId) {
        // get cart
        Cart cart = cartService.findCartById(cartId);
        // update cart
        cart.setQuantity(cart.getQuantity() + 1);
        cartService.updateCart(cart);
    }

    private void decreaseCart(int cartId) {
        // get cart
        Cart cart = cartService.findCartById(cartId);
        // update cart
        if (cart.getQuantity() <= 1) {
            return;
        }
        cart.setQuantity(cart.getQuantity() - 1);
        cartService.updateCart(cart);
    }
}
