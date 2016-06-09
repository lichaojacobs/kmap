package org.andy.kmap.controller.apiControllers;

import org.andy.kmap.common.model.entity.CommonResult;
import org.andy.kmap.common.service.apiService.APIPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lichao on 15/12/15.
 */
@Controller
@RequestMapping("/API/Point/")
public class PointApiController {


    @Autowired
    @Qualifier("APIPointService")
    private APIPointService apiPointService;

    @RequestMapping("GetPointSelections")
    public @ResponseBody Object getDropDownModel(HttpServletRequest request){
        String course= request.getParameter("course");
        String academy=request.getParameter("academy");
        return apiPointService.getPointSelections(course,academy);
    }

    @RequestMapping("AddPoint")
    public @ResponseBody Object addPoint(HttpServletRequest request){

        try {
            String course=request.getParameter("course");
            String pointname=request.getParameter("pointname");
            String pointdescription=request.getParameter("pointdescription");
            String pointforward=request.getParameter("pointforward");
            String academy=request.getParameter("academy");
            String pointbehind=request.getParameter("pointbehind");
            return apiPointService.addPoint(course,pointname,pointdescription,pointforward,pointbehind,academy);

        }catch (Exception ex)
        {
            CommonResult commonResult=new CommonResult();
            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;
        }
    }

    @RequestMapping("GetPointSelectionsByLevel")
    public @ResponseBody Object getDropDownModelByLevel(HttpServletRequest request)
    {
        try {
            String course=request.getParameter("course");
            String academy=request.getParameter("academy");
            int level=Integer.valueOf(request.getParameter("level"));
            return apiPointService.getPointSelectionsByLevel(course,academy,level);

        }catch (Exception ex)
        {
            CommonResult commonResult=new CommonResult();
            commonResult.setDetail(ex.getMessage());
            commonResult.setStatus(-1);
            return commonResult;
        }
    }

    @RequestMapping("GetPointDropDown")
    public @ResponseBody Object getPointDropDown(HttpServletRequest request){
        String course= request.getParameter("course");
        String academy=request.getParameter("academy");
        return apiPointService.getPointDropDown(course,academy);
    }

}
