package org.andy.kmap.common.model.entity;

import org.andy.kmap.common.model.entity.User;

/**
 * Created by lichao on 16/6/8.
 */
public class CourseRate {
  private int id;
  private int courseId;
  private User user;
  private String comment;
  private double diffcultRate;
  private double importantRate;
  private double usefulRate;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public int getCourseId() {
    return courseId;
  }

  public void setCourseId(int courseId) {
    this.courseId = courseId;
  }

  public User getUser() {
    return user;
  }

  public void setUser(User user) {
    this.user = user;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public double getDiffcultRate() {
    return diffcultRate;
  }

  public void setDiffcultRate(double diffcultRate) {
    this.diffcultRate = diffcultRate;
  }

  public double getImportantRate() {
    return importantRate;
  }

  public void setImportantRate(double importantRate) {
    this.importantRate = importantRate;
  }

  @Override
  public String toString() {
    return "CourseRate{" +
        "id=" + id +
        ", courseId=" + courseId +
        ", user=" + user +
        ", comment='" + comment + '\'' +
        ", diffcultRate=" + diffcultRate +
        ", importantRate=" + importantRate +
        ", usefulRate=" + usefulRate +
        '}';
  }

  public double getUsefulRate() {
    return usefulRate;
  }

  public void setUsefulRate(double usefulRate) {
    this.usefulRate = usefulRate;
  }
}
