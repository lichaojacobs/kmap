package org.andy.kmap.controller;

import java.io.IOException;

import javax.servlet.http.*;
import org.andy.kmap.model.entity.LoginViewModel;
import org.andy.kmap.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class LoginServlet  {

    @Autowired
    UserService userService;

    @RequestMapping("login")
    public String login(HttpServletRequest request){

        try {
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //首先获取当前session中的role值
            LoginViewModel userRole=((LoginViewModel)request.getSession().getAttribute(email));
            if(userRole!=null){

                if(userRole.getUserRole().equals("管理员"))
                {
                    return "/admin/index";
                }
                else{

                    return "course";

                }

            }else
            {

                if(userService.isValidLogin(email, password)){

                    String role=userService.getUserRole(email);
                    request.getSession().setAttribute("userRole", new LoginViewModel(email,role));
                    //判断当前用户权限
                    if(role.equals("管理员")){

                        return "/admin/index";

                    }else {

                        return "course";

                    }

                }else{
                    //错误页面
                    return "detail";

                }

            }


        }catch (Exception ex){

            //错误页面
            return "detail";

        }

    }

}
