package com.swp.bookstore.service;

import com.swp.bookstore.dto.UserDTO;
import com.swp.bookstore.dto.UserGoogleDto;
import com.swp.bookstore.entity.User;

public interface UserService {

    User findOneByEmail(String email);

    void saveUser(UserDTO userDTO);

    void updateUser(User user);

    void saveUser(UserGoogleDto userGoogleDto);

}
