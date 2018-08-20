package com.zuiuxi.service;

import java.util.List;

import com.zuiuxi.dao.HomeTypeDao;
import com.zuiuxi.dao.impl.HomeTypeDaoImpl;
import com.zuiuxi.entity.Home;

public class HomeTypeService {
	
	HomeTypeDao dao = new HomeTypeDaoImpl();
	//查询房间类别表
	public List<String> selectAllHome() {
		return dao.queryAllTypes();
	}
	public boolean addHomeType(String type) {
		return dao.addHomeType(type);
	}
}
