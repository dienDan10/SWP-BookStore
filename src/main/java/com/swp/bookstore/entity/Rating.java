package com.swp.bookstore.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Table(name="rating")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private long id;
    @Column(name="book_id")
    private long bookId;
    @Column(name="user_id")
    private long userId;
    @Column(name="title")
    private String title;
    @Column(name="content")
    private String content;
    @Column(name="rating_score")
    private int ratingScore;
    @Column(name="create_time")
    private String createTime;

    @ManyToOne(
            fetch = FetchType.LAZY,
            cascade = {CascadeType.DETACH,CascadeType.MERGE,
                    CascadeType.PERSIST,CascadeType.REFRESH}
    )
    @JoinColumn(name="book_id")
    private Book book;

    @ManyToOne(
            fetch = FetchType.EAGER,
            cascade = {CascadeType.DETACH,CascadeType.MERGE,
                    CascadeType.PERSIST,CascadeType.REFRESH}
    )
    @JoinColumn(name = "user_id")
    private User user;

}
