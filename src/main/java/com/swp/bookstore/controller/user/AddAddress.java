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

@WebServlet(name="AddAddress", urlPatterns = "/add-address")
public class AddAddress extends HttpServlet {

    private AddressService addressService;

    @Override
    public void init() throws ServletException {
        addressService = new AddressServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // get address information
        String receiver = req.getParameter("receiver");
        String phone = req.getParameter("phone");
        String province = req.getParameter("province");
        String district = req.getParameter("district");
        String town = req.getParameter("town");
        String village = req.getParameter("village");
        String details = req.getParameter("details");
        // get user from session
        User user = (User) session.getAttribute("user");
        // create a new address
        Address address = new Address();
        address.setUserId(user.getId());
        address.setReceiver(receiver);
        address.setPhone(phone);
        address.setProvince(province);
        address.setDistrict(district);
        address.setTown(town);
        address.setVillage(village);
        address.setDetail(details);
        address.setDefault(false);
        // check if user don't have any address
        if (addressService.countByUserId(user.getId()) == 0) {  // set address to default address
            address.setDefault(true);
        }
        // save address to database
        addressService.save(address);
        // send message
        session.setAttribute("successMsg", "Add Address successful");
        // return to manage address page
        resp.sendRedirect( req.getContextPath() + "/view-address");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
