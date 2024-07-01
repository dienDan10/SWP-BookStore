package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="DeleteCategory",urlPatterns = "/delete-category")
public class DeleteCategory extends HttpServlet {
    //Initialize service
    private CategoryService categoryService;
    private BookService bookService;
    @Override
    public void init(ServletConfig config) throws ServletException {
        categoryService = new CategoryServiceImpl();
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get context path
        String context = req.getContextPath();
        //get category from request
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));

        try{
            List<Book> books = bookService.getBookByCategory(categoryId);
            for (Book book : books) {
                book.setCategory(null);
                book.setActive(false);
                bookService.updateBook(book);
            }
            categoryService.deleteCategory(categoryId);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        resp.sendRedirect(context + "/classification");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
