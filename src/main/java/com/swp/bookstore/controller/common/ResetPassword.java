package com.swp.bookstore.controller.common;

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

@WebServlet(name="ResetPassword", urlPatterns = "/reset-password")
public class ResetPassword extends HttpServlet {

    UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        // get email from session
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        // remove email from session
        session.removeAttribute("email");
        // remove authentication code from session
        session.removeAttribute("authenticationCode");
        // change user password
        User user = userService.findOneByEmail(email);
        user.setPassword(PasswordEncryptor.toSHA256(password));
        userService.updateUser(user);
        session.setAttribute("successMsg", "Đặt lại mật khẩu thành công");
        resp.sendRedirect( req.getContextPath() + "/login");
    }
}
