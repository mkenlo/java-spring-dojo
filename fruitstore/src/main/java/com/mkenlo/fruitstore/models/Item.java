package com.mkenlo.fruitstore.models;

public class Item {
    // MEMBER VARIABLES
    private String name;
    private double price;

    // CONSTRUCTOR
    public Item(String name, double price) {
        this.name = name;
        this.price = price;
    }

    /**
     * @return String return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return double return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

}
