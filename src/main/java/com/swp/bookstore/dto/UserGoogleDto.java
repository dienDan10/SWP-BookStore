package com.swp.bookstore.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserGoogleDto {
    private String id;
    private String email;
    private String first_name;
    private String given_name;
    private String family_name;
    private String name;
    private boolean verified_email;
    private String picture;

}