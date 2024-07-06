package com.swp.bookstore.controller.seller;

import com.swp.bookstore.config.Excel;
import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.CategoryService;
import com.swp.bookstore.service.PublisherService;
import com.swp.bookstore.service.serviceImpl.AuthorServiceImpl;
import com.swp.bookstore.service.serviceImpl.CategoryServiceImpl;
import com.swp.bookstore.service.serviceImpl.PublisherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.poi.ss.usermodel.DataValidation;
import org.apache.poi.ss.usermodel.DataValidationConstraint;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.usermodel.XSSFDataValidationHelper;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.util.List;

@WebServlet(name="DownLoadExcelTemplate", urlPatterns = "/download-excel-template")
public class DownloadExcelTemplate extends HttpServlet {

    private AuthorService authorService;
    private PublisherService publisherService;
    private CategoryService categoryService;

    @Override
    public void init() throws ServletException {
        authorService = new AuthorServiceImpl();
        publisherService = new PublisherServiceImpl();
        categoryService = new CategoryServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // create a workbook and a sheet
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet products = workbook.createSheet("Products");

        // create first row for product attributes
        products.createRow(0);
        products.getRow(0).createCell(0).setCellValue("Tên sách");
        products.getRow(0).createCell(1).setCellValue("Mô tả");
        products.getRow(0).createCell(2).setCellValue("Ngày xuất bản");
        products.getRow(0).createCell(3).setCellValue("Tác giả");
        products.getRow(0).createCell(4).setCellValue("Nhà xuất bản");
        products.getRow(0).createCell(5).setCellValue("Thể loại");
        products.getRow(0).createCell(6).setCellValue("Số lượng");
        products.getRow(0).createCell(7).setCellValue("Số trang");
        products.getRow(0).createCell(8).setCellValue("Giá");
        products.getRow(0).createCell(9).setCellValue("Tóm tắt nội dung");
        products.getRow(0).createCell(10).setCellValue("Ảnh trước(tên hoặc đường dẫn)");
        products.getRow(0).createCell(11).setCellValue("Ảnh sau(tên hoặc đường dẫn)");

        // set dropdown list for author
        List<Author> authors = authorService.findAll();
        String[] authorNames = authors.stream().map(Author::getName).toArray(String[]::new);
        setDropdownList(products, 3, authorNames);

        // set dropdown list for publisher
        List<Publisher> publishers = publisherService.findAll();
        String[] publisherNames = publishers.stream().map(Publisher::getName).toArray(String[]::new);
        setDropdownList(products, 4, publisherNames);

        // set dropdown list for category
        List<Category> categories = categoryService.findAll();
        String[] categoriesNames = categories.stream().map(Category::getName).toArray(String[]::new);
        setDropdownList(products, 5, categoriesNames);

        // save excel file
        try {
            saveExcelFile(workbook, req.getServletContext().getRealPath(""));
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            // return to product management page and display err message
            HttpSession session = req.getSession();
            session.setAttribute("errMsg", "Lỗi khi tải file");
            resp.sendRedirect(req.getContextPath() + "/manage-product");
        } finally {
            workbook.close();
        }

        /*----------- IMPLEMENT DOWNLOAD FILE FUNCTIONALITY -----------------*/
        // create a file object of the download file
        File file = new File(req.getServletContext().getRealPath("/file" + File.separator + Excel.EXCEL_FILE_NAME));
        // get the MIME type of the file
        String mimeType = req.getServletContext().getMimeType(file.getAbsolutePath());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }

        // modifies response
        resp.setContentType(mimeType);
        resp.setContentLength((int) file.length());

        // force browser to download
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
        resp.setHeader(headerKey, headerValue);

        FileInputStream fis = new FileInputStream(file);
        OutputStream fos = resp.getOutputStream();

        byte[] buffer = new byte[fis.available()];
        int bytesRead = -1;

        while ((bytesRead = fis.read(buffer)) != -1) {
            fos.write(buffer, 0, bytesRead);
        }
        fis.close();
        fos.close();
    }

    private void setDropdownList(XSSFSheet sheet, int col, String[] options) {
        // create a validation helper
        XSSFDataValidationHelper dataValidationHelper = new XSSFDataValidationHelper(sheet);

        // define the cell range for the validation helper
        CellRangeAddressList cellRangeAddressList = new CellRangeAddressList(1,20,col,col);

        // define the drop down list value
        DataValidationConstraint constraint = dataValidationHelper.createExplicitListConstraint(options);

        // create a data validation object
        DataValidation dataValidation = dataValidationHelper.createValidation(constraint, cellRangeAddressList);

        // Set Dropdown arrow to to be suppressed
        dataValidation.setSuppressDropDownArrow(true);

        // add datavalidation to the sheet
        sheet.addValidationData(dataValidation);
    }

    private void saveExcelFile(XSSFWorkbook workbook, String contextPath) throws IOException {
        try {
            // check for save folder exist
            File saveFolder = new File(contextPath + File.separator + "file");
            if (!saveFolder.exists()) {
                saveFolder.mkdirs();
            }

            // create excel file to save
            File excelFile = new File(saveFolder.getAbsolutePath() + File.separator + Excel.EXCEL_FILE_NAME);
            // save excel file
            workbook.write(new FileOutputStream(excelFile));

        } catch (Exception ex) {
            throw new IOException("Cannot create and save excel file");
        }
    }

}
