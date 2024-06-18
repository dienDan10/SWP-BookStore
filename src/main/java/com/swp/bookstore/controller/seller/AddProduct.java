package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Book;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.BookService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.BookServiceImpl;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import com.swp.bookstore.utils.RandomUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@WebServlet(name="AddProduct",urlPatterns="/add-product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class AddProduct extends HttpServlet {

    //Initilize service
    private AuthorService authorService;
    private BookService bookService;
    private CategoryService categoryService;
    private PublisherService publisherService;

    //Call service class
    @Override
    public void init() throws ServletException {
        authorService = new AuthorServiceImpl();
        bookService = new BookServiceImpl();
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path string
        String context = req.getContextPath();
        //Get book's information
        String bookName = req.getParameter("bookName");
        String description = req.getParameter("description");
        String publishedDate = req.getParameter("publishedDate");
        String authorName = req.getParameter("author");
        String publisherId = req.getParameter("publisherId");
        String categoryId = req.getParameter("categoryId");
        String quantity = req.getParameter("quantity");
        String pageNum = req.getParameter("pageNum");
        String price = req.getParameter("price");
        String summary = req.getParameter("summary");

        //Create or Get Author (Add book will automatically add new author)
        Author author = authorService.findAuthorByName(authorName);
        System.out.println(author);
        if (author == null) { //Create new author
            author = new Author();
            author.setName(authorName);
            authorService.addAuthor(author);
            author = authorService.findAuthorByName(authorName);
        }
        //Get category & publisher
        Category category = categoryService.findById(Integer.parseInt(categoryId));
        Publisher publisher = publisherService.findById(Integer.parseInt(publisherId));


        // save image to server
        Part frontImgPart = req.getPart("imgFront");// get Img
        Part backImgPart = req.getPart("imgBack");
        String imageFront = frontImgPart.getSubmittedFileName();// get Img name
        String imageBack = backImgPart.getSubmittedFileName();
        // Get save folder path
        String path = req.getServletContext().getRealPath("/img/book-image");// set path
        if(!Files.exists(Path.of(path))){ // create folder
            Files.createDirectory(Path.of(path));
        }

        // check if image with the same name already in the save folder
        String newFrontImgName = imageFront;
        String newBackImgName = imageBack;
        Path imgFrontPath = Path.of(path + File.separator + imageFront);
        Path imgBackPath = Path.of(path + File.separator + imageBack);
        if (Files.exists(imgFrontPath)) {    // change image name
            newFrontImgName = RandomUtil.getOTPCode() + "-" + imageFront;
        }
        if (Files.exists(imgBackPath)) {  // change image name
            newBackImgName = RandomUtil.getOTPCode() + "-" + imageBack;
        }
        // save image
        frontImgPart.write(path + File.separator + newFrontImgName);
        backImgPart.write(path + File.separator + newBackImgName);

        // Create new Book
        Book book = new Book();
        book.setName(bookName);
        book.setDescription(description);
        book.setPublishedDate(publishedDate);
        book.setAuthor(author);
        book.setPublisher(publisher);
        book.setCategory(category);
        book.setQuantity(Integer.parseInt(quantity));
        book.setPageCount(Integer.parseInt(pageNum));
        book.setPrice(Long.parseLong(price));
        book.setImageFront("/img/book-image/" + newFrontImgName);// set book path
        book.setImageBack("/img/book-image/" + newBackImgName);
        book.setSummary(summary);
        bookService.addBook(book);

        // redirect back to manage product page
        resp.sendRedirect(context + "/manage-product");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
