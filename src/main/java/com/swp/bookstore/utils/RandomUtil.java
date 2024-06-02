package com.swp.bookstore.utils;

import java.util.Random;

public class RandomUtil {

    private static final Random rand = new Random();
    private static final String CHARS = "0123456789qwertyuioplkjhgfdsazxcvbnmMNBVCXZASDFGHJKLPOIUYTREWQ";
    public static String getOTPCode() {
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < 8; i++) {
            str.append(CHARS.charAt(rand.nextInt(CHARS.length())));
        }
        return str.toString();
    }

}
