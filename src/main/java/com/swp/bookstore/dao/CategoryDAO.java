package com.swp.bookstore.dao;


import com.swp.bookstore.entity.Category;

import java.util.List;

public interface CategoryDAO {
    List<Category> findAll();
    Category findById(int id);
    Category findByName(String name);
    void addCategory(Category category);
    void updateCategory(Category category);
    void deleteCategory(int id);


}
