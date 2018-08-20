package com.zuiuxi.entity;

public class Customer {
	
	private String name; //用户名
	private String credentialstype; //证件类型
	private String credentialsnum;	//证件号码
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCredentialstype() {
		return credentialstype;
	}
	public void setCredentialstype(String credentialstype) {
		this.credentialstype = credentialstype;
	}
	public String getCredentialsnum() {
		return credentialsnum;
	}
	public void setCredentialsnum(String credentialsnum) {
		this.credentialsnum = credentialsnum;
	}
	public Customer(String name, String credentialstype, String credentialsnum) {
		super();
		this.name = name;
		this.credentialstype = credentialstype;
		this.credentialsnum = credentialsnum;
	}
	public Customer() {
		super();
	}
	@Override
	public String toString() {
		return "Customer [name=" + name + ", credentialstype="
				+ credentialstype + ", credentialsnum=" + credentialsnum + "]";
	}
	
	
}
