package com.swp.bookstore.controller.common;

import com.swp.bookstore.dto.UserDTO;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="OTPVerification", urlPatterns = "/otp-verification")
public class OTPVerification extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserDTO userdto = (UserDTO) session.getAttribute("userdto");
        if (userdto == null) {  // redirect to page not found.
            System.out.println("OTP verification failed");
            req.getRequestDispatcher("ErrorPage.html").forward(req, resp);
        }

        // redirect to otp verification form
        req.getRequestDispatcher("otp-verification.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // verify the otp
        HttpSession session = req.getSession();
        String OTP = session.getAttribute("OTP").toString();
        String otpInput = req.getParameter("otp");
        if (OTP == null || !OTP.equals(otpInput)) { // send messsage
            req.setAttribute("otpErr", "Your OTP verification code is incorrect.");
            req.getRequestDispatcher("otp-verification.jsp").forward(req, resp);
            return;
        }
        // create and save the user in database
        UserDTO userdto = (UserDTO) session.getAttribute("userdto");
        userService.saveUser(userdto);
        // delete the otp code and remove userdto from session
        session.removeAttribute("userdto");
        session.removeAttribute("OTP");
        // send register success message
        session.setAttribute("successMsg", "Register successful!");
        // redirect to login page
        resp.sendRedirect("/login");
    }
}
