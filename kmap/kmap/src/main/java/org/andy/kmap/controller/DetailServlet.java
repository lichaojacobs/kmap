package org.andy.kmap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.model.entity.*;

import org.andy.kmap.model.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class DetailServlet  {

    @Autowired
    private DetailService detailService;


    @RequestMapping("detail")
    public void getDetail(HttpServletResponse response){

        Course course = new Course(13, "应用统计学");
        response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        try {

            response.getWriter().write(detailService.getDetailMap(course));

        }catch (Exception ex){

            ex.printStackTrace();
        }


    }



}
