package com.zuiuxi.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zuiuxi.dao.HomeDao;
import com.zuiuxi.entity.Home;
import com.zuiuxi.util.DBUtil;

public class HomeDaoImpl implements HomeDao {
	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	@Override
	public List<Home> selectAllHome() {
		List<Home> list = new ArrayList<Home>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from home");
			rs = pstm.executeQuery();
			while(rs.next()){
				Home h = new Home();
				h.setDiscount(rs.getDouble("discount"));
				h.setImages(rs.getString("images"));
				h.setNum(rs.getString("num"));
				h.setPrices(rs.getDouble("prices"));
				h.setStatus(rs.getInt("status"));
				h.setType(rs.getString("type"));
				list.add(h);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return list;
	}
	@Override
	public boolean changeHomeStatus(String discount,String num) {
		// TODO Auto-generated method stub
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("update home set discount = ?  where num = ?");
			pstm.setString(1,discount);
			pstm.setString(2, num);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public boolean changeHomePrice(String num, double prices) {
		// TODO Auto-generated method stub
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("update home set prices = ?  where num = ?");
			pstm.setDouble(1,prices);
			pstm.setString(2, num);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public List<Home> selectHomeByStatus(int status) {
		List<Home> list = new ArrayList<Home>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from home where status = ?");
			pstm.setInt(1, status);
			rs = pstm.executeQuery();
			while(rs.next()){
				Home h = new Home();
				h.setDiscount(rs.getDouble("discount"));
				h.setImages(rs.getString("images"));
				h.setNum(rs.getString("num"));
				h.setPrices(rs.getDouble("prices"));
				h.setStatus(rs.getInt("status"));
				h.setType(rs.getString("type"));
				list.add(h);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return list;
	}
	@Override
	public List<Home> selectHomeByTypes(String type) {
		// TODO Auto-generated method stub
		List<Home> list = new ArrayList<Home>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from home where type = ?");
			pstm.setString(1, type);
			rs = pstm.executeQuery();
			while(rs.next()){
				Home h = new Home();
				h.setDiscount(rs.getDouble("discount"));
				h.setImages(rs.getString("images"));
				h.setNum(rs.getString("num"));
				h.setPrices(rs.getDouble("prices"));
				h.setStatus(rs.getInt("status"));
				h.setType(rs.getString("type"));
				list.add(h);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return list;
	}
	@Override
	public List<Home> selectHomeByTypesAndStatus(String type, int status) {
		// TODO Auto-generated method stub
		List<Home> list = new ArrayList<Home>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from home where status = ? and type = ?");
			pstm.setInt(1, status);
			pstm.setString(2, type);
			rs = pstm.executeQuery();
			while(rs.next()){
				Home h = new Home();
				h.setDiscount(rs.getDouble("discount"));
				h.setImages(rs.getString("images"));
				h.setNum(rs.getString("num"));
				h.setPrices(rs.getDouble("prices"));
				h.setStatus(rs.getInt("status"));
				h.setType(rs.getString("type"));
				list.add(h);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return list;
	}
	@Override
	public List<String> selectHomeNum() {
		List<String> list = new ArrayList<String>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select num from home");
			rs = pstm.executeQuery();
			while(rs.next()){
				String num = rs.getString(1); 
				list.add(num);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return list;
	}
	@Override
	public boolean changeHomeNum(String num,String newNum) {
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("update home set num = ?  where num = ?");
			pstm.setString(1, newNum);
			pstm.setString(2, num);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public boolean deleteHomeByNum(String num) {
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("delete from home where num = ?");
			pstm.setString(1, num);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public boolean changeHomeType(String num, String type) {
		// TODO Auto-generated method stub
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("update home set type = ? where num = ?");
			pstm.setString(1, type);
			pstm.setString(2, num);
			int a = pstm.executeUpdate();
			if(a > 0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return false;
	}
	@Override
	public int changeHomeImage(String num, String images) {
		// TODO Auto-generated method stub
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("update home set images = ? where num = ?");
			pstm.setString(1, images);
			pstm.setString(2, num);
			return  pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return 0;
	}
	@Override
	public List<String> queryAllHomeNum() {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select num from home");
			rs = pstm.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			return list;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return null;
	}
	@Override
	public List<String> queryAllCanIn() {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select num from home where status = 0");
			rs = pstm.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			return list;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return null;
	}
	@Override
	public Home selectHomeByNum(String num) {
		// TODO Auto-generated method stub
		Home h = new Home();
		conn = DBUtil.getConnection();
		try {
			pstm = conn.prepareStatement("select * from home where num = ?");
			pstm.setString(1, num);
			rs = pstm.executeQuery();
			//System.out.println("Êý¾Ý¿âµ¾³Ç" + num);
			while(rs.next()){
				h.setDiscount(rs.getDouble("discount"));
				h.setImages(rs.getString("images"));
				h.setNum(rs.getString("num"));
				h.setPrices(rs.getDouble("prices"));
				h.setStatus(rs.getInt("status"));
				h.setType(rs.getString("type"));
			}
			return h;
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.release(rs, conn, pstm);
		}
		return null;
	}

}
