package com.zuiuxi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zuiuxi.dao.CustomerDao;
import com.zuiuxi.entity.Customer;
import com.zuiuxi.util.DBUtil;

public class CustomerDaoImpl implements CustomerDao {
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	@Override
	public List<Customer> queryAllCustomer() {
		List<Customer> list = new ArrayList<Customer>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from customer");
			rs = pstm.executeQuery();
			while(rs.next()){
				Customer c = new Customer();
				c.setName(rs.getString("name"));
				c.setCredentialstype(rs.getString("credentialstype"));
				c.setCredentialsnum(rs.getString("Credentialsnum"));
				list.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
