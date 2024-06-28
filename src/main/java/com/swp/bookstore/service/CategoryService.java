package com.swp.bookstore.service;

import com.swp.bookstore.entity.Category;
import com.swp.bookstore.entity.Publisher;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    Category findById(int id);
    Category findByName(String name);
    void addCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(int id);
}
