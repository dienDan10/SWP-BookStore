package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Publisher;

import java.util.List;

public interface PublisherDAO {
    List<Publisher> findAll();
    Publisher findById(int id);
    Publisher findByName(String name);
    void addPublisher(Publisher publisher);
    void updatePublisher(Publisher publisher);
    void deletePublisher(int id);

}
