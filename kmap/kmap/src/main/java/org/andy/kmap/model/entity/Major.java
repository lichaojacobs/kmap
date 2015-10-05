package org.andy.kmap.model.entity;

public class Major {

    private int id;
    private int year;
    private String name;
    private String info;


    public Major(int year, String name) {

        this.year = year;
        this.name = name;
    }


    public int getId() {

        return this.id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public int getYear() {

        return this.year;
    }

    public void setYear(int year) {

        this.year = year;
    }

    public String getName() {

        return this.name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public String getInfo() {

        return this.info;
    }

    public void setInfo(String info) {

        this.info = info;
    }
}
