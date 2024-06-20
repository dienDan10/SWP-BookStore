package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name="users")
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;

    @Column(name="name")
    private String name;

    @Column(name="username")
    private String username;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Column(name="phone_number")
    private String phoneNumber;

    @Column(name="gender")
    private boolean gender;

    @Column(name="birth_date")
    private String birthDate;

    @Column(name="image_url")
    private String imageURL;

    @Column(name="is_active")
    private boolean isActive;

    @ManyToMany(fetch = FetchType.EAGER,
    cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH})
    @JoinTable(
        name="user_role",
        joinColumns = @JoinColumn(name="user_id"),
            inverseJoinColumns = @JoinColumn(name="role_id")
    )
    private List<Role> roles;


    public boolean hasRole(String role) {
        if (roles == null) {
            return false;
        }
        for (Role item : roles) {
            if (item.getName().equals(role))
                return true;
        }
        return false;
    }

}
