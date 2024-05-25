package com.swp.bookstore.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class Email {

    private static final String FROM_EMAIL = "bookstoreswp@gmail.com";

    private static final String PASSWORD = "topj jrwk qcnx awky";

    public static boolean sendEmail(String to, String subject, String body) {

        // Properties: declare properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.starttls.enable", "true");

        // Create authenticator
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        };

        // initiate a working session
        Session session = Session.getInstance(props, auth);

        // Create email message
        MimeMessage message = new MimeMessage(session);
        try {
            message.addHeader("Content-type", "text/HTML; charset=UTF-8"); // set content type
            message.setFrom(FROM_EMAIL);    // set sender email
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false)); // set receive email
            message.setSubject(subject);    // set subject for the mail
            message.setSentDate(new Date());    // set time to send
            message.setContent(body, "text/HTML;charset=UTF-8"); // set content of the mail.

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return false;
    }

}
