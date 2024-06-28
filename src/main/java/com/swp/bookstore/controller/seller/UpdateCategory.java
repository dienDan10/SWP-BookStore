package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Category;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="UpdateCategory", urlPatterns = "/update-category")
public class UpdateCategory extends HttpServlet {

    //Initialize service
    private CategoryService categoryService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path
        String context = req.getContextPath();
        //Get author's information
        String id = req.getParameter("id");
        String categoryName = req.getParameter("categoryName");
        //Get a author that was chosen to update
        Category category = categoryService.findById(Integer.parseInt(id));
        //Set Author object's info
        category.setName(categoryName);
        categoryService.updateCategory(category);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
