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

@WebServlet(name="Login", urlPatterns = "/login")
public class Login extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userService.findOneByEmail(email);
        System.out.println(user);
        if (user == null || !user.getPassword().equals(PasswordEncryptor.toSHA256(password))) { //display error message
            session.setAttribute("errMsg", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        session.setAttribute("user", user);
        session.setAttribute("successMsg", "Login successful!");
        resp.sendRedirect("/home-page");
    }
}
