package org.andy.kmap.model.entity;

public class Category {

    private int id;
    private String name;
    private String color;


    public Category(String name) {

        this.name = name;
    }


    public Category(int id, String name, String color) {

        this.id = id;
        this.name = name;
        this.color = color;
    }


    public int getId() {

        return this.id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public String getName() {

        return this.name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public String getColor() {

        return this.color;
    }

    public void setColor(String color) {

        this.color = color;
    }
}
