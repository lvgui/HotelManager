package com.zuiuxi.service;

import java.util.List;

import com.zuiuxi.dao.CustomerDao;
import com.zuiuxi.dao.impl.CustomerDaoImpl;
import com.zuiuxi.entity.Customer;

public class CustomerService {

	CustomerDao dao = new CustomerDaoImpl();
	//��ȡ���е��û�
	public List<Customer> queryAllCustomer() {
		return dao.queryAllCustomer();
	}
}
