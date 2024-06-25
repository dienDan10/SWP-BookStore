package com.swp.bookstore.service;

import com.swp.bookstore.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    Category findById(int id);
    Category findByName(String name);
}
