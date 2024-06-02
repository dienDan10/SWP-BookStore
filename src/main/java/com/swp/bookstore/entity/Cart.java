package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name="cart")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="book_id")
    private long bookId;
    @Column(name="user_id")
    private long userId;
    @Column(name="quantity")
    private int quanity;
}
