package org.andy.kmap.controller;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.andy.kmap.filter.AuthPassport;
import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.LoginViewModel;
import org.andy.kmap.model.entity.User;
import org.andy.kmap.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by lichao on 16/4/15.
 */
@Controller
@RequestMapping("/")
public class UserInfoController {
    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(UserInfoController.class);

    @Autowired
    UserService userService;

    @AuthPassport
    @RequestMapping("addUserInfo")
    public @ResponseBody Object addUserInfo(HttpServletRequest request){
        //"username":username,"eid":eid,"epassword":epassword,"majorid":majorId}
        String userName=request.getParameter("username");
        String eid=request.getParameter("eid");
        String epassword=request.getParameter("epassword");
        Integer majorId=Integer.valueOf(request.getParameter("majorid"));
        User user=new User(((LoginViewModel)request.getSession().getAttribute("userRole")).getUserEmail(),"");
        user.setMajorId(majorId);
        user.setEid(eid);
        user.setEpassword(epassword);

        logger.info("addUserInfo: user is:"+ new Gson().toJson(user));

        CommonResult commonResult= userService.addUserInfo(user);
        if(commonResult.getStatus()!=-1){
            commonResult.setRedirectUrl("/kmap/Course/Index.do");
        }
        else {
            commonResult.setRedirectUrl("/info");
        }
        return commonResult;

    }
}
