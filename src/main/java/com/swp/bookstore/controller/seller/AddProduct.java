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
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.InvalidPathException;
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
        // get session
        HttpSession session = req.getSession();
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
        if (author == null) { //Create new author
            author = new Author();
            author.setName(authorName);
            authorService.addAuthor(author);
            author = authorService.findAuthorByName(authorName);
        }
        //Get category & publisher
        Category category = categoryService.findById(Integer.parseInt(categoryId));
        Publisher publisher = publisherService.findById(Integer.parseInt(publisherId));

        // get image parts
        Part frontImgPart = req.getPart("imgFront");// get Img
        Part backImgPart = req.getPart("imgBack");
        String imageFront = frontImgPart.getSubmittedFileName();// get Img name
        String imageBack = backImgPart.getSubmittedFileName();
        String realPath = req.getServletContext().getRealPath("/img/book-image");
        try {
            imageFront = saveImage(frontImgPart, imageFront, realPath);
            imageBack = saveImage(backImgPart, imageBack, realPath);
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
            book.setImageFront("/img/book-image/" + imageFront);// set book path
            book.setImageBack("/img/book-image/" + imageBack);
            book.setSummary(summary);
            bookService.addBook(book);
            // send message
            session.setAttribute("successMsg", "Add book successful!");
        }catch (IOException e) {
            session.setAttribute("errMsg", "Add book failed!");
            System.out.println(e.getMessage());
        }
        // redirect back to manage product page
        resp.sendRedirect(context + "/manage-product");
    }

    private String saveImage(Part imagePart, String imageName, String realPath) throws IOException {
        String newImageName = imageName;
        try {
            // check if the folder not exist
            if (!Files.exists(Path.of(realPath))) { // create folder
                Files.createDirectories(Path.of(realPath));
            }
            // check if image with the same name exists
            if (Files.exists(Path.of(realPath + File.separator + imageName))) { //create new image name
                newImageName = RandomUtil.getOTPCode() + "-" + imageName;
            }
            // save image
            imagePart.write(realPath + File.separator + newImageName);

        } catch (InvalidPathException | IOException e) {
            e.printStackTrace();
            throw new IOException("Cannot save image");
        }

        return newImageName;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
