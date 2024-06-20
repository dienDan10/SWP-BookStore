package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name="orders")
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="order_status")
    private String status;
    @Column(name="create_time")
    private LocalDateTime createdTime;
    @Column(name="deliver_time")
    private LocalDateTime deliverTime;
    @Column(name="received_time")
    private LocalDateTime receivedTime;

    @OneToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE}
    )
    @JoinColumn(name="user_id")
    private User user;

    @OneToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE}
    )
    @JoinColumn(name="payment_id")
    private Payment payment;

    @OneToMany(
            fetch = FetchType.LAZY,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE},
            mappedBy = "order"
    )
    private List<OrderDetail> orderDetails;

    @OneToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH}
    )
    @JoinColumn(name="order_address_id")
    private OrderAddress address;

}
