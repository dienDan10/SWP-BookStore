package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Entity
@Table(name="payment")
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="payment_status")
    private String status;
    @Column(name="payment_type")
    private String type;
    @Column(name="amount")
    private long amount;
    @Column(name="create_time")
    private LocalDateTime createdTime;
}
