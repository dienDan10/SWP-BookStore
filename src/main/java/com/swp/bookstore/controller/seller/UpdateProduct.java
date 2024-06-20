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
import jakarta.servlet.ServletConfig;
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
import java.nio.file.InvalidPathException;
import java.nio.file.Path;

@WebServlet(name="UpdateProduct", urlPatterns = "/update-product")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateProduct extends HttpServlet {

    //Initialize service
    BookService bookService;
    AuthorService authorService;
    CategoryService categoryService;
    PublisherService publisherService;

    @Override
    public void init(ServletConfig config) throws ServletException {
        bookService = new BookServiceImpl();
        authorService = new AuthorServiceImpl();
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Get context path
        String context = req.getContextPath();

        //Get book's information
        String id = req.getParameter("id");
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

        //Get a book that was chosen to update
        Book book = bookService.findById(Integer.parseInt(id));

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

        // Get folder path
        String contextPath = req.getServletContext().getRealPath("");// set path
        //Get img text
        Part frontImgPart = req.getPart("imgFront");// get Img
        Part backImgPart = req.getPart("imgBack");

        try {
            saveNewImage(frontImgPart, contextPath, book, true);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        try {
            saveNewImage(backImgPart, contextPath, book, false);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        //Set Book object's info
        book.setName(bookName);
        book.setDescription(description);
        book.setPublishedDate(publishedDate);
        book.setAuthor(author);
        book.setPublisher(publisher);
        book.setCategory(category);
        book.setQuantity(Integer.parseInt(quantity));
        book.setPageCount(Integer.parseInt(pageNum));
        book.setPrice(Long.parseLong(price));
        book.setSummary(summary);
        bookService.updateBook(book);

        resp.sendRedirect(context + "/manage-product");
    }

    //Delete old image and Save image
    private void saveNewImage(Part imgPart, String contextPath, Book book, boolean isFront) throws IOException {

        if(!imgPart.getSubmittedFileName().isEmpty()){ //Add new front image
            try {
                //delete image in folder
                String img;
                if(isFront) {
                    img = book.getImageFront();
                } else {
                    img = book.getImageBack();
                }
                if (Files.exists(Path.of(contextPath + img))) {
                    Files.delete(Path.of(contextPath + img));
                }
            } catch (IOException | InvalidPathException e) {
                throw new IOException("CANNOT DELETE IMAGE");
            } finally {
                // save new image to server and folder
                String image = "/img/book-image/" + imgPart.getSubmittedFileName();// get Img name
                Path imgPath = Path.of(contextPath + image);
                imgPart.write(imgPath.toString()); // save image
                if (isFront) {
                    book.setImageFront(image); // set front img book path
                } else {
                    book.setImageBack(image); // set back img book path
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
