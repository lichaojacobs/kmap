package org.andy.kmap.controller;

import java.io.IOException;

import javax.servlet.http.*;

import org.andy.kmap.model.entity.CommonResult;
import org.andy.kmap.model.entity.LoginResult;
import org.andy.kmap.model.entity.LoginViewModel;
import org.andy.kmap.model.entity.User;
import org.andy.kmap.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class LoginServlet  {

    private static org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(CourseServlet.class);
    @Autowired
    UserService userService;

    @RequestMapping("login")
    public @ResponseBody LoginResult login(HttpServletRequest request,HttpServletResponse response){
        logger.info("System Restart");
        response.setContentType("");
        LoginResult loginResult=new LoginResult();
        try {
            request.setCharacterEncoding("UTF-8");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //首先获取当前session中的role值
            LoginViewModel userRole=((LoginViewModel)request.getSession().getAttribute(email));
            if(userRole!=null){
                loginResult.setDetail("登录成功");
                loginResult.setStatus(1);
                if(userRole.getUserRole().equals("管理员"))
                {

                    loginResult.setIsAdmin(1);
                    loginResult.setRedirectUrl("/kmap/API/Academy/Index.do");
                    return loginResult;
                }
                else{
                    loginResult.setIsAdmin(0);
                    loginResult.setRedirectUrl("/kmap/Course/Index.do");
                    return loginResult;
                }

            }else
            {

                if(userService.isValidLogin(email, password)){

                    User user=userService.getUser(email);
                    String role=userService.getUserRole(email);
                    if(role!=null) {
                        loginResult.setDetail("登录成功");
                        loginResult.setStatus(1);
                        request.getSession().setAttribute("userRole", new LoginViewModel(email, role,user.getName()));
                        //判断当前用户权限
                        if (role.equals("管理员")) {
                            loginResult.setIsAdmin(1);
                            loginResult.setRedirectUrl("/kmap/API/Academy/Index.do");
                            return loginResult;

                        } else {
                            loginResult.setIsAdmin(0);
                            loginResult.setRedirectUrl("/kmap/Course/Index.do");
                            return loginResult;
                        }
                    }
                    else
                    {
                        loginResult.setRedirectUrl("/error");
                        loginResult.setIsAdmin(0);
                        loginResult.setStatus(0);
                        loginResult.setDetail("该用户未分配权限");
                        return loginResult;
                    }

                }else{
                    //错误页面
                    loginResult.setRedirectUrl("/error");
                    loginResult.setStatus(0);
                    loginResult.setIsAdmin(0);
                    loginResult.setDetail("用户名或密码错误");
                    return loginResult;
                }

            }
        }catch (Exception ex){

            loginResult.setRedirectUrl("/error");
            loginResult.setStatus(0);
            loginResult.setIsAdmin(0);
            loginResult.setDetail(ex.getMessage());
            logger.error(ex);
            return loginResult;
        }

    }
    @RequestMapping("register")
    public @ResponseBody Object register(HttpServletRequest request){
        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String pwd=request.getParameter("password");
        User user=new User(username,email,pwd);
        return userService.addUser(user);
    }
    @RequestMapping("quit")
    public String quit(HttpServletRequest request){
        request.getSession().removeAttribute("userRole");
        return "/index";
    }
}
