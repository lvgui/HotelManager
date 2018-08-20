package com.zuiuxi.dao;

import java.util.List;

import com.zuiuxi.entity.Home;

public interface HomeDao {
	//��ѯ���з���
	public List<Home> selectAllHome();
	//�޸ķ�����ۿ�
	public boolean changeHomeStatus(String discount,String num);
	//�޸ķ���ļ۸�
	public boolean changeHomePrice(String num,double prices);
	//������״̬��ѯ
	public List<Home> selectHomeByStatus(int status);
	//����������ɸѡ
	public List<Home> selectHomeByTypes(String type);
	//���������ͺ�״̬���ɾѡ
	public List<Home> selectHomeByTypesAndStatus(String type,int status);
	//��ѯ��������б�
	public List<String> selectHomeNum();
	//�޸ķ���ĺ���
	public boolean changeHomeNum(String num,String newNum);
	//���������ɾ��
	public boolean deleteHomeByNum(String num);
	//�޸ķ������
	public boolean changeHomeType(String num,String type);
	//�޸ķ���ͼƬ
	public  int changeHomeImage(String num,String images);
	//��ȡ��������
	public List<String> queryAllHomeNum();
	//��ѯ���п���ס�ķ���
	public List<String> queryAllCanIn();
	//ͨ�������Ų�ѯ�η�����Ϣ
	public Home selectHomeByNum(String num);
}
