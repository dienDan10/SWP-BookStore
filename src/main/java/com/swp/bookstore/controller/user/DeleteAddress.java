package com.swp.bookstore.controller.user;

import com.swp.bookstore.service.AddressService;
import com.swp.bookstore.service.serviceImpl.AddressServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="DeleteAddress", urlPatterns = "/delete-address")
public class DeleteAddress extends HttpServlet {
    private AddressService addressService;

    @Override
    public void init() throws ServletException {
        addressService = new AddressServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // get address id
        int id = Integer.parseInt(req.getParameter("id"));
        // delete address
        addressService.delete(id);
        // send message
        HttpSession session = req.getSession();
        session.setAttribute("successMsg", "Xóa địa chỉ thành công");
        // redirect back to view address page
        resp.sendRedirect(req.getContextPath() + "/view-address");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
