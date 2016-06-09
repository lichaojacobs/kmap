package org.andy.kmap.common.service;

import org.andy.kmap.common.dao.CourseWikiDao;
import org.andy.kmap.common.model.entity.CourseRate;
import org.andy.kmap.common.model.entity.CourseWiki;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by lichao on 6/2/16.
 */
@Service
public class CourseWikiService {

  @Autowired
  private CourseService courseService;
  @Autowired
  private UserService userService;
  @Autowired
  private CourseWikiDao courseWikiDao;
  @Autowired
  private CourseRateService courseRateService;

  public CourseWiki getCourseWiki(int courseId, String userEmail) {
    CourseWiki courseWiki = courseWikiDao.getCourseWikiByCourseId(courseId);
    CourseRate courseRate = courseRateService.getCourseRateByUserEmail(userEmail,courseId);
    if (courseRate == null) {
      courseWiki.setCurrentUserCommented(false);
    } else {
      courseWiki.setCurrentUserCommented(true);
    }

    return courseWiki;
  }

}
