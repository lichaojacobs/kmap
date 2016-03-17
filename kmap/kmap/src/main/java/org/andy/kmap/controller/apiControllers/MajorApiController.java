package org.andy.kmap.controller.apiControllers;

import org.andy.kmap.filter.AuthPassport;
import org.andy.kmap.model.entity.Major;
import org.andy.kmap.model.service.apiService.APIMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by li on 2015/10/13.
 */
@Controller
@RequestMapping("/API/Major/")
public class MajorApiController {

    @Autowired
    private APIMajorService apiMajorService;

    @AuthPassport
    @RequestMapping("Index")
    public String academyIndex(HttpServletRequest request){

//        LoginViewModel loginViewModel= (LoginViewModel)request.getSession().getAttribute("userRole");
//        if(loginViewModel!=null) {
//            if (loginViewModel.getUserRole().equals("管理员")) {
//                return "/admin/majoradd";
//            } else {
//                return "/index";
//            }
//        }else{
//            return "/index";
//        }
        return "admin/majoradd";
    }

    @RequestMapping("GetMajorsPerGrade")
    public @ResponseBody Object GetMajorsPerGrade(HttpServletRequest request){

        return apiMajorService.GetMajorsPerGrade();

    }

    @RequestMapping("addMajor")
    public @ResponseBody Object addMajor(HttpServletRequest request){

        int majoryear=Integer.valueOf(request.getParameter("majoryear"));
        String majorname=request.getParameter("majorname");
        String majorinfo=request.getParameter("majorinfo");
        int academyId=Integer.valueOf(request.getParameter("academyId"));
        Major major=new Major(0,majorname);
        major.setYear(majoryear);
        major.setAcademyId(academyId);
        major.setInfo(majorinfo);
        return apiMajorService.addMajor(major);

    }


    @RequestMapping("editMajor")
    public @ResponseBody Object editMajor(HttpServletRequest request){

        String majorname=request.getParameter("majorname");
        int majoryear=Integer.valueOf(request.getParameter("majoryear"));
        int oldyear=Integer.valueOf(request.getParameter("majoryear"));
        String oldname=request.getParameter("oldname");
        Major updateMajor=new Major(0,majorname);
        updateMajor.setYear(majoryear);
        Major pastMajor=new Major(0,oldname);
        pastMajor.setYear(oldyear);
        return apiMajorService.editMajor(updateMajor,pastMajor);

    }

    @RequestMapping("deleteMajor")
    public @ResponseBody Object deleteMajor(HttpServletRequest request){

        String majorname=request.getParameter("majorname");
        int majoryear=Integer.valueOf(request.getParameter("majoryear"));
        Major major=new Major(0,majorname);
        major.setYear(majoryear);
        return apiMajorService.deleteMajor(major);

    }




}
