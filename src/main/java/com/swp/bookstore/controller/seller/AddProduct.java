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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.nio.file.InvalidPathException;

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

        // get image part
        Part frontImagePart = req.getPart("imgFront");
        Part backImagePart = req.getPart("imgBack");
        String realPath = req.getServletContext().getRealPath("/img");

        // create book to save
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
        book.setSummary(summary);
        book.setActive(true);

        // save image
        try {

            String frontImg = saveImage(frontImagePart, realPath);
            String backImg = saveImage(backImagePart, realPath);
            book.setImageFront(frontImg);
            book.setImageBack(backImg);

            bookService.addBook(book);

        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            session.setAttribute("errMsg", "Add book failed!");
        }

        // redirect back to manage product page
        resp.sendRedirect(context + "/manage-product");
    }

    private String saveImage (Part part, String realPath) throws IOException {
        String imageName = "";
        try {
            // transfer part data in to bytes array
            InputStream inputStream = part.getInputStream();
            byte[] imageByte = new byte[inputStream.available()];
            inputStream.read(imageByte);
            inputStream.close();
            // create a new folder to contains image if not exist
            File saveFolder = new File(realPath + File.separator + "book-image");
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            // create image file to save data into, rename image
            imageName = System.currentTimeMillis() + "-" + part.getSubmittedFileName();
            File imageFile = new File(saveFolder.getAbsolutePath() + File.separator + imageName);

            // save image
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(imageFile));
            outputStream.write(imageByte);
            outputStream.close();

        } catch (InvalidPathException | IOException e) {
            throw new IOException("Cannot save image");
        }
        return imageName;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
