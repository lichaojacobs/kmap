package org.andy.kmap.common.dao.impl;

import org.andy.kmap.common.dao.CourseWikiDao;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.Course;
import org.andy.kmap.common.model.entity.CourseWiki;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lichao on 6/2/16.
 */
@Repository
public class CourseWikiDaoImpl implements CourseWikiDao {

  private static Logger logger = Logger.getLogger(CourseWikiDao.class);
  private static final String GET_COURSE_WIKI_BY_COURSE_ID = "select * from course_wiki where course_id=?";
  private static final String GET_COURSE_BY_COURSE_ID = "select * from course where id=?";
  private static final String ADD_COURSE_WIKI_BY_COURSE_ID = "insert into course_wiki(course_id,diffculty_rate,important_rate,useful_rate) values(?,?,?,?)";
  private static final String EDIT_COURSEINFO = "update course set info=? where id=?";
  private static final String UPDATE_COURSEWIKI_BY_COURSE_ID = "update course_wiki set diffculty_rate=? ,important_rate=? ,useful_rate=? , user_count=? where course_id=?";
  private static final double INITIAL_RATE = 0.0;
  @Autowired
  JdbcTemplate jdbcTemplate;

  @Override
  public CourseWiki getCourseWikiByCourseId(int courseId) {

    CourseWiki courseWiki = null;
    Course course = null;
    try {
      courseWiki = jdbcTemplate.queryForObject(GET_COURSE_WIKI_BY_COURSE_ID, new Object[]{courseId},
          new RowMapper<CourseWiki>() {
            @Override
            public CourseWiki mapRow(ResultSet resultSet, int i) throws SQLException {
              CourseWiki tempWiki = null;
              tempWiki = new CourseWiki();
              tempWiki.setId(resultSet.getInt("id"));
              tempWiki.setDiffcultRate(resultSet.getDouble("diffculty_rate"));
              tempWiki.setImportantRate(resultSet.getDouble("important_rate"));
              tempWiki.setUsefulRate(resultSet.getDouble("useful_rate"));
              tempWiki.seteLearingUrl(resultSet.getString("e_learning_url"));
              tempWiki.setMookUrl(resultSet.getString("mook_url"));
              tempWiki.setWikiUrl("wiki_url");
              return tempWiki;
            }
          });

      //如果为null就添加
      if (courseWiki == null) {
        jdbcTemplate.update(ADD_COURSE_WIKI_BY_COURSE_ID,
            new Object[]{courseId, INITIAL_RATE, INITIAL_RATE, INITIAL_RATE});
        courseWiki = new CourseWiki();
        courseWiki.setMookUrl("");
        courseWiki.setWikiUrl("");
        courseWiki.seteLearingUrl("");
        courseWiki.setUsefulRate(INITIAL_RATE);
        courseWiki.setImportantRate(INITIAL_RATE);
        courseWiki.setDiffcultRate(INITIAL_RATE);
      }

      if (courseWiki != null) {
        //填充Course
        course = jdbcTemplate.queryForObject(GET_COURSE_BY_COURSE_ID, new Object[]{courseId},
            new RowMapper<Course>() {
              @Override
              public Course mapRow(ResultSet resultSet, int i) throws SQLException {
                Course tempCourse = new Course(resultSet.getInt("id"), resultSet.getString("name"));
                tempCourse.setInfo(resultSet.getString("info"));
                tempCourse.setCredit(resultSet.getDouble("credit"));

                return tempCourse;
              }
            });
        courseWiki.setCourse(course);
      }

    } catch (Exception ex) {
      logger.error("CourseWikiDaoImpl getCourseWikiByCourseId error, error " + ex.getMessage());
    }

    return courseWiki;
  }

  public boolean editCourseInfo(int courseId, String info) {
    try {
      jdbcTemplate.update(EDIT_COURSEINFO, new Object[]{info, courseId});
      return true;

    } catch (Exception ex) {
      logger.error("editCourseInfo error,error is " + ex.getMessage());
    }
    return false;
  }

  public boolean updateCourseWikiByCourseId(CourseWiki courseWiki) {
    try {
      jdbcTemplate.update(UPDATE_COURSEWIKI_BY_COURSE_ID, new Object[]{
          courseWiki.getDiffcultRate(),
          courseWiki.getImportantRate(),
          courseWiki.getUsefulRate(),
          courseWiki.getUserCount(),
          courseWiki.getCourse().getId()
      });

      return true;
    } catch (Exception ex) {
      logger.error("updateCourseWikiByCourseId error,error is" + ex.getMessage());
    }

    return false;
  }
}
