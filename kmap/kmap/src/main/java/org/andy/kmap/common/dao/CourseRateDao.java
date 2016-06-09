package org.andy.kmap.common.dao;

import org.andy.kmap.common.model.entity.CourseRate;

import java.util.List;

/**
 * Created by lichao on 6/2/16.
 */
public interface CourseRateDao {

  boolean addComment(CourseRate courseRate);

  List<CourseRate> getCourseRates(int courseId);

  CourseRate getCourseRateByUserEmail(String userEmail,int courseId);

}
