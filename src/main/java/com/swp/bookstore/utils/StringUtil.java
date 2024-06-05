package com.swp.bookstore.utils;

import java.text.DecimalFormat;
import java.util.Scanner;

public class StringUtil {

    // format a sql string with line break to html string with line break
    public static String toHTMLString(String str) {
        StringBuffer res = new StringBuffer();
        try (Scanner sc = new Scanner(str)) {
            while (sc.hasNextLine()) {
                res.append(sc.nextLine());
                res.append("</br>");
            }
        } catch (IllegalStateException e) {
            e.printStackTrace();
        }

        return res.toString();
    }

    public static String formatBookPrice(double price) {
        DecimalFormat df = new DecimalFormat("###,###,###");
        return df.format(price);
    }


}
