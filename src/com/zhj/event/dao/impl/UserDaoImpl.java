package com.zhj.event.dao.impl;

import com.zhj.event.bean.User;
import com.zhj.event.dao.UserDao;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 17:54
 **/
public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsernameAndRole(String username,int role) {
        String sql="select `id`,`username`,`password`,`role` from user1 where username=? and role=?";
        return queryForOne(User.class,sql,username,role);
    }

    @Override
    public User queryUserByUsernameAndPasswordAndRole(String username, String password,int role) {
        String sql="select `id`,`username`,`password`,`role` from user1 where username=? and password =? and role=?";
        return queryForOne(User.class,sql,username,password,role);
    }

    @Override
    public int saveUser(User user) {
        String sql="insert into user1(`username`,`password`,`role`) values(?,?,?)";
        return update(sql,user.getUsername(),user.getPassword(),user.getRole());
    }
}
