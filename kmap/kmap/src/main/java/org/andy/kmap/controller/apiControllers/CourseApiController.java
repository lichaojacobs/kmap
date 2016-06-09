package org.andy.kmap.controller.apiControllers;

import org.andy.kmap.common.model.entity.Course;
import org.andy.kmap.common.model.entity.LoginViewModel;
import org.andy.kmap.common.service.apiService.APICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by li on 2015/10/20.
 */

@Controller
@RequestMapping("/API/Course/")
public class CourseApiController {

    @Autowired
    private APICourseService apiCourseService;

    /**
     * 返回课程添加页面
     * @return
     */
    @RequestMapping("Index")
    public String academyIndex(HttpServletRequest request){

        return loginFilter(request,"/admin/courseadd");

    }

    /**
     * 课程计划查看
     * @return
     */
    @RequestMapping("CoursePlanSearch")
    public String courseSearchPage(HttpServletRequest request){

        return loginFilter(request,"/admin/courseplansearch");

    }

    /**
     * 课程计划添加
     * @return
     */
    @RequestMapping("CoursePlanAdd")
    public String coursePlanAdd(HttpServletRequest request){

        return loginFilter(request,"/admin/courseplanadd") ;
    }

    @RequestMapping("CourseKnowledgeAdd")
    public String CourseknowledgeAdd(HttpServletRequest request){

        return loginFilter(request,"/admin/pointadd");
    }


    @RequestMapping("getAllCourses")
    public @ResponseBody Object getAllCourses(){

        return apiCourseService.getAllCourses();

    }

    @RequestMapping("addCourse")
    public @ResponseBody  Object addCourse(HttpServletRequest request){
        //获取传来的参数
        int courseid=Integer.valueOf(request.getParameter("courseid"));
        String coursename=request.getParameter("coursename");
        double coursecredit=Double.valueOf( request.getParameter("coursecredit"));
        int courseacademyid=Integer.valueOf(request.getParameter("academyId"));
        int category=Integer.valueOf(request.getParameter("category").trim());
        int property=Integer.valueOf(request.getParameter("property").trim());
        Course course=new Course(courseid,coursename);
        course.setCredit(coursecredit);
        course.setAcademyId(courseacademyid);
        course.setCategoryId(category);
        course.setPropertyId(property);
        //调用方法
        return apiCourseService.addCourse(course);

    }

    @RequestMapping("deleteCourse")
    public @ResponseBody Object deleteCourse(HttpServletRequest request){

        int courseId=Integer.valueOf(request.getParameter("courseid"));
        String name=request.getParameter(request.getParameter("coursename"));

        Course course=new Course(courseId,name);

        return apiCourseService.deleteCourse(course);

    }

    @RequestMapping("editCourse")
    public  @ResponseBody Object editCourse(HttpServletRequest request){

        int courseid=Integer.valueOf(request.getParameter("courseid"));
        String coursename=request.getParameter("coursename");
        double coursecredit=Double.valueOf( request.getParameter("coursecredit"));
        Course course=new Course(courseid,coursename);
        course.setCredit(coursecredit);
        return apiCourseService.editCourse(course);

    }

    /**
     * 登录拦截方法
     * @param request
     * @param returnPath
     * @return
     */
    public String loginFilter(HttpServletRequest request,String returnPath){
        LoginViewModel loginViewModel= (LoginViewModel)request.getSession().getAttribute("userRole");
        if(loginViewModel!=null) {
            if (loginViewModel.getUserRole().equals("管理员")) {
                return returnPath;
            } else {
                return "/index";
            }
        }else{
            return "/index";
        }
    }

}
