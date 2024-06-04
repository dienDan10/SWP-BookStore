package com.swp.bookstore;

import java.io.*;

import com.swp.bookstore.utils.JPAUtil;
import com.swp.bookstore.utils.PasswordEncryptor;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String s = "test123";
        String encryped = PasswordEncryptor.toSHA256(s);
        request.setAttribute("encrypted", encryped);
        System.out.println("aal;sdkfjlkasdjf");
    }

}