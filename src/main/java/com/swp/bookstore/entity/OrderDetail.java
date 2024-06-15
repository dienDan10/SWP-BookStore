package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name="order_detail")
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="book_quantity")
    private int quantity;
    @Column(name="price")
    private long price;
    @Column(name="is_rated")
    private boolean isRated;
    @Column(name="book_name")
    private String bookName;
    @Column(name="book_image_front")
    private String bookImageFront;
    @Column(name="book_id")
    private long bookId;

    @ManyToOne(
            fetch = FetchType.LAZY,
            cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH}
    )
    @JoinColumn(name="order_id")
    private Order order;


}
