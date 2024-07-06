package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Payment;

public interface PaymentDAO {
    Payment savePayment(Payment payment);
    Payment findById(long id);
    void updatePayment(Payment payment);
    long getTotalIncomeByDayAgo(int day);
    long getTotalIncomeByMonthAgo(int month);
    long getTotalIncome();
}
