package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.PaymentDAO;
import com.swp.bookstore.dao.daoImpl.PaymentDAOImpl;
import com.swp.bookstore.entity.Payment;
import com.swp.bookstore.service.PaymentService;

public class PaymentServiceImpl implements PaymentService {
    private PaymentDAO paymentDAO = new PaymentDAOImpl();

    @Override
    public Payment savePayment(Payment payment) {
        return paymentDAO.savePayment(payment);
    }

    @Override
    public Payment findById(long id) {
        return paymentDAO.findById(id);
    }

    @Override
    public void updatePayment(Payment payment) {
        paymentDAO.updatePayment(payment);
    }
}
