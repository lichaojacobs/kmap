package org.andy.kmap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.model.entity.*;

import org.andy.kmap.model.service.CourseService;
import org.andy.kmap.model.service.MajorService;
import org.andy.kmap.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class CourseServlet extends HttpServlet {

    @Autowired
    private CourseService courseService;

    @Autowired
    private MajorService majorService;
    @Autowired
    private UserService userService;

    @RequestMapping("Course/Index")
    public String CoursePage(HttpServletRequest request){
        LoginViewModel login= (LoginViewModel)request.getSession().getAttribute("userRole");
        if(login!=null) {
            if (login.getUserRole().equals("普通用户")) {
                //判断用户是否基本信息完备
                if(userService.getUser(login.getUserEmail()).getMajorId()==0)
                {
                    return "/info";
                }
                else
                    return "/course";
            }
            else
            {
                return "/course";
            }
        }else
        {
            return "/index";
        }
    }
    @RequestMapping("course")
    public void getCourse(HttpServletResponse response,HttpServletRequest request){
        LoginViewModel login= (LoginViewModel)request.getSession().getAttribute("userRole");
        Major major = majorService.getMajorByUserId(login.getUserEmail());
        User user = new User(login.getUserEmail(),"");
        user.setId(1);
        user.setMajor(major);
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        try {
            PrintWriter printWriter=response.getWriter();
            printWriter.print(courseService.getCourseMap(user));
        }catch (Exception ex)
        {

            ex.printStackTrace();
        }

    }


}
