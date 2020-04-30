package com.zhj.event.web;

import com.zhj.event.bean.User;
import com.zhj.event.service.UserService;
import com.zhj.event.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-30 00:04
 **/
public class RegisterServlet extends HttpServlet {

    UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        int role = Integer.parseInt(req.getParameter("role"));
        String code = req.getParameter("code");

        if ("abcd".equalsIgnoreCase(code)){
            if (userService.existUsername(username,role)){
                System.out.println("用户名["+ username +"]已存在！");
                req.getRequestDispatcher("/page/user/register.html").forward(req,resp);
            }else {
                userService.registerUser(new User(null,username,password,role));
            }
        }else{
            System.out.println("验证码[" + code + "]错误");
            req.getRequestDispatcher("/page/user/register.html").forward(req,resp);
        }
    }
}
