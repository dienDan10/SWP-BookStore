package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="order_delivery_address")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderAddress {
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

}
