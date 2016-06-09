package org.andy.kmap.common.model.entity;

public class Course {

    private int id;
    private String name;
    private String info;
    private int academyId;

    public int getAcademyId() {
        return academyId;
    }

    public void setAcademyId(int academyId) {
        this.academyId = academyId;
    }

    private int categoryId;
    private int propertyId;
    private double mark;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    private double credit;

    private Category category;
    private Property property;


    public Course(int id) {

        this.id = id;
    }


    public Course(String name) {

        this.name = name;
    }


    public Course(int id, String name) {

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


    public String getInfo() {

        return this.info;
    }


    public void setInfo(String info) {

        this.info = info;
    }


    public double getMark() {

        return this.mark;
    }


    public void setMark(double mark) {

        this.mark = mark;
    }


    public double getCredit() {

        return this.credit;
    }


    public void setCredit(double credit) {

        this.credit = credit;
    }


    public Category getCategory() {

        return this.category;
    }


    public void setCategory(Category category) {

        this.category = category;
    }


    public Property getProperty() {

        return this.property;
    }


    public void setProperty(Property property) {

        this.property = property;
    }


    @Override
    public int hashCode() {

        return this.getId();
    }


    @Override
    public boolean equals(Object other) {

        if (this == other)
            return true;
        if (other instanceof Course) {
            Course course = (Course) other;
            return this.getId() == course.getId();
        }

        return false;
    }
}
