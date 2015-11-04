package org.andy.kmap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.model.entity.*;

import org.andy.kmap.model.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class CourseServlet extends HttpServlet {

    @Autowired
    private CourseService courseService;


    @RequestMapping("course")
   public void getCourse(HttpServletResponse response){

        Major major = new Major(2011, "电子商务");
        major.setId(2);

        //写死
        User user = new User("aishuo2357@126.com", "asvc9851");
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
