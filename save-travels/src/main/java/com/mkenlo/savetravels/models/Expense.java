package com.mkenlo.savetravels.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
public class Expense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private long id;

    @Column
    @NotNull(message = "Expense's name must not be empty")
    @NotBlank(message = "Expense's name must not be empty")
    private String name;

    @Column
    @NotNull(message = "Vendor's name must not be empty")
    @NotBlank(message = "Vendor's name must not be empty")
    private String vendor;

    @Column
    @NotNull(message = "Amount value must not be empty")
    @Min(value = 1, message = "Amount value must be greater than 0")
    private double amount;

    @Column
    @NotNull(message = "Description name must not be empty")
    @NotBlank(message = "Description name must not be empty")
    private String description;

    public Expense() {
    }

    public Expense(long id, String name, String vendor, double amount, String description) {
        this.id = id;
        this.name = name;
        this.vendor = vendor;
        this.amount = amount;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
