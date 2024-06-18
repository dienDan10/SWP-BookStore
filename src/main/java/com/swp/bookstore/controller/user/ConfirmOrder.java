package com.swp.bookstore.controller.user;

import com.swp.bookstore.config.OrderStatus;
import com.swp.bookstore.config.PaymentStatus;
import com.swp.bookstore.config.PaymentType;
import com.swp.bookstore.config.Vnpay;
import com.swp.bookstore.entity.*;
import com.swp.bookstore.service.*;
import com.swp.bookstore.service.serviceImpl.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name="ConfirmOrder", urlPatterns = "/confirm-order")
public class ConfirmOrder extends HttpServlet {

    private CartService cartService;
    private AddressService addressService;
    private OrderService orderService;
    private PaymentService paymentService;
    private OrderDetailService orderDetailService;
    private OrderAddressService orderAddressService;

    @Override
    public void init() throws ServletException {
        cartService = new CartServiceImpl();
        addressService = new AddressServiceImpl();
        orderService = new OrderServiceImpl();
        paymentService = new PaymentServiceImpl();
        orderDetailService = new OrderDetailServiceImpl();
        orderAddressService = new OrderAddressServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //vnp_TransactionStatus, vnp_ResponseCode
        // get user
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // check payment failed
        String transactionStatus = req.getParameter("vnp_TransactionStatus");
        String responseCode = req.getParameter("vnp_ResponseCode");
        if (!transactionStatus.equals("00") || !responseCode.equals("00")) {    // return to checkout page and display message
            List<Address> addresses = addressService.findAllByUserId(user.getId());
            List<Cart> items = (List<Cart>)session.getAttribute("cartItems");
            // return to checkout page
            session.setAttribute("errMsg", "Payment failed!");
            req.setAttribute("addresses", addresses);
            req.setAttribute("items", items);
            req.getRequestDispatcher("checkout.jsp").forward(req, resp);
            return;
        }
        // get address id and cart items from session
        String addressId = session.getAttribute("addressId").toString();
        List<Cart> items = (List<Cart>)session.getAttribute("cartItems");
        long amount = Long.parseLong(req.getParameter("vnp_Amount")) / 100;
        // get current time
        String currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
        // create and save payment
        Payment payment = new Payment();
        payment.setStatus(PaymentStatus.PAYED);
        payment.setAmount(amount);
        payment.setType(PaymentType.VNPAY);
        payment.setCreatedTime(currentTime);
        // save payment
        payment = paymentService.savePayment(payment);
        // create and save order
        Order order = new Order();
        order.setUser(user);
        order.setPayment(payment);
        order.setStatus(OrderStatus.DANG_XU_LY);
        order.setCreatedTime(currentTime);
        Address address = addressService.findById(Integer.parseInt(addressId));
        OrderAddress orderAddress = orderAddressService.saveOrderAddress(address);
        order.setAddress(orderAddress);
        // save order
        order = orderService.saveOrder(order);
        // create order detail and remove item from cart
        for(Cart cart : items) {
            OrderDetail orderDetail = new OrderDetail();
            Book book = cart.getBook();
            orderDetail.setQuantity(cart.getQuantity());
            orderDetail.setBookId(cart.getBook().getId());
            orderDetail.setBookName(cart.getBook().getName());
            orderDetail.setBookImageFront(cart.getBook().getImageFront());
            orderDetail.setRated(false);
            orderDetail.setPrice(cart.getBook().getPrice() * cart.getQuantity());
            orderDetail.setOrder(order);
            orderDetailService.addOrderDetail(orderDetail);
            cartService.removeCart(cart.getId());
        }
        // remove order information from session
        session.removeAttribute("cartItems");
        session.removeAttribute("addressId");
        // redirect to order detail page
        session.setAttribute("successMsg", "Đặt hàng thành công!");
        resp.sendRedirect(req.getContextPath() + "/view-order-detail?orderId=" + order.getId());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // get information from request
        String addressId = req.getParameter("addressId");
        String[] cartIds = req.getParameterValues("cartId");
        String paymentMethod = req.getParameter("payment-method");
        // get list of cart item
        List<Cart> cartItems = new ArrayList<>();
        for (String cartId : cartIds) {
            cartItems.add(cartService.findCartById(Integer.parseInt(cartId)));
        }
        // calculate total price
        long totalPrice = 0;
        for (Cart cart : cartItems) {
            totalPrice += (long) (cart.getQuantity() * cart.getBook().getPrice());
        }
        // check for pay by vnpay
        if (paymentMethod.equals("vnpay")) {

            System.out.println(totalPrice);
            // get payment url
            String paymentUrl = getPaymentURL(totalPrice, req);
            // save order info to session
            session.setAttribute("cartItems", cartItems);
            session.setAttribute("addressId", addressId);
            // redirect to vn pay
            resp.sendRedirect(paymentUrl);
            return;
        }
        // handle pay by cash
        // get current time
        String currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
        // create payment
        Payment payment = new Payment();
        payment.setStatus(PaymentStatus.NOT_PAY);
        payment.setAmount(totalPrice);
        payment.setType(PaymentType.OCD);
        payment.setCreatedTime(currentTime);
        // save payment
        payment = paymentService.savePayment(payment);
        // create order
        Order order = new Order();
        order.setUser(user);
        order.setPayment(payment);
        order.setStatus(OrderStatus.DANG_XU_LY);
        order.setCreatedTime(currentTime);
        Address address = addressService.findById(Integer.parseInt(addressId));
        OrderAddress orderAddress = orderAddressService.saveOrderAddress(address);
        order.setAddress(orderAddress);
        // save order
        order = orderService.saveOrder(order);
        // create order detail and remove item from cart
        for(Cart cart : cartItems) {
            OrderDetail orderDetail = new OrderDetail();
            Book book = cart.getBook();
            orderDetail.setQuantity(cart.getQuantity());
            orderDetail.setBookId(book.getId());
            orderDetail.setBookName(book.getName());
            orderDetail.setBookImageFront(book.getImageFront());
            orderDetail.setRated(false);
            orderDetail.setPrice(cart.getBook().getPrice() * cart.getQuantity());
            orderDetail.setOrder(order);
            orderDetailService.addOrderDetail(orderDetail);
            cartService.removeCart(cart.getId());
        }
        // redirect to order detail page
        session.setAttribute("successMsg", "Đặt hàng thành công!");
        resp.sendRedirect( req.getContextPath() + "/view-order-detail?orderId=" + order.getId());

    }

    private String getPaymentURL(long paymentAmount, HttpServletRequest req) throws UnsupportedEncodingException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = paymentAmount*100;
//        String bankCode = "NCB";

        String vnp_TxnRef = Vnpay.getRandomNumber(8);
        String vnp_IpAddr = "1.1.1.1";

        String vnp_TmnCode = Vnpay.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");


//        if (bankCode != null && !bankCode.isEmpty()) {
//            vnp_Params.put("vnp_BankCode", bankCode);
//        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Vnpay.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator<String> itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Vnpay.hmacSHA512(Vnpay.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Vnpay.vnp_PayUrl + "?" + queryUrl;
        return paymentUrl;
    }

}
