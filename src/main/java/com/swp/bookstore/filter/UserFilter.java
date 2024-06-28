package com.swp.bookstore.filter;

import com.swp.bookstore.config.ROLES;
import com.swp.bookstore.entity.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class UserFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // get user in session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !user.hasRole(ROLES.USER)) { // request user login
            session.setAttribute("invalidMsg", "Please login first");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        if (user.hasRole(ROLES.ADMIN) || user.hasRole(ROLES.SELLER)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        filterChain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
