package com.swp.bookstore.controller.common;

import com.swp.bookstore.dto.UserDTO;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

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
        // check valid user input
        boolean isValid = authenticateUserInfo(req);
        if (!isValid) {
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }
        // check for email has been registered
        User user = userService.findOneByEmail(req.getParameter("email"));
        if (user != null) {
            req.setAttribute("emailExist", "This email has already been registered.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // create a user dto object
        UserDTO userdto = new UserDTO(
                req.getParameter("name"),
                req.getParameter("username"),
                req.getParameter("password"),
                req.getParameter("email"),
                req.getParameter("phone"),
                req.getParameter("gender").equals("1"),
                req.getParameter("birthDate")
        );
        HttpSession session = req.getSession();
        session.setAttribute("userdto", userdto);

        // redirect to otp verification
        resp.sendRedirect("/otp-verification");
    }

    /*
    * Return true if user input is valid
    * false otherwise
    * */
    private boolean authenticateUserInfo(HttpServletRequest request) {
        String birthDate = request.getParameter("birthDate");
        if (birthDate.trim().equals("")) {
            return true;
        }
        LocalDate date = LocalDate.parse(birthDate);
        request.setAttribute("birthDateErr", "Your birth date is invalid!");
        return date.isBefore(LocalDate.now());
    }

}
