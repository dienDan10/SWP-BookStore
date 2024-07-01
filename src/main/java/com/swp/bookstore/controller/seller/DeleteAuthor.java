package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name="DeleteAuthor",urlPatterns = "/delete-author")
public class DeleteAuthor extends HttpServlet {
    //Initialize service
    private AuthorService authorService;
    private BookService bookService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        authorService = new AuthorServiceImpl();
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get context path
        String context = req.getContextPath();
        //get authorid from request
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        try{
            //get all book with author id
            List<Book> books = bookService.getBookByAuthorId(authorId);
            //update book with author
            for (Book book : books) {
                book.setAuthor(null);
                book.setActive(false);
                bookService.updateBook(book);
            }
            //delete author with author id
            authorService.deleteAuthor(authorId);
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
