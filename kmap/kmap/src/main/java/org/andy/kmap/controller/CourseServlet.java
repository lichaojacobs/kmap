package org.andy.kmap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.model.entity.*;

import org.andy.kmap.model.service.CourseService;

public class CourseServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        CourseService courseService = (CourseService) getServletContext().getAttribute("courseService");

        Major major = new Major(2011, "电子商务");
        major.setId(2);

        User user = new User("aishuo2357@126.com", "asvc9851");
        user.setId(1);
        user.setMajor(major);

        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        response.getWriter().write(courseService.getCourseMap(user));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        processRequest(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        processRequest(request, response);

    }


}
