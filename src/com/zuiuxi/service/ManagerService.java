package com.zuiuxi.service;

import com.zuiuxi.dao.ManagerDao;
import com.zuiuxi.dao.impl.ManagerDaoImpl;

public class ManagerService {

	private ManagerDao  dao = new ManagerDaoImpl();
	//��ѯ�û����ڲ�
	public boolean juageManager(String name,String password) {
		return dao.juageManager(name, password);
	}
	//��ѯ�û�Ȩ��
	public int queryUserQuan(String name) {
		return dao.queryUserQuan(name);
	}
}
