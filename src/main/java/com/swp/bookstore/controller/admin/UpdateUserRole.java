package com.swp.bookstore.controller.admin;

import com.swp.bookstore.entity.Role;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.RoleService;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.RoleServiceImpl;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UpdateRole", urlPatterns = "/update-user-role")
public class UpdateUserRole extends HttpServlet {

    private UserService userService;
    private RoleService roleService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
        roleService = new RoleServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get context path
        String context = req.getContextPath();

        //get role from form and update
        String role = req.getParameter("role");
        System.out.println(role);
        String email = req.getParameter("email");
        User user = userService.findOneByEmail(email);
        List<Role> list = user.getRoles();
        if(role == null && user.hasRole("SELLER")) {
            list.removeIf(r -> r.getName().equals("SELLER"));
        } else if(!user.hasRole("SELLER")) {
            list.add(roleService.findRoleByName(role));
        }
        userService.updateUser(user);
        resp.sendRedirect(context + "/manage-account");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
