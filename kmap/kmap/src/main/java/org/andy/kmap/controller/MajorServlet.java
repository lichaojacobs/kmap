package org.andy.kmap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.andy.kmap.model.entity.Major;
import org.andy.kmap.model.service.MajorService;

public class MajorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MajorService majorService = (MajorService) getServletContext().getAttribute("majorService");

        request.setCharacterEncoding("UTF-8");

        int year = Integer.parseInt(request.getParameter("year"));
        String name = request.getParameter("name");

        majorService.addMajor(new Major(year, name));
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
