package com.swp.bookstore.controller.common;

import com.swp.bookstore.dto.UserDTO;
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

@WebServlet(name="Register", urlPatterns = "/register")
public class Register extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // check for email has been registered
        User user = userService.findOneByEmail(req.getParameter("email"));
        if (user != null) {
            req.setAttribute("emailExist", "Email này đã được đăng ký.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // generate otp code and save to session
        String OTP = RandomUtil.getOTPCode();
        session.setAttribute("OTP", OTP);
        // send email to user
        String mailContent = "Your OTP verification code is " + OTP;
        String mailHeader = "OTP Authentication Code.";
        boolean isSuccess = Email.sendEmail(req.getParameter("email"), mailHeader, mailContent);
        if (!isSuccess) { // send a notification
            req.setAttribute("sendMailError", "Không gửi được email xác minh, vui lòng thử tải lại.");
        }

        // create a user dto object and save to session
        UserDTO userdto = new UserDTO();
        userdto.setEmail(req.getParameter("email"));
        userdto.setPassword(req.getParameter("password"));
        userdto.setName(req.getParameter("name"));
        session.setAttribute("userdto", userdto);

        // redirect to otp verification
        resp.sendRedirect(req.getContextPath() + "/otp-verification");
    }


}
