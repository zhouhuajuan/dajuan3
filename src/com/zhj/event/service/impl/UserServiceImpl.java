package com.zhj.event.service.impl;

import com.zhj.event.bean.User;
import com.zhj.event.dao.UserDao;
import com.zhj.event.dao.impl.UserDaoImpl;
import com.zhj.event.service.UserService;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 23:39
 **/
public class UserServiceImpl implements UserService {

    UserDao userDao = new UserDaoImpl();

    @Override
    public void registerUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUserByUsernameAndPasswordAndRole(user.getUsername(),user.getPassword(),user.getRole());
    }

    @Override
    public boolean existUsername(String username,int role) {

        if(userDao.queryUserByUsernameAndRole(username,role) == null){
            //等于null,说明没查到，没查到表示可用
            return false;
        }
        return true;
    }
}
