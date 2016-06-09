package org.andy.kmap.common.service;

import org.andy.kmap.common.dao.CourseRateDao;
import org.andy.kmap.common.dao.CourseWikiDao;
import org.andy.kmap.common.model.entity.CourseRate;
import org.andy.kmap.common.model.entity.CourseWiki;
import org.andy.kmap.common.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by lichao on 6/2/16.
 */
@Service
public class CourseRateService {

  @Autowired
  CourseWikiDao courseWikiDao;
  @Autowired
  CourseRateDao courseRateDao;
  @Autowired
  UserService userService;

  @Transactional(propagation = Propagation.REQUIRED)
  public boolean addComment(CourseRate courseRate) {
    CourseWiki courseWiki = courseWikiDao.getCourseWikiByCourseId(courseRate.getCourseId());
    int userCount = courseWiki.getUserCount() + 1;
    double diffcultyRate = (courseWiki.getDiffcultRate() * courseWiki.getUserCount() + courseRate
        .getDiffcultRate()) / userCount;
    double importantRate = (courseWiki.getImportantRate() * courseWiki.getUserCount() + courseRate
        .getImportantRate()) / userCount;
    double usefulRate = (courseWiki.getUsefulRate() * courseWiki.getUserCount() + courseRate
        .getUsefulRate()) / userCount;
    courseWiki.setDiffcultRate(diffcultyRate);
    courseWiki.setImportantRate(importantRate);
    courseWiki.setUsefulRate(usefulRate);
    courseWiki.setUserCount(userCount);

    courseRateDao.addComment(courseRate);
    courseWikiDao.updateCourseWikiByCourseId(courseWiki);

    return true;
  }

  public List<CourseRate> getCourseRateList(int courseId) {
    List<CourseRate> courseRateList = courseRateDao.getCourseRates(courseId);
    for (CourseRate courseRate : courseRateList) {
      User user = userService.getUser(courseRate.getUser().getEmail());
      courseRate.setUser(user);
    }

    return courseRateList;
  }

  public CourseRate getCourseRateByUserEmail(String userEmail, int courseId) {
    return courseRateDao.getCourseRateByUserEmail(userEmail, courseId);
  }
}
