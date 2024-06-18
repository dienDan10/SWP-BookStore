package com.swp.bookstore.controller.common;

import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import com.swp.bookstore.utils.Email;
import com.swp.bookstore.utils.RandomUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="ForgotPassword", urlPatterns = "/forgot-password")
public class ForgotPassword extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // verify authentication code
        String authenticationCode = session.getAttribute("authenticationCode").toString();
        String code = req.getParameter("code");
        if (authenticationCode == null || !authenticationCode.equals(code)) {         // display message
            req.getRequestDispatcher("ErrorPage.html").forward(req, resp);
            return;
        }
        // redirect to reset password page
        req.getRequestDispatcher("reset-password.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        // check if email exist with an user in the database
        User user = userService.findOneByEmail(email);
        if (user == null) {     // return to login page and display message
            req.setAttribute("emailError", "Sorry! Your email doesn't register with any account.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // create a reset password link to send to user via email
        String authenticationCode = RandomUtil.getOTPCode();
        String link = "http://localhost:8080" + req.getContextPath()+ "/forgot-password?code=" + authenticationCode;
        System.out.println(link);

        // save the authentication code and email in session
        HttpSession session = req.getSession();
        session.setAttribute("authenticationCode", authenticationCode);
        session.setAttribute("email", email);
        // send email
        String content = "<p>Click this link to change your password: <a href=\"" + link + "\">change_password</a></p>";
        boolean isSuccess = Email.sendEmail(req.getParameter("email"), "Reset Password", content);
        if (!isSuccess) {   // return to login and display message.
            req.setAttribute("emailError", "Can't send email! please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // redirect to the reset password page
        session.setAttribute("successMsg", "Success! please check your email");
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}
