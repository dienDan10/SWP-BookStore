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
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.InvalidPathException;

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
        String contextPath = req.getServletContext().getRealPath("/img/book-image");// set path
        //Get img part
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
        // send message
        HttpSession session = req.getSession();
        session.setAttribute("successMsg", "Update Successfully!");
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
                File imageFile = new File(contextPath + File.separator + img);
                if (imageFile.exists()) {
                    imageFile.delete();
                }
            } catch (InvalidPathException e) {
                throw new IOException("CANNOT DELETE IMAGE");
            } finally {
                // save new image to server and folder
                String image = System.currentTimeMillis() + "-" + imgPart.getSubmittedFileName();// get Img name
                InputStream inputStream = imgPart.getInputStream();
                byte[] imageByte = new byte[inputStream.available()];
                inputStream.read(imageByte);
                inputStream.close();
                File saveFolder = new File(contextPath + File.separator + image);
                BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(saveFolder));
                outputStream.write(imageByte);
                outputStream.close();
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
