package com.example.mywebapp.model;

import javax.persistence.*;

@Entity
@Table(name = "passcode")   // Map to the table explicitly
public class Passcode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")   // Maps to column `id`
    private Integer id;

    @Column(name = "pass", columnDefinition = "TEXT")   // Maps to column `pass` as TEXT
    private String pass;

    // Getters and Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
