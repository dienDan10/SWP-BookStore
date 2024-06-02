package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.PublisherDAO;
import com.swp.bookstore.dao.daoImpl.PublisherDAOImpl;
import com.swp.bookstore.entity.Publisher;
import com.swp.bookstore.service.PublisherService;

import java.util.List;

public class PublisherServiceImpl implements PublisherService {

    private PublisherDAO publisherDAO = new PublisherDAOImpl();

    @Override
    public List<Publisher> findAll() {
        return publisherDAO.findAll();
    }
}
