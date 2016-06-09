package org.andy.kmap.controller;

import org.andy.kmap.common.model.entity.CourseRate;
import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.model.entity.CourseWiki;
import org.andy.kmap.common.model.entity.LoginViewModel;
import org.andy.kmap.common.model.entity.User;
import org.andy.kmap.common.service.CourseRateService;
import org.andy.kmap.common.service.CourseWikiService;
import org.andy.kmap.filter.AuthPassport;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


/**
 * Created by lichao on 6/2/16.
 */
@Controller
@RequestMapping("/wiki")
public class CourseWikiController {

  private static Logger logger = Logger.getLogger(CourseWikiController.class);
  @Autowired
  CourseWikiService courseWikiService;
  @Autowired
  CourseRateService courseRateService;

  @AuthPassport
  @RequestMapping("/index")
  public String courseWikiIndex(HttpServletRequest request,ModelMap map,
      @RequestParam("courseId")
          int courseId) {
    String userEmail= ((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail();
    CourseWiki courseWiki = courseWikiService.getCourseWiki(courseId,userEmail);
    map.addAttribute("courseWiki", courseWiki);
    return "/coursewiki";
  }

  @AuthPassport
  @RequestMapping("/addComment")
  @ResponseBody
  public CommonResult addComment(
      @RequestParam("diffcultyRate")
          double diffcultyRate,
      @RequestParam("importantRate")
          double importantRate,
      @RequestParam("usefulRate")
          double usefulRate,
      @RequestParam("courseId")
          int courseId,
      @RequestParam("comment")
          String comment,
      @RequestParam("userEmail")
          String userEmail) {

    CommonResult commonResult=new CommonResult();
    try {
      CourseRate courseRate = new CourseRate();
      courseRate.setUsefulRate(usefulRate);
      courseRate.setImportantRate(importantRate);
      courseRate.setDiffcultRate(diffcultyRate);
      courseRate.setCourseId(courseId);
      courseRate.setComment(comment);
      User user = new User(userEmail,"");
      courseRate.setUser(user);
      courseRateService.addComment(courseRate);
      commonResult.setStatus(0);
      commonResult.setDetail("评价成功");
    }catch (Exception ex){
      logger.error("addComment error,error is"+ex.getMessage());
      commonResult.setStatus(-1);
      commonResult.setDetail("评价失败");
    }

    return commonResult;
  }

  @AuthPassport
  @RequestMapping("/getComments")
  @ResponseBody
  public List<CourseRate> getCourseRateList(@RequestParam("courseId")
      int courseId){
    List<CourseRate> courseRateList=null;
    try {
     courseRateList= courseRateService.getCourseRateList(courseId);

    }catch (Exception ex){
      logger.error("getCourseRateList error,error is"+ex.getMessage());

    }
    return courseRateList;
  }


}
