package org.andy.kmap.common.model.entity;

public class Major {

    private int id;
    private int year;
    private String name;
    private String info;
    private int academyId;

    public int getAcademyId() {
        return academyId;
    }

    public void setAcademyId(int academyId) {
        this.academyId = academyId;
    }

    public Major(int id, String name) {

        this.id = id;
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
