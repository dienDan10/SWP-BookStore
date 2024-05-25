package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.config.Constant;
import com.swp.bookstore.dao.UserDAO;
import com.swp.bookstore.dao.daoImpl.UserDAOImpl;
import com.swp.bookstore.dto.UserDTO;
import com.swp.bookstore.dto.UserGoogleDto;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.utils.PasswordEncryptor;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    public User findOneByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    @Override
    public void saveUser(UserDTO userDTO) {
        User user = new User();
        user.setName(userDTO.getName());
        user.setEmail(userDTO.getEmail());
        user.setPassword(PasswordEncryptor.toSHA256(userDTO.getPassword()));
        user.setUsername(userDTO.getUsername());
        user.setBirthDate(userDTO.getBirthDate());
        user.setGender(userDTO.isGender());
        user.setPhoneNumber(userDTO.getPhone());

        userDAO.save(user);
    }

    @Override
    public void saveUser(UserGoogleDto userGoogleDto) {
        User user = new User();
        user.setName(userGoogleDto.getName());
        user.setEmail(userGoogleDto.getEmail());
        user.setImageURL(user.getImageURL());
        user.setPassword(PasswordEncryptor.toSHA256(Constant.DEFAULT_PASSWORD));
        userDAO.save(user);
    }

    @Override
    public void updateUser(User user) {
        userDAO.update(user);
    }
}
