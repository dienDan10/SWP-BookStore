package com.swp.bookstore.dao;

import com.swp.bookstore.entity.Role;

public interface RoleDAO {
    Role findRoleByName(String name);
}
