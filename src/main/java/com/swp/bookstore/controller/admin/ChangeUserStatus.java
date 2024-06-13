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

@WebServlet(name="ChangeUserName", urlPatterns = "/change-user-status")
public class ChangeUserStatus extends HttpServlet{

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //Get user id
        String id = req.getParameter("id");
        //Get user
        User user = userService.findOneUserById(Long.parseLong(id));

        //Change user status
        user.setActive(!user.isActive());
        userService.updateUser(user);
        resp.sendRedirect("/manage-account");
    }
}
