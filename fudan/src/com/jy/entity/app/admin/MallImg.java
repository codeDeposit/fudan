package com.jy.entity.app.admin;

public class MallImg {
	
	private int id;
	private int mall_id;
	private int sort;
	private String img;
	private int state;   
	private String links;
	
	//mall表class_id
	private int class_id;
	//原有位置id存储
	private int sortM;
	
	public int getMall_id() {
		return mall_id;
	}
	public void setMall_id(int mall_id) {
		this.mall_id = mall_id;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public int getSortM() {
		return sortM;
	}
	public void setSortM(int sortM) {
		this.sortM = sortM;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLinks() {
		return links;
	}
	public void setLinks(String links) {
		this.links = links;
	}
}
