package com.swp.bookstore.controller.common;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.RatingService;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.RatingServiceImpl;
import com.swp.bookstore.utils.StringUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="BookDetail", urlPatterns = "/book-detail")
public class BookDetail extends HttpServlet {

    private BookService bookService;
    private RatingService ratingService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        ratingService = new RatingServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long bookId = Long.parseLong(req.getParameter("id"));
        // get book from database
        Book book = bookService.findById(bookId);
        book.setSummary(StringUtil.toHTMLString(book.getSummary()));    // format book summary
        // get book rating from database
        List<Rating> ratings = ratingService.findAllRatingsByBookId(bookId);
        // send to single product page
        req.setAttribute("book", book);
        req.setAttribute("ratings", ratings);
        req.getRequestDispatcher("/single-product.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
