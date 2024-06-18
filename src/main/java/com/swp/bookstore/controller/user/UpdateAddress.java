package com.swp.bookstore.controller.user;

import com.swp.bookstore.entity.Address;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.AddressService;
import com.swp.bookstore.service.serviceImpl.AddressServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name="UpdateAddress", urlPatterns = "/update-address")
public class UpdateAddress extends HttpServlet {

    private AddressService addressService;

    @Override
    public void init() throws ServletException {
        addressService = new AddressServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // get address info from request
        String isDefault = req.getParameter("isDefault");
        String receiver = req.getParameter("receiver");
        String phone = req.getParameter("phone");
        String province = req.getParameter("province");
        String district = req.getParameter("district");
        String town = req.getParameter("town");
        String village = req.getParameter("village");
        String details = req.getParameter("detail");
        int id = Integer.parseInt(req.getParameter("id"));
        // get address from database
        Address address = addressService.findById(id);
        // update address info
        address.setReceiver(receiver);
        address.setPhone(phone);
        address.setProvince(province);
        address.setDistrict(district);
        address.setTown(town);
        address.setVillage(village);
        address.setDetail(details);
        // save to database
        addressService.update(address);
        if (isDefault != null && isDefault.equals("true")) {
            addressService.setDefaultAddress(id, user.getId());
        }
        // send message
        session.setAttribute("successMsg", "Update successful");
        // return to manage address page
        resp.sendRedirect( req.getContextPath() + "/view-address");
    }
}
