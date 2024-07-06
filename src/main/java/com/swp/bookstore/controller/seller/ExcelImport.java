package com.swp.bookstore.controller.seller;

import com.swp.bookstore.entity.Book;
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
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.nio.file.InvalidPathException;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name="ExcelImport", urlPatterns = "/excel-import")
@MultipartConfig (
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class ExcelImport extends HttpServlet {

    private BookService bookService;
    private AuthorService authorService;
    private CategoryService categoryService;
    private PublisherService publisherService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
        authorService = new AuthorServiceImpl();
        categoryService = new CategoryServiceImpl();
        publisherService = new PublisherServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // get Excel file
        Part excelFilePart = req.getPart("excel");
        // Read excel file
        InputStream fileContent = excelFilePart.getInputStream();
        Workbook workbook = new XSSFWorkbook(fileContent);
        Sheet sheet = workbook.getSheetAt(0);
        // get pictures parts
        Collection<Part> parts = req.getParts();
        // Map to store image file names and corresponding parts
        Map<String, Part> imageFileMap = new HashMap<>();
        for (Part part : parts) {
            if (part.getName().equals("images")) {
                String fileName = part.getSubmittedFileName();
                imageFileMap.put(fileName, part);
            }
        }

        // create a list to store books
        List<Book> books = new ArrayList<>();
        // parse each row in excel file
        try {
            for (Row row : sheet) {
                if (row.getRowNum() == 0) continue; // omit the first row

                Cell bookNameCell = row.getCell(0);
                Cell descriptionCell = row.getCell(1);
                Cell publishDateCell = row.getCell(2);
                Cell authorNameCell = row.getCell(3);
                Cell publisherNameCell = row.getCell(4);
                Cell categoryNameCell = row.getCell(5);
                Cell quantityCell = row.getCell(6);
                Cell pageNumberCell = row.getCell(7);
                Cell priceCell = row.getCell(8);
                Cell summaryCell = row.getCell(9);
                Cell frontImgCell = row.getCell(10);
                Cell backImgCell = row.getCell(11);

                String bookName = bookNameCell.getStringCellValue();
                if (bookName == null || bookName.equals("")) { // break the loop because no more row to read
                    break;
                }
                String description = descriptionCell.getStringCellValue();
                String publishDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(publishDateCell.getLocalDateTimeCellValue());
                String authorName = authorNameCell.getStringCellValue();
                String publisherName = publisherNameCell.getStringCellValue();
                String categoryName = categoryNameCell.getStringCellValue();
                int quantity = (int)quantityCell.getNumericCellValue();
                int pageNumber = (int)pageNumberCell.getNumericCellValue();
                long price = (long)priceCell.getNumericCellValue();
                String summary = summaryCell.getStringCellValue();
                String frontImg = Paths.get(frontImgCell.getStringCellValue()).getFileName().toString();
                String backImg = Paths.get(backImgCell.getStringCellValue()).getFileName().toString();

                try {
                    // Save the image if it was uploaded
                    if (imageFileMap.containsKey(frontImg)) {
                        Part imagePart = imageFileMap.get(frontImg);
                        frontImg = saveImage(imagePart, req.getServletContext().getRealPath("/img"));
                    }

                    if (imageFileMap.containsKey(backImg)) {
                        Part imagePart = imageFileMap.get(backImg);
                        backImg = saveImage(imagePart, req.getServletContext().getRealPath("/img"));
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                }

                // create book
                Book book = new Book();
                book.setName(bookName);
                book.setDescription(description);
                book.setPublishedDate(publishDate);
                book.setAuthor(authorService.findAuthorByName(authorName));
                book.setCategory(categoryService.findByName(categoryName));
                book.setPublisher(publisherService.findByName(publisherName));
                book.setQuantity(quantity);
                book.setPageCount(pageNumber);
                book.setPrice(price);
                book.setSummary(summary);
                book.setImageFront(frontImg);
                book.setImageBack(backImg);
                book.setActive(true);
                // add book to list
                books.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errMsg", "Lưu sách không thành công!");
            resp.sendRedirect(req.getContextPath() +  "/manage-product");
            return;
        }

        // save books
        books.forEach(book -> bookService.addBook(book));
        session.setAttribute("successMsg", "Lưu sách thành công!");
        resp.sendRedirect(req.getContextPath() +  "/manage-product");
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
}
