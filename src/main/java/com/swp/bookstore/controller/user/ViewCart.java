package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.CartService;
import com.swp.bookstore.service.serviceImpl.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="ViewCart", urlPatterns = "/view-cart")
public class ViewCart extends HttpServlet {
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user from session
        HttpSession session = req.getSession();
        User user  = (User) session.getAttribute("user");
        // get all cart item of user
        List<Cart> carts = cartService.findAllByUserId(user.getId());
        // check for no item in cart
        if (carts == null) { // return a empty list
            carts = new ArrayList<>();
        }
        for (Cart cart : carts) {
            if (cart.getQuantity() > cart.getBook().getQuantity()) {
                cart.setQuantity(cart.getBook().getQuantity());
                cartService.updateCart(cart);
            }
        }
        // send cart to view cart page
        req.setAttribute("carts", carts);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
