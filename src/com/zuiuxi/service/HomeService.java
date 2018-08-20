package com.zuiuxi.service;

import java.util.List;

import com.zuiuxi.dao.HomeDao;
import com.zuiuxi.dao.impl.HomeDaoImpl;
import com.zuiuxi.entity.Home;

public class HomeService {
	
	HomeDao dao = new HomeDaoImpl();
	//查询所有的房间
	public List<Home> selectAllHome() {
		return dao.selectAllHome();
	}
	//修改折扣
	public boolean changeHomeStatus(String discount,String num){
		return dao.changeHomeStatus(discount, num);
	}
	//修改价格
	public boolean changeHomePrice(String num, double prices) {
		return dao.changeHomePrice(num, prices);
	}
	//按房间状态刹
	public List<Home> selectHomeByStatus(int status) {
		return dao.selectHomeByStatus(status);
	}
	//按房间类型查
	public List<Home> selectHomeByTypes(String type) {
		return dao.selectHomeByTypes(type);
	}
	//按房间类型和状态混合查询
	public List<Home> selectHomeByTypesAndStatus(String type, int status) {
		return dao.selectHomeByTypesAndStatus(type, status);
	}
	//查询所有房间号码
	public List<String> selectHomeNum() {
		return dao.selectHomeNum();
	}
	//修改房间的号码
	public boolean changeHomeNum(String num,String newNum) {
		return dao.changeHomeNum(num, newNum);
	}
	//通过房间号码删除房间
	public boolean deleteHomeByNum(String num) {
		return dao.deleteHomeByNum(num);
	}
	//修改房间
	public boolean changeHomeType(String num, String type) {
		return dao.changeHomeType(num, type);
	}
	//修改房间图片
	public int changeHomeImage(String num, String images) {
		return dao.changeHomeImage(num, images);
	}
	//查询所有房间号码
	public List<String> queryAllHomeNum() {
		return dao.queryAllHomeNum();
	}
	//查询所有可以入住的房间
	public List<String> queryAllCanIn() {
		return dao.queryAllCanIn();
	}
	//查询房间的信息通过num
	public Home selectHomeByNum(String num) {
		return dao.selectHomeByNum(num);
	}
}
