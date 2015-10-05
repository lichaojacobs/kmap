package org.andy.kmap.model.entity;

public class Bonus {

    private int id;
    private int score;
    private String info;

    private User user;
    private Detail detail;


    public Bonus(String info) {
        this.info = info;
    }


    public int getId() {

        return this.id;
    }

    public void setId(int id) {

        this.id = id;
    }

    public int getScore() {

        return this.score;
    }

    public void setScore(int score) {

        this.score = score;
    }

    public String getInfo() {

        return this.info;
    }

    public void setInfo(String info) {

        this.info = info;
    }

    public User getUser() {

        return this.user;
    }

    public void setUser(User user) {

        this.user = user;
    }

    public Detail getDetail() {

        return this.detail;
    }

    public void setDetail(Detail detail) {

        this.detail = detail;
    }
}
