package com.swp.bookstore.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;


import java.io.IOException;

public class StaticResourceFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        request.getRequestDispatcher("ErrorPage.html").forward(request, servletResponse);


    }
}
