package com.zuiuxi.entity;

public class Home {
	private String num;//�������
	private String type;//��������
	private int status; //����״̬  0 δ��ס 1 ��ס 2ԤԼ
	private double prices; //����۸�
	private double discount; //�����ۿ�
	private String images; //����ͼƬ
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public double getPrices() {
		return prices;
	}
	public void setPrices(double prices) {
		this.prices = prices;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Home(String num, String type, int status, double prices,
			double discount, String images) {
		super();
		this.num = num;
		this.type = type;
		this.status = status;
		this.prices = prices;
		this.discount = discount;
		this.images = images;
	}
	public Home() {
		super();
	}
	@Override
	public String toString() {
		return "Home [num=" + num + ", type=" + type + ", status=" + status
				+ ", prices=" + prices + ", discount=" + discount + ", images="
				+ images + "]";
	}
	
}
