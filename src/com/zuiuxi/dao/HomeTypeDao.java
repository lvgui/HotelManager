package com.zuiuxi.dao;

import java.util.List;

public interface HomeTypeDao {
	//��ѯ���е����
	public List<String> queryAllTypes();
	//������
	public boolean addHomeType(String type);
}
