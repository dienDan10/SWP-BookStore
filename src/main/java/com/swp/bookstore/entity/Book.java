package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Entity
@Table(name="book")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="name")
    private String name;
    @Column(name="description")
    private String description;
    @Column(name="published_date")
    private String publishedDate;
    @Column(name="author_id")
    private int authorId;
    @Column(name="category_id")
    private int categoryId;
    @Column(name="publisher_id")
    private int publisherId;
    @Column(name="number_of_page")
    private int pageCount;
    @Column(name="price")
    private double price;
    @Column(name="image_front")
    private String imageFront;
    @Column(name="image_back")
    private String imageBack;
    @Column(name="summary")
    private String summary;
    @Column(name="quantity")
    private int quantity;
    @Column(name="average_rating")
    private double averageRating;
    @Column(name="sold_num")
    private int soldNum;

    @ManyToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}
    )
    @JoinColumn(name="author_id")
    private Author author;

    @ManyToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}
    )
    @JoinColumn(name="category_id")
    private Category category;

    @ManyToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}
    )
    @JoinColumn(name="publisher_id")
    private Publisher publisher;

    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "book",
            cascade = {CascadeType.MERGE, CascadeType.REFRESH, CascadeType.DETACH}
    )
    private List<Rating> ratings;
}
