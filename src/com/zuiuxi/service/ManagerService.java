package com.zuiuxi.service;

import com.zuiuxi.dao.ManagerDao;
import com.zuiuxi.dao.impl.ManagerDaoImpl;

public class ManagerService {

	private ManagerDao  dao = new ManagerDaoImpl();
	//查询用户存在不
	public boolean juageManager(String name,String password) {
		return dao.juageManager(name, password);
	}
	//查询用户权限
	public int queryUserQuan(String name) {
		return dao.queryUserQuan(name);
	}
}
