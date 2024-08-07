package com.swp.bookstore.controller.common;

import com.swp.bookstore.config.ROLES;
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
        // check for user login
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            resp.sendRedirect(req.getContextPath() + "/home-page");
            return;
        }
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = userService.findOneByEmail(email);
        if (user == null || !user.getPassword().equals(PasswordEncryptor.toSHA256(password))) { //display error message
            session.setAttribute("errMsg", "Email hoặc mật khẩu không hợp lệ.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        if (!user.isActive()) {
            session.setAttribute("errMsg", "Tài khoản của bạn đã bị khóa");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        session.setAttribute("user", user);
        session.setAttribute("successMsg", "Đăng nhập thành công!");

        if (user.hasRole(ROLES.SELLER)) {
            resp.sendRedirect( req.getContextPath() + "/view-dashboard");
            return;
        }

        resp.sendRedirect( req.getContextPath() + "/home-page");
    }
}
