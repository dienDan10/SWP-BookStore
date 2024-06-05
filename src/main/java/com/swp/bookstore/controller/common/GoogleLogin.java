package com.swp.bookstore.controller.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.swp.bookstore.config.Constant;
import com.swp.bookstore.dto.UserGoogleDto;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.service.serviceImpl.UserServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

@WebServlet(name="GoogleLogin", urlPatterns = "/google-login")
public class GoogleLogin extends HttpServlet {

    UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        // user refuse to log in with Google
        if(error != null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String accessToken = getToken(code);
        UserGoogleDto googleUserDTO = getUserInfo(accessToken);

        // check if email has been registered to an account
        User user = userService.findOneByEmail(googleUserDTO.getEmail());
        HttpSession session = request.getSession();
        if (user == null) { // register new user
            userService.saveUser(googleUserDTO);
            user = userService.findOneByEmail(googleUserDTO.getEmail());
        }
        // check for user is active
        if (!user.isActive()) {
            session.setAttribute("errMsg", "Your account has been blocked");
            response.sendRedirect("/login");
            return;
        }
        // save user to session
        session.setAttribute("user", user);
        // return to home page
        session.setAttribute("successMsg", "Login successful!");
        response.sendRedirect("/home-page");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    // send a request to google using code to get access token
    // return the access token
    public static String getToken(final String code) throws IOException {
        String response = Request.Post(Constant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Constant.GOOGLE_CLIENT_ID)
                                .add("client_secret", Constant.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Constant.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Constant.GOOGLE_GRANT_TYPE)
                                .build()
                ).execute().returnContent().toString();
        System.out.println("Response: " + response);
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    // send a request to google using access token to get user info
    // return a UserGoogleDto instance with user info
    public static UserGoogleDto getUserInfo(final String accessToken) throws IOException {
        String link = Constant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().toString();
        UserGoogleDto user = new Gson().fromJson(response, UserGoogleDto.class);
        return user;
    }

}