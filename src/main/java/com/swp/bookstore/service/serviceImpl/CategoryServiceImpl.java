package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.AuthorDAO;
import com.swp.bookstore.dao.CategoryDAO;
import com.swp.bookstore.dao.daoImpl.AuthorDAOImpl;
import com.swp.bookstore.dao.daoImpl.CategoryDAOImpl;
import com.swp.bookstore.entity.Author;
import com.swp.bookstore.entity.Category;
import com.swp.bookstore.service.AuthorService;
import com.swp.bookstore.service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {

    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    public List<Category> findAll() {
        return categoryDAO.findAll();
    }

    @Override
    public Category findById(int id) {
        return categoryDAO.findById(id);
    }
}
