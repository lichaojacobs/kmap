package org.andy.kmap.common.model.entity;

public class Property {

    private int id;
    private String name;


    public Property(String name) {

        this.name = name;
    }


    public Property(int id, String name) {

        this.id = id;
        this.name = name;
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
}
