package org.andy.kmap.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.common.model.entity.*;

import org.andy.kmap.common.service.CourseService;
import org.andy.kmap.common.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class DetailServlet  {

    @Autowired
    private DetailService detailService;

    @Autowired
    private CourseService courseService;

    @RequestMapping("detail/index")
    public String detailIndex(HttpServletRequest request,HttpServletResponse response){
        try {
            LoginViewModel login= (LoginViewModel)request.getSession().getAttribute("userRole");
            if(login!=null) {
                if (login.getUserRole().equals("普通用户")) {
                    request.setCharacterEncoding("UTF-8");
                    //获取前端传来的课程参数
                    String courseId=request.getParameter("courseId");
                    String courseName=request.getParameter("courseName");
                    if(courseId!=null&&courseId!="") {
                        request.getSession().setAttribute("courseId",courseId);
                        request.getSession().setAttribute("courseName",courseName);
                        return "/detail";
                    }
                    return "/detail";
                }
                else
                {
                    return "/course";
                }
            }else
            {
                return "/index";
            }

        }catch (Exception ex)
        {
            return "/error";
        }
    }
    @RequestMapping("detail")
    public void getDetail(HttpServletResponse response,HttpServletRequest request){
        try {
            request.setCharacterEncoding("UTF-8");
            String courseId=request.getSession().getAttribute("courseId").toString();
            Course course = courseService.getCourseById(Integer.valueOf(courseId));
            response.setContentType("application/json;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(detailService.getDetailMap(course));
        }catch (Exception ex)
        {
            ex.printStackTrace();
        }

    }
    @RequestMapping("detailData")
    public void  getDetailData(HttpServletResponse response,HttpServletRequest request)
    {
        try {
            request.setCharacterEncoding("UTF-8");
            String courseName=request.getParameter("course");
            String academy=request.getParameter("academy");
            Course course = courseService.getCourse(courseName,academy);
            response.setContentType("application/json;charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            response.getWriter().write(detailService.getDetailMap(course));
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }


}
