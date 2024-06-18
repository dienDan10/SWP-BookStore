package com.swp.bookstore.service.serviceImpl;

import com.swp.bookstore.config.Constant;
import com.swp.bookstore.dao.RoleDAO;
import com.swp.bookstore.dao.UserDAO;
import com.swp.bookstore.dao.daoImpl.RoleDAOImpl;
import com.swp.bookstore.dao.daoImpl.UserDAOImpl;
import com.swp.bookstore.dto.UserDTO;
import com.swp.bookstore.dto.UserGoogleDto;
import com.swp.bookstore.entity.User;
import com.swp.bookstore.enums.ROLES;
import com.swp.bookstore.service.UserService;
import com.swp.bookstore.utils.PasswordEncryptor;

import java.util.Arrays;
import java.util.List;

public class UserServiceImpl implements UserService {

    private UserDAO userDAO = new UserDAOImpl();
    private RoleDAO roleDAO = new RoleDAOImpl();

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
        user.setImageURL("img/user-image/default-user-image.png");
        user.setRoles(Arrays.asList(roleDAO.findRoleByName(ROLES.USER.name())));
        user.setActive(true);
        userDAO.save(user);
    }

    @Override
    public void saveUser(UserGoogleDto userGoogleDto) {
        User user = new User();
        user.setName(userGoogleDto.getName());
        user.setEmail(userGoogleDto.getEmail());
        // set default user image
        if (userGoogleDto.getPicture().isEmpty() || userGoogleDto.getPicture().isBlank()) {
            user.setImageURL("img/user-image/default-user-image.png");
        } else {
            user.setImageURL(userGoogleDto.getPicture());
        }
        user.setPassword(PasswordEncryptor.toSHA256(Constant.DEFAULT_PASSWORD));
        user.setRoles(Arrays.asList(roleDAO.findRoleByName(ROLES.USER.name())));
        user.setActive(true);
        userDAO.save(user);
    }

    @Override
    public void updateUser(User user) {
        userDAO.update(user);
    }

    @Override
    public List<User> findAllUsers() {
        return userDAO.findAll();
    }

    @Override
    public User findOneUserById(long id) {
        return userDAO.findById(id);
    }

    @Override
    public long countUsers() {
        return userDAO.countUsers();
    }
}
