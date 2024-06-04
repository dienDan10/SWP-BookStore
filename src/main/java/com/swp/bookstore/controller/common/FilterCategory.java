package com.swp.bookstore.controller.common;

import com.swp.bookstore.config.Page;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(name="FilterCategory", urlPatterns = "/filter-category")
public class FilterCategory extends HttpServlet {
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        int currentPage = Integer.parseInt(req.getParameter("currentPage"));
        // get first book page by category
        List<Book> books = bookService.getBookByCategoryByPage(Page.PAGE_SIZE, currentPage, categoryId);
        // return html code
        PrintWriter out = resp.getWriter();
        books.forEach(book -> {

            StringBuilder builder = new StringBuilder();
            builder.append("<div class=\"d-inline-block px-4\" style=\"font-size: 10px;\">\n");
            int rating = (int) Math.ceil(book.getAverageRating());
            builder.append("<i class=\"fa-solid fa-star text-warning\"></i>\n".repeat(Math.max(0, rating)));
            builder.append("</div>\n");

            out.println("<div class=\"col-lg-6 col-sm-6\">\n" +
                    "                                <div class=\"single_product_item\">\n" +
                    "                                    <img src=\""+ book.getImageFront()+"\" alt=\"#\" class=\"img-fluid\">\n" +
                    "                                    <h3 class=\"px-4\"> <a href=\"/book-detail?id="+book.getId()+"\">"+ book.getName()+"</a> </h3>\n" +
                    "                                    <h5 class=\"px-4\">Tác giả: "+ book.getAuthor().getName()+"</h5>\n" +
                    builder.toString() +
                    "                                    <p  class=\"px-4\">Chỉ với\n" +
                    formatBookPrice(book.getPrice()) + "đ" +
                    "                                    </p>\n" +
                    "                                </div>\n" +
                    "                            </div>") ;
        });
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    private String formatBookPrice(double price) {
        DecimalFormat df = new DecimalFormat("#.000");
        return df.format(price);
    }
}
