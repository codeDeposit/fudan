package com.jy.entity.app.admin;

import java.util.List;

public class Class {
	
	private int gc_id;                                            
	private String gc_name;                          
	private String type_name;                                    
	private int gc_parent_id;                                
	private String gc_keywords;     
	private String gc_description;     
	private int gc_show;
	private String createDate;
	private List<Class> class2;
	private List<Class> class3;
	
	//显示类别
	private int size;
	//未显示类别
	private int noSize;
	
	public int getGc_id() {
		return gc_id;
	}
	public void setGc_id(int gc_id) {
		this.gc_id = gc_id;
	}
	public String getGc_name() {
		return gc_name;
	}
	public void setGc_name(String gc_name) {
		this.gc_name = gc_name;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public int getGc_parent_id() {
		return gc_parent_id;
	}
	public void setGc_parent_id(int gc_parent_id) {
		this.gc_parent_id = gc_parent_id;
	}
	public String getGc_keywords() {
		return gc_keywords;
	}
	public void setGc_keywords(String gc_keywords) {
		this.gc_keywords = gc_keywords;
	}
	public String getGc_description() {
		return gc_description;
	}
	public void setGc_description(String gc_description) {
		this.gc_description = gc_description;
	}
	public int getGc_show() {
		return gc_show;
	}
	public void setGc_show(int gc_show) {
		this.gc_show = gc_show;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public List<Class> getClass2() {
		return class2;
	}
	public void setClass2(List<Class> class2) {
		this.class2 = class2;
	}
	public List<Class> getClass3() {
		return class3;
	}
	public void setClass3(List<Class> class3) {
		this.class3 = class3;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getNoSize() {
		return noSize;
	}
	public void setNoSize(int noSize) {
		this.noSize = noSize;
	}    
	
}
