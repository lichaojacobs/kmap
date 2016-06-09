package org.andy.kmap.common.model.entity;

/**
 * Created by lichao on 6/2/16.
 */
public class CourseWiki {
  private int id;
  private Course course;
  private String eLearingUrl;
  private String mookUrl;
  private String wikiUrl;
  private double diffcultRate;
  private double importantRate;
  private double usefulRate;
  private int userCount;
  private boolean isCurrentUserCommented;

  public boolean isCurrentUserCommented() {
    return isCurrentUserCommented;
  }

  public void setCurrentUserCommented(boolean currentUserCommented) {
    isCurrentUserCommented = currentUserCommented;
  }


  public int getUserCount() {
    return userCount;
  }

  public void setUserCount(int userCount) {
    this.userCount = userCount;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public Course getCourse() {
    return course;
  }

  public void setCourse(Course course) {
    this.course = course;
  }

  public String geteLearingUrl() {
    return eLearingUrl;
  }

  public void seteLearingUrl(String eLearingUrl) {
    this.eLearingUrl = eLearingUrl;
  }

  public String getMookUrl() {
    return mookUrl;
  }

  public void setMookUrl(String mookUrl) {
    this.mookUrl = mookUrl;
  }

  public String getWikiUrl() {
    return wikiUrl;
  }

  public void setWikiUrl(String wikiUrl) {
    this.wikiUrl = wikiUrl;
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

  public double getUsefulRate() {
    return usefulRate;
  }

  public void setUsefulRate(double usefulRate) {
    this.usefulRate = usefulRate;
  }

  @Override

  public String toString() {
    return "CourseWiki{" +
        "course=" + course +
        ", eLearingUrl='" + eLearingUrl + '\'' +
        ", mookUrl='" + mookUrl + '\'' +
        ", wikiUrl='" + wikiUrl + '\'' +
        ", diffcultRate=" + diffcultRate +
        ", importantRate=" + importantRate +
        ", usefulRate=" + usefulRate +
        '}';
  }
}
