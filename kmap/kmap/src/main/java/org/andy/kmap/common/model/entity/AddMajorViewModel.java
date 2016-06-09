package org.andy.kmap.common.model.entity;

import java.util.List;

/**
 * Created by li on 2015/10/13.
 */
public class AddMajorViewModel {

    private int id;
    private String academyName;
    private List<Major> majors;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAcademyName() {
        return academyName;
    }

    public void setAcademyName(String academyName) {
        this.academyName = academyName;
    }

    public List<Major> getMajors() {
        return majors;
    }

    public void setMajors(List<Major> majors) {
        this.majors = majors;
    }

}
