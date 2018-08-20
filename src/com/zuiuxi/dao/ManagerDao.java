package com.zuiuxi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//管理员道层
public interface ManagerDao {

	//判断用户是否存在通过账号密码
	public boolean juageManager(String name,String password);
	//查询用户的权限
	public int queryUserQuan(String name);
}
