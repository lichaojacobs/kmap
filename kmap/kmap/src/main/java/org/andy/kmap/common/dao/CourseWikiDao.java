package org.andy.kmap.common.dao;

import org.andy.kmap.common.model.entity.CourseWiki;

/**
 * Created by lichao on 6/2/16.
 */
public interface CourseWikiDao {

  /**
   * 根据课程ID获取coursewiki
   */
  CourseWiki getCourseWikiByCourseId(int courseId);

  boolean editCourseInfo(int courseId, String info);

  boolean updateCourseWikiByCourseId(CourseWiki courseWiki);

}
