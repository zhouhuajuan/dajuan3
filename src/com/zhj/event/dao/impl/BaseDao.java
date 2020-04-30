package com.zhj.event.dao.impl;

import com.zhj.event.util.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.*;
import java.util.List;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 16:10
 **/
public abstract class BaseDao {

    //使用DbUtils操作数据库
    private QueryRunner queryRunner = new QueryRunner();

    /**
     * update()方法用来执行：Insert/Update/Delete语句
     * @return 如果返回-1，说明执行失败<br/>返回其他表示影响的行数
     */
    public int update(String sql,Object ... args){
        Connection connection = JdbcUtil.getConnection();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(connection);
        }
        return -1;
    }

    /**
     * 查询返回一个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> T  queryForOne(Class<T> type,String sql,Object ... args){
        Connection con = JdbcUtil.getConnection();
        try {
            return queryRunner.query(con,sql,new BeanHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(con);
        }
        return null;
    }

    /**
     * 查询返回多个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T>List<T> queryForList(Class<T> type,String sql,Object ... args){
        Connection con = JdbcUtil.getConnection();
        try {
            return queryRunner.query(con,sql,new BeanListHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(con);
        }
        return null;
    }

    /**
     * 执行返回一行一列的sql语句
     * @param sql 执行的sql语句
     * @param args sql对应的参数值
     * @return
     */
    public Object queryForSingleValue(String sql,Object ... args){
        Connection conn = JdbcUtil.getConnection();
        try {
            return queryRunner.query(conn,sql,new ScalarHandler(),args);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return null;
    }
}
