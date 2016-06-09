package org.andy.kmap.filter;

import org.andy.kmap.common.model.entity.LoginViewModel;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

/**
 * Created by lichao on 15/12/14. 基于控制器注解的权限验证操作
 */
public class LoginInterceptors implements HandlerInterceptor {

  @Override
  public boolean preHandle(HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse, Object o) throws Exception {

    if (o.getClass().isAssignableFrom(HandlerMethod.class)) {
      AuthPassport authPassport = ((HandlerMethod) o).getMethodAnnotation(AuthPassport.class);
      //不需要权限验证
      if (authPassport == null || authPassport.validate() == false) {
        return true;
      } else {
        LoginViewModel login = (LoginViewModel) httpServletRequest.getSession().getAttribute("userRole");
        if (login == null) {
          httpServletResponse.sendRedirect("/kmap");
          return false;
        } else {
          return true;
        }
      }
    } else {
      return true;
    }

  }

  @Override
  public void postHandle(HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView)
      throws Exception {

  }

  @Override
  public void afterCompletion(HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    if (e != null) {
      BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(
          new FileOutputStream("~/日志.txt"));
      bufferedOutputStream.write(e.getMessage().getBytes());
      bufferedOutputStream.flush();
      bufferedOutputStream.close();
    }
  }
}
