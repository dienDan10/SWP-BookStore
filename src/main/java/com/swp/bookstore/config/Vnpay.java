package com.swp.bookstore.config;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Random;

public class Vnpay {

    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static String vnp_ReturnUrl = "http://localhost:8080/bookstore/confirm-order";
    public static String vnp_TmnCode = "CQ6XZHVK";
    public static String secretKey = "2A3I12UZZWTY1NOQETQ72LNFKB3S8K0R";
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";


    public static String hmacSHA512(final String key, final String data) {
        try {

            if (key == null || data == null) {
                throw new NullPointerException();
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }


    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

}
