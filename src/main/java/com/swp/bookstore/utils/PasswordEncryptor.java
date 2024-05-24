package com.swp.bookstore.utils;

import com.google.common.hash.Hashing;

import java.nio.charset.StandardCharsets;

public class PasswordEncryptor {

    private static final String SALT = "alkfdjaslkfdasjl918476271843287@%@#$%#@%%@#$%";

    public static String toSHA256(String password) {
        password = password + SALT;
        return Hashing.sha256().hashString(password, StandardCharsets.UTF_8).toString();
    }

}
