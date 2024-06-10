package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.Address;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.AddressService;
import com.swp.bookstore.service.CartService;
import com.swp.bookstore.service.serviceImpl.AddressServiceImpl;
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

@WebServlet(name="Checkout", urlPatterns = "/checkout")
public class Checkout extends HttpServlet {
    private CartService cartService;
    private AddressService addressService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
        addressService = new AddressServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // check if user has any addresses
        List<Address> addresses = addressService.findAllByUserId(user.getId());
        if (addresses.size() == 0) {    // ask user to create an address
            session.setAttribute("invalidMsg", "Bạn cần tạo địa chỉ trước!");
            resp.sendRedirect("/view-address");
            return;
        }
        // get all item id
        String[] itemIds = req.getParameterValues("id");
        // get items from cart
        List<Cart> items = new ArrayList<>();
        for (String itemId : itemIds) {
            items.add(cartService.findCartById(Integer.parseInt(itemId)));
        }

        // send to confirm page
        req.setAttribute("items", items);
        req.setAttribute("addresses", addresses);
        req.getRequestDispatcher("/checkout.jsp").forward(req, resp);
    }
}
