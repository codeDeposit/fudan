package com.jy.entity.app;

public class AppCart {
	
	private int cart_id;
	private String buyer_id;
	private int goods_id;
	private String goods_name;
	private double goods_price;
	private int goods_num;
	private String goods_image;
	private double goods_fenxiao_price;
	
	//商品数量
	private int number;
	//商品id字符串
	private String goods_id_str;
	//用户id字符串
	private String buy_id_str;
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(double goods_price) {
		this.goods_price = goods_price;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public double getGoods_fenxiao_price() {
		return goods_fenxiao_price;
	}
	public void setGoods_fenxiao_price(double goods_fenxiao_price) {
		this.goods_fenxiao_price = goods_fenxiao_price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getGoods_id_str() {
		return goods_id_str;
	}
	public void setGoods_id_str(String goods_id_str) {
		this.goods_id_str = goods_id_str;
	}
	public String getBuy_id_str() {
		return buy_id_str;
	}
	public void setBuy_id_str(String buy_id_str) {
		this.buy_id_str = buy_id_str;
	}
	
}
