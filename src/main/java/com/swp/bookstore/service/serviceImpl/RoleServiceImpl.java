package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.dao.RoleDAO;
import com.swp.bookstore.dao.daoImpl.RoleDAOImpl;
import com.swp.bookstore.entity.Role;
import com.swp.bookstore.service.RoleService;

public class RoleServiceImpl implements RoleService {

    private RoleDAO roleDAO = new RoleDAOImpl();

    @Override
    public Role findRoleByName(String name) {
        return roleDAO.findRoleByName(name);
    }
}
