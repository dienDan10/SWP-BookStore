package com.swp.bookstore.service;

import com.swp.bookstore.entity.Role;

public interface RoleService {
    Role findRoleByName(String name);
}
