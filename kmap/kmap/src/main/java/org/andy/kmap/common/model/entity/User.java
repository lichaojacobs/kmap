package org.andy.kmap.common.model.entity;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;

    private String eid;
    private String epassword;
    private int majorId;
    private Major major;

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public User(String email, String password) {

        this.email = email;
        this.password = password;
    }


    public User(String name, String email, String password) {

        this.name = name;
        this.email = email;
        this.password = password;
        this.majorId=0;
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

    public String getEmail() {

        return this.email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getPassword() {

        return this.password;
    }

    public void setPassword(String password) {

        this.password = password;
    }


    public String getEpassword() {

        return this.epassword;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public void setEpassword(String epassword) {

        this.epassword = epassword;
    }

    public Major getMajor() {

        return this.major;
    }

    public void setMajor(Major major) {

        this.major = major;
    }
}
