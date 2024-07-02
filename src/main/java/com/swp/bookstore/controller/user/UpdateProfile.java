package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet(name="UpdateProfile", urlPatterns = "/update-profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateProfile extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get user info
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String phone = req.getParameter("phone");
        String birthDate = req.getParameter("birth");
        Part imagePart = req.getPart("user-picture");
        int gender = Integer.parseInt(req.getParameter("gender"));

        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // modify user info
        user.setName(name);
        user.setUsername(username);
        user.setPhoneNumber(phone);
        user.setBirthDate(birthDate);
        user.setGender(gender == 1);

        // check for user want to change picture
        if (!imagePart.getSubmittedFileName().isEmpty()) {  // change user picture
            String realPath = req.getServletContext().getRealPath("/img/user-image");
            String imageName = System.currentTimeMillis() + "-" + imagePart.getSubmittedFileName();
            user.setImageURL(imageName);
            imagePart.write(realPath + File.separator +  user.getImageURL());
        }

        // update user
        userService.updateUser(user);
        user = userService.findOneByEmail(user.getEmail());
        session.setAttribute("user", user);
        session.setAttribute("successMsg", "Update profile successfully!");
        resp.sendRedirect(req.getContextPath() + "/view-profile");
    }
}
