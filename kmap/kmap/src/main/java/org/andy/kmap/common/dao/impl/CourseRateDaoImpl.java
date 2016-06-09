package org.andy.kmap.common.dao.impl;

import org.andy.kmap.common.dao.CourseRateDao;
import org.andy.kmap.common.model.entity.CourseRate;
import org.andy.kmap.common.model.entity.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lichao on 6/2/16.
 */
@Repository
public class CourseRateDaoImpl implements CourseRateDao {
  private static Logger logger = Logger.getLogger(CourseRateDaoImpl.class);
  private static final String ADD_COMMENT = "insert into course_rate(course_id,user_email,comment,important_rate,useful_rate,diffculty_rate) values(?,?,?,?,?,?)";
  private static final String GET_COMMENTS = "select * from course_rate where course_id=?";
  private static final String GET_COMMENT_By_USEREMAIL = "select * from course_rate where user_email=? and course_id=?";

  @Autowired
  JdbcTemplate jdbcTemplate;

  @Override
  public boolean addComment(CourseRate courseRate) {
    try {
      jdbcTemplate.update(ADD_COMMENT, new Object[]{
          courseRate.getCourseId(),
          courseRate.getUser().getEmail(),
          courseRate.getComment(),
          courseRate.getImportantRate(),
          courseRate.getUsefulRate(),
          courseRate.getDiffcultRate()
      });

      return true;
    } catch (Exception ex) {
      logger.error("CourseRateDaoImpl error,error is " + ex.getMessage());
    }

    return false;
  }

  @Override
  public List<CourseRate> getCourseRates(final int courseId) {
    final List<CourseRate> courseRateList = new ArrayList<>();
    jdbcTemplate.query(GET_COMMENTS, new Object[]{courseId}, new RowCallbackHandler() {
      @Override
      public void processRow(ResultSet resultSet) throws SQLException {
        CourseRate courseRate = new CourseRate();
        courseRate.setComment(resultSet.getString("comment"));
        courseRate.setCourseId(resultSet.getInt("course_id"));
        courseRate.setDiffcultRate(resultSet.getDouble("diffculty_rate"));
        courseRate.setImportantRate(resultSet.getDouble("important_rate"));
        courseRate.setUsefulRate(resultSet.getDouble("useful_rate"));
        courseRate.setUser(new User(resultSet.getString("user_email"), ""));
        courseRate.setId(resultSet.getInt("id"));
        courseRateList.add(courseRate);
      }
    });

    return courseRateList;
  }

  @Override
  public CourseRate getCourseRateByUserEmail(String userEmail, int courseId) {
    CourseRate courseRate = null;
    try {
      courseRate = jdbcTemplate
          .queryForObject(GET_COMMENT_By_USEREMAIL, new Object[]{userEmail, courseId},
              new RowMapper<CourseRate>() {
                @Override
                public CourseRate mapRow(ResultSet resultSet, int i) throws SQLException {
                  CourseRate tempRate = new CourseRate();
                  tempRate.setId(resultSet.getInt("id"));
                  tempRate.setDiffcultRate(resultSet.getDouble("diffculty_rate"));
                  tempRate.setImportantRate(resultSet.getDouble("important_rate"));
                  tempRate.setUsefulRate(resultSet.getDouble("useful_rate"));
                  return tempRate;
                }
              });
    } catch (Exception ex) {
      logger.error("getCourseRateByUserEmail error,error is" + ex.getMessage());
    }

    return courseRate;
  }


}
