package org.andy.kmap.common.model.entity.CoursePlanAddModels;

/**
 * Created by li on 2015/10/31.
 */
public class CourseViewModel {

    private int courseid;
    private String coursename;
    private double credit;
    private String category;

    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
