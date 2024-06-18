package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import com.swp.bookstore.utils.PasswordEncryptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="ChangePassword", urlPatterns = "/change-password")
public class ChangePassword extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // get password information from request
        String oldPass = req.getParameter("old-password").trim();
        String newPass = req.getParameter("new-password").trim();

        // check for correct old password
        if (!user.getPassword().equals(PasswordEncryptor.toSHA256(oldPass))) {
            session.setAttribute("errMsg", "Old password incorrect");
            resp.sendRedirect( req.getContextPath() + "/view-profile");
            return;
        }

        // change password
        user.setPassword(PasswordEncryptor.toSHA256(newPass));
        userService.updateUser(user);
        session.setAttribute("successMsg", "Password changed successfully");
        resp.sendRedirect(req.getContextPath() + "/view-profile");

    }
}
