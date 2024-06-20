package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.OrderDetail;
import com.swp.bookstore.entity.Rating;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.OrderDetailService;
import com.swp.bookstore.service.RatingService;
import com.swp.bookstore.service.serviceImpl.OrderDetailServiceImpl;
import com.swp.bookstore.service.serviceImpl.RatingServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name="AddRating", urlPatterns = "/rating")
public class AddRating extends HttpServlet {

    private OrderDetailService orderDetailService;
    private RatingService ratingService;

    @Override
    public void init() throws ServletException {
        orderDetailService = new OrderDetailServiceImpl();
        ratingService = new RatingServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get rating score
        String[] scores = req.getParameterValues("star");
        int score = 5;
        if (scores == null || scores.length == 0) {
            score = 5;
        }
        if (scores.length >= 1) {
            score = Integer.parseInt(scores[0]);
        }
        // get comment title and content
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        // get book id
        String bookId = req.getParameter("bookId");
        // get user from session
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // create rating
        Rating rating = new Rating();
        rating.setTitle(title);
        rating.setContent(content);
        rating.setUser(user);
        rating.setRatingScore(score);
        rating.setBookId(Long.parseLong(bookId));
        rating.setCreateTime(LocalDate.now());
        // save rating
        ratingService.saveRating(rating);
        // update order detail rating status
        String orderDetailId = req.getParameter("orderDetailId");
        OrderDetail orderDetail = orderDetailService.findById(Integer.parseInt(orderDetailId));
        orderDetail.setRated(true);
        orderDetailService.updateOrderDetail(orderDetail);
        // return to user orders page
        session.setAttribute("page", 2);
        resp.sendRedirect( req.getContextPath() + "/view-order");
    }
}
