package com.swp.bookstore.controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.service.CartService;
import com.swp.bookstore.service.serviceImpl.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

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
                increaseCart(cartId, resp);
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

    private void increaseCart(int cartId, HttpServletResponse resp) throws IOException {
        // get cart
        Cart cart = cartService.findCartById(cartId);
        // check for book quantity is less than cart quantity
        int bookNum = cart.getBook().getQuantity();
        if (bookNum <= cart.getQuantity()) {    // not increase cart quantity
            // send fail message
            sendFailMessage(resp);
            return;
        }
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

    private void sendFailMessage(HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json;charset=utf-8");
        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("message", "Số lượng sản phẩm không đủ");
        PrintWriter out = resp.getWriter();
        out.write(gson.toJson(jsonObject));
    }

}
