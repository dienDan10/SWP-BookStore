package com.swp.bookstore.service;

import com.swp.bookstore.entity.Payment;

public interface PaymentService {
    Payment savePayment(Payment payment);
    Payment findById(long id);
}
