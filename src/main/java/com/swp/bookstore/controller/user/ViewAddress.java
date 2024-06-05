package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.Address;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.AddressService;
import com.swp.bookstore.service.serviceImpl.AddressServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name="ViewAddress", urlPatterns = "/view-address")
public class ViewAddress extends HttpServlet {

    private AddressService addressService;

    @Override
    public void init() throws ServletException {
        addressService = new AddressServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // get all address by user id
        List<Address> addresses = addressService.findAllByUserId(user.getId());
        // save address to request
        req.setAttribute("addresses", addresses);
        // send to address page
        req.getRequestDispatcher("manage-address.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
