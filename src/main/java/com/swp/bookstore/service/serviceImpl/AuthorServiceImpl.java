package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.AuthorDAO;
import com.swp.bookstore.dao.daoImpl.AuthorDAOImpl;
import com.swp.bookstore.entity.Author;
import com.swp.bookstore.service.AuthorService;

import java.util.List;

public class AuthorServiceImpl implements AuthorService {

    private AuthorDAO authorDAO = new AuthorDAOImpl();

    @Override
    public List<Author> findAll() {
        return authorDAO.findAll();
    }

    @Override
    public void addAuthor(Author author) {
        authorDAO.addAuthor(author);
    }

    @Override
    public Author findAuthorByName(String name) {
        return authorDAO.findAuthorByName(name);
    }

    @Override
    public void updateAuthor(Author author) { authorDAO.updateAuthor(author); }

    @Override
    public void deleteAuthor(int id) { authorDAO.deleteAuthor(id); }

    @Override
    public Author findById(int id){ return authorDAO.findById(id); }
}
