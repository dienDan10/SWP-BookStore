package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Category;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="AddCategory",urlPatterns="/add-category")
public class AddCategory extends HttpServlet {

    //Initilize service
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path string
        String context = req.getContextPath();
        //Get category's information
        String categoryName = req.getParameter("categoryName");
        // Create new Category
        Category category = new Category();
        category.setName(categoryName);
        categoryService.addCategory(category);
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
