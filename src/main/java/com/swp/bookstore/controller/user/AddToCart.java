package com.swp.bookstore.controller.user;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.CartService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.CartServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="AddToCart", urlPatterns = "/add-to-cart")
public class AddToCart extends HttpServlet {

    private CartService cartService;
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("id");
        String amount = req.getParameter("amount");
        // get user from session
        User user = (User) req.getSession().getAttribute("user");

        // check if user already have this item in cart
        Cart item = cartService.findCartByUserIdAndBookId(user.getId(), Integer.parseInt(bookId));
        System.out.println(item);
        if (item != null) { // update quantity in cart
            item.setQuantity(item.getQuantity() + Integer.parseInt(amount));
            cartService.updateCart(item);
        } else {    // create a new cart item
            item = new Cart();
            item.setQuantity(Integer.parseInt(amount));
            Book book = bookService.findById(Integer.parseInt(bookId));
            item.setBook(book);
            item.setUserId(user.getId());
            cartService.addCart(item);
        }

        // send success message
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        Gson gson = new Gson();
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("successMsg", "Add to cart successfully");
        out.print(gson.toJson(jsonObject));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
