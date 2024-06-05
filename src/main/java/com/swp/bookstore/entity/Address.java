package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="delivery_address")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="receiver_name")
    private String receiver;
    @Column(name="receiver_phone")
    private String phone;
    @Column(name="province")
    private String province;
    @Column(name="district")
    private String district;
    @Column(name="town")
    private String town;
    @Column(name="village")
    private String village;
    @Column(name="details")
    private String detail;
    @Column(name="is_default")
    private boolean isDefault;
    @Column(name="user_id")
    private long userId;
}
