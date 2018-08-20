package com.zuiuxi.dao;

import java.util.List;

public interface HomeTypeDao {
	//查询所有的类别
	public List<String> queryAllTypes();
	//添加类别
	public boolean addHomeType(String type);
}
