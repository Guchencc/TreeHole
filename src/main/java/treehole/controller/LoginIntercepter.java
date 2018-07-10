package treehole.controller;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import treehole.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginIntercepter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       /* String requestUri=request.getRequestURI();
        System.out.println(requestUri);
        if(!requestUri.contains("/login")){
            HttpSession session=request.getSession();
            User user=(User)session.getAttribute("user");
            if (user!=null) {
                return true;
            }else{
                request.getRequestDispatcher("/login").forward(request,response);
                return false;
            }
        }else {
            return true;
        }*/
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        if (user!=null) {
            return true;
        }else{
            request.getRequestDispatcher("/login").forward(request,response);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
