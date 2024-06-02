package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Publisher;

import java.util.List;

public interface PublisherDAO {
    List<Publisher> findAll();
}
