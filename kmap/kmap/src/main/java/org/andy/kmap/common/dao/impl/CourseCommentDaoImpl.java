package org.andy.kmap.common.dao.impl;

import org.andy.kmap.common.dao.CourseCommentDao;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 * Created by lichao on 6/2/16.
 */
@Repository
public class CourseCommentDaoImpl implements CourseCommentDao {
  private static Logger logger = Logger.getLogger(CourseRateDaoImpl.class);
  @Autowired
  JdbcTemplate jdbcTemplate;
}
