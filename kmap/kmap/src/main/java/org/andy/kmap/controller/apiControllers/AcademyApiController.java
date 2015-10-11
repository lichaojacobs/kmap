package org.andy.kmap.controller.apiControllers;

import org.andy.kmap.model.entity.Academy;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.Grade;
import org.andy.kmap.model.service.apiService.APIAcademyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Mtime on 2015/9/17.
 */

@Controller
@RequestMapping("/API/Academy/")
public class AcademyApiController {

    @Autowired
    APIAcademyService academyService;

    @RequestMapping("getAllAcademies")
    public @ResponseBody Object getAllAcademies(){

        return academyService.getAllAcademies();

    }

    @RequestMapping("addAcademy")
    public @ResponseBody Object addAcademies(HttpServletRequest request){

        //获取参数
       String collegeid=request.getParameter("collegeid");
        String collegename=request.getParameter("collegename");
        if(collegeid==null||collegename==null)
        {
            CommonResult commonResult=new CommonResult();
            commonResult.setDetail("网络异常，稍后再试！");
            commonResult.setStatus(-1);

            return  commonResult;

        }else
        {
            Academy academy=new Academy();
            academy.setCollegeid(Integer.valueOf(collegeid));
            academy.setCollegename(collegename);
            return academyService.addAcademies(academy);

        }

    }

    @RequestMapping("deleteAcademy")
    public @ResponseBody Object deleteAcademy(HttpServletRequest request){

        String collegeid=request.getParameter("collegeid");
        if(collegeid==null)
        {

            CommonResult commonResult=new CommonResult();
            commonResult.setDetail("网络异常，稍后再试！");
            commonResult.setStatus(-1);

            return  commonResult;
        }else
        {

            return academyService.deleteAcademies(Integer.valueOf(collegeid));

        }

    }

    @RequestMapping("editAcademy")
    public @ResponseBody Object editAcademy(HttpServletRequest request){
        //获取参数
        String collegeid=request.getParameter("collegeid");
        String collegename=request.getParameter("collegename");
        if(collegeid==null||collegename==null)
        {
            CommonResult commonResult=new CommonResult();
            commonResult.setDetail("网络异常，稍后再试！");
            commonResult.setStatus(-1);

            return  commonResult;

        }else {
            Academy academy=new Academy();
            academy.setCollegeid(Integer.valueOf(collegeid));
            academy.setCollegename(collegename);
            return academyService.editAcademy(academy);

        }




    }


    /**
     * 单个添加年级
     * @param request
     * @return
     */
    @RequestMapping("addGrade")
    public @ResponseBody Object addGrade(HttpServletRequest request){


        String collegeid=request.getParameter("collegeid");
        String gradeyear=request.getParameter("gradeyear");
        if(collegeid==null||gradeyear==null) {
            CommonResult commonResult = new CommonResult();
            commonResult.setDetail("网络异常，稍后再试！");
            commonResult.setStatus(-1);

            return commonResult;
        }else
        {

            Grade grade=new Grade();
            grade.setAcademyid(Integer.valueOf(collegeid));
            grade.setYear(gradeyear);
            return academyService.gradeAdd(grade);

        }



    }

}
