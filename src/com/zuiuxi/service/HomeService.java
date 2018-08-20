package com.zuiuxi.service;

import java.util.List;

import com.zuiuxi.dao.HomeDao;
import com.zuiuxi.dao.impl.HomeDaoImpl;
import com.zuiuxi.entity.Home;

public class HomeService {
	
	HomeDao dao = new HomeDaoImpl();
	//��ѯ���еķ���
	public List<Home> selectAllHome() {
		return dao.selectAllHome();
	}
	//�޸��ۿ�
	public boolean changeHomeStatus(String discount,String num){
		return dao.changeHomeStatus(discount, num);
	}
	//�޸ļ۸�
	public boolean changeHomePrice(String num, double prices) {
		return dao.changeHomePrice(num, prices);
	}
	//������״̬ɲ
	public List<Home> selectHomeByStatus(int status) {
		return dao.selectHomeByStatus(status);
	}
	//���������Ͳ�
	public List<Home> selectHomeByTypes(String type) {
		return dao.selectHomeByTypes(type);
	}
	//���������ͺ�״̬��ϲ�ѯ
	public List<Home> selectHomeByTypesAndStatus(String type, int status) {
		return dao.selectHomeByTypesAndStatus(type, status);
	}
	//��ѯ���з������
	public List<String> selectHomeNum() {
		return dao.selectHomeNum();
	}
	//�޸ķ���ĺ���
	public boolean changeHomeNum(String num,String newNum) {
		return dao.changeHomeNum(num, newNum);
	}
	//ͨ���������ɾ������
	public boolean deleteHomeByNum(String num) {
		return dao.deleteHomeByNum(num);
	}
	//�޸ķ���
	public boolean changeHomeType(String num, String type) {
		return dao.changeHomeType(num, type);
	}
	//�޸ķ���ͼƬ
	public int changeHomeImage(String num, String images) {
		return dao.changeHomeImage(num, images);
	}
	//��ѯ���з������
	public List<String> queryAllHomeNum() {
		return dao.queryAllHomeNum();
	}
	//��ѯ���п�����ס�ķ���
	public List<String> queryAllCanIn() {
		return dao.queryAllCanIn();
	}
	//��ѯ�������Ϣͨ��num
	public Home selectHomeByNum(String num) {
		return dao.selectHomeByNum(num);
	}
}
