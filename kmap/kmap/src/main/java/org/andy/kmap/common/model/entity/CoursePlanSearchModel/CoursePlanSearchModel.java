package org.andy.kmap.common.model.entity.CoursePlanSearchModel;

/**
 * Created by lichao on 15/12/17.
 */
public class CoursePlanSearchModel {
    private int courseid;
    private String coursename;
    private double credit;
    private String related;

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

    public String getRelated() {
        return related;
    }

    public void setRelated(String related) {
        this.related = related;
    }
}
