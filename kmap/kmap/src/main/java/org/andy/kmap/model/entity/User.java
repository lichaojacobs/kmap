package org.andy.kmap.model.entity;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;

    private int eid;
    private String epassword;

    private Major major;


    public User(String email, String password) {

        this.email = email;
        this.password = password;
    }


    public User(String name, String email, String password) {

        this.name = name;
        this.email = email;
        this.password = password;
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

    public int getEid() {

        return this.eid;
    }

    public void setEid(int eid) {

        this.eid = eid;
    }

    public String getEpassword() {

        return this.epassword;
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
