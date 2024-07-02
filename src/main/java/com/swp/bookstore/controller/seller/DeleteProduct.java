package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Cart;
import com.swp.bookstore.service.*;
import com.swp.bookstore.service.serviceImpl.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name="DeleteProduct",urlPatterns = "/delete-product")
public class DeleteProduct extends HttpServlet {

    private BookService bookService;
    private AuthorService authorService;
    private CartService cartService;
    private CategoryService categoryService;
    private PublisherService publisherService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        authorService = new AuthorServiceImpl();
        cartService = new CartServiceImpl();
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get context path
        String context = req.getContextPath();

        //get book from request's bookId
        long bookId = Long.parseLong(req.getParameter("bookId"));
        Book book = bookService.findById(bookId);
//        book.setAuthor(null);
//        book.setCategory(null);
//        book.setPublisher(null);
        //Delete book condition
        if(book.isActive()){
            // send message
            HttpSession session = req.getSession();
            session.setAttribute("invalidMsg", "The book is still actively being sold");
            resp.sendRedirect(context + "/manage-product");
        } else {

            //update Cart, Author, Category from book
            List<Cart> carts = cartService.findCartsByBookId(bookId);
            for (Cart cart : carts) {
                cartService.removeCart(cart.getId());
            }
            //delete book
            bookService.deleteBook(bookId);
            // send message
            HttpSession session = req.getSession();
            session.setAttribute("successMsg", "Book deleted successfully");
            //back to manage product
            resp.sendRedirect(context + "/manage-product");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
