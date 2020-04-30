package com.zhj.event.test;

import com.zhj.event.bean.User;
import com.zhj.event.service.UserService;
import com.zhj.event.service.impl.UserServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceTest {

    UserService userService = new UserServiceImpl();

    @Test
    public void registerUser() {
        userService.registerUser(new User(null,"1234567","12",1));
    }

    @Test
    public void login() {
        System.out.println(userService.login(new User(null,"1234","12",0)));
    }

    @Test
    public void existUsername() {
        if(userService.existUsername("1234",0)){
            System.out.println("用户名已存在！");
        }else {
            System.out.println("用户名可用！");
        }
    }
}