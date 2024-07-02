package com.swp.bookstore.controller.common;

import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name="SearchByAuthor", urlPatterns = "/search-by-author")
public class SearchByAuthor extends HttpServlet {

    private BookService bookService;
    private AuthorService authorService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        authorService = new AuthorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get list of book by author
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        Author author = authorService.findById(authorId);
        List<Book> books = bookService.getBookByAuthorByPage(20, 0, authorId);
        req.setAttribute("books", books);
        req.setAttribute("currentPage", 1);
        req.setAttribute("author", author);
        req.getRequestDispatcher("book-by-author.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get next book page
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        int currentPage = Integer.parseInt(req.getParameter("page"));
        List<Book> books = bookService.getBookByAuthorByPage(12, currentPage, authorId);
        // return html code
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        books.forEach(book -> {
            // format rating
            StringBuilder builder = new StringBuilder();
            builder.append("<div class=\"d-inline-block px-4\" style=\"font-size: 10px;\">\n");
            int rating = (int) Math.ceil(book.getAverageRating());
            builder.append("<i class=\"fa-solid fa-star text-warning\"></i>\n".repeat(Math.max(0, rating)));
            builder.append("<i class=\"fa-solid fa-star text-black-50\"></i>\n".repeat(5 - rating));
            builder.append("</div>\n");

            out.println("<div class=\"col-12 col-sm-12 col-md-6 col-lg-3\">\n" +
                    "                                <div class=\"single_product_item\">\n" +
                    "                                    <img src=\""+ req.getContextPath() +"/img/book-image/"+book.getImageFront()+"\" alt=\"#\" class=\"img-fluid\">\n" +
                    "                                    <h3 class=\"px-4\"> "+book.getName()+" </h3>\n" +
                    "                                    <h5 class=\"px-4\">Tác giả: "+book.getAuthor().getName()+"</h5>\n" + builder.toString() +
                    "                                    <p  class=\"px-4 pb-2\">Giá\n" +
                    "                                        <span class=\"book-price\">"+book.getPrice()+"</span>đ\n" +
                    "                                    </p>\n" +
                    "                                    <a class=\"book-detail-link\" href=\""+req.getContextPath()+"/book-detail?id="+book.getId()+"\"></a>\n" +
                    "                                </div>\n" +
                    "                            </div>");
        });
    }
}
