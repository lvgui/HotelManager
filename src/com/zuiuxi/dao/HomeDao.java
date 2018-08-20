package com.zuiuxi.dao;

import java.util.List;

import com.zuiuxi.entity.Home;

public interface HomeDao {
	//查询所有房间
	public List<Home> selectAllHome();
	//修改房间的折扣
	public boolean changeHomeStatus(String discount,String num);
	//修改房间的价格
	public boolean changeHomePrice(String num,double prices);
	//按房间状态查询
	public List<Home> selectHomeByStatus(int status);
	//按房间类型筛选
	public List<Home> selectHomeByTypes(String type);
	//按房间类型和状态混合删选
	public List<Home> selectHomeByTypesAndStatus(String type,int status);
	//查询房间号码列表
	public List<String> selectHomeNum();
	//修改房间的号码
	public boolean changeHomeNum(String num,String newNum);
	//按房间号码删除
	public boolean deleteHomeByNum(String num);
	//修改房间类别
	public boolean changeHomeType(String num,String type);
	//修改房间图片
	public  int changeHomeImage(String num,String images);
	//获取房间类型
	public List<String> queryAllHomeNum();
	//查询所有可以住的房间
	public List<String> queryAllCanIn();
	//通过房间编号查询次房间信息
	public Home selectHomeByNum(String num);
}
