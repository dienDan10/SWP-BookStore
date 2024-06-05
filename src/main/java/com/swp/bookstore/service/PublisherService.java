package com.swp.bookstore.service;


import com.swp.bookstore.entity.Publisher;

import java.util.List;

public interface PublisherService {
    List<Publisher> findAll();
    Publisher findById(int id);
}
