package com.swp.bookstore.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private String name;
    private String username;
    private String password;
    private String email;
    private String phone;
    private boolean gender;
    private String birthDate;
}
