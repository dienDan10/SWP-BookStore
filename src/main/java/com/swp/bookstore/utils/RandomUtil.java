package com.swp.bookstore.utils;

import java.util.Random;

public class RandomUtil {

    private static final Random rand = new Random();
    private static final String NUMS = "0123456789";
    public static String getOTPCode() {
        StringBuilder str = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            str.append(NUMS.charAt(rand.nextInt(NUMS.length())));
        }
        return str.toString();
    }

}
