package org.andy.kmap.controller.apiControllers;

import org.andy.kmap.model.service.apiService.APICoursePlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by li on 2015/10/30.
 */
@Controller
@RequestMapping("/API/CoursePlan/")
public class CoursePlanAddApiController {

    @Autowired
    private APICoursePlanService apiCoursePlanService;

    @RequestMapping("GetDropDownModel")
    public @ResponseBody Object getDropDownModel(){


        return apiCoursePlanService.getDropDownModels();


    }

    @RequestMapping("GetCoursesByAcademy")
    public @ResponseBody Object GetCoursesByAcademy(HttpServletRequest request){

        String academyName=request.getParameter("academyname");
        return apiCoursePlanService.GetCoursesByAcademy(academyName);

    }


}
