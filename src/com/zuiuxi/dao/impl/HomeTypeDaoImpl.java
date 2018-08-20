package com.zuiuxi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zuiuxi.dao.HomeTypeDao;
import com.zuiuxi.util.DBUtil;

public class HomeTypeDaoImpl implements HomeTypeDao {
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	//查询所有类别
	@Override
	public List<String> queryAllTypes() {
		List<String> list = new ArrayList<String>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select name from hometype");
			rs = pstm.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public boolean addHomeType(String type) {
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("insert into hometype(name) values(?)");
			pstm.setString(1, type);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}
			return false;
		} catch (SQLException e) {
			DBUtil.release(conn, pstm);
			e.printStackTrace();
		}
		return false;
	}

}
