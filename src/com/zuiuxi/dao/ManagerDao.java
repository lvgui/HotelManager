package com.zuiuxi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//����Ա����
public interface ManagerDao {

	//�ж��û��Ƿ����ͨ���˺�����
	public boolean juageManager(String name,String password);
	//��ѯ�û���Ȩ��
	public int queryUserQuan(String name);
}
