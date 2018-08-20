package com.zuiuxi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zuiuxi.dao.ManagerDao;
import com.zuiuxi.util.DBUtil;
//管理员道层实现
public class ManagerDaoImpl implements ManagerDao {
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	@Override
	public boolean juageManager(String name,String password) {
		conn = DBUtil.getConnection();
		String sql = "select * from manager where name = ? and password = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, password);
			rs = pstm.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public int queryUserQuan(String name) {
		conn = DBUtil.getConnection();
		String sql = "select quan from managerquan where name = ?";
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,name);
			rs = pstm.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return 0;
	}

}
