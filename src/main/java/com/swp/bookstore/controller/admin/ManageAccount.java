package com.swp.bookstore.controller.admin;

import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name="ManageAccount", urlPatterns = "/manage-account")
public class ManageAccount extends HttpServlet {

    //Create instance of the class that can call the DAO class
    private UserService userService;

    //Initialization class
    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users= userService.findAllUsers();
        users.removeIf(user -> user.hasRole("ADMIN"));
        users.forEach(user -> {
            user.getRoles().sort((r1, r2) -> r1.getId() - r2.getId());
        });
        req.setAttribute("users", users);
        req.getRequestDispatcher("account-management.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
