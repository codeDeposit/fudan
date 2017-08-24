package com.jy.entity.app.admin;

public class Download {
	
	private int id;     
	private String download_url;
	private String app_name;
	private String app_logo_img;
	private String android_img;
	private String ios_img;                          
	private String android_url;                                    
	private String ios_url;                                
	private String copyright;     
	private double app_version;
	private int downlod_num;
	private String update_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDownload_url() {
		return download_url;
	}
	public void setDownload_url(String download_url) {
		this.download_url = download_url;
	}
	public String getApp_name() {
		return app_name;
	}
	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}
	public String getApp_logo_img() {
		return app_logo_img;
	}
	public void setApp_logo_img(String app_logo_img) {
		this.app_logo_img = app_logo_img;
	}
	public String getAndroid_img() {
		return android_img;
	}
	public void setAndroid_img(String android_img) {
		this.android_img = android_img;
	}
	public String getIos_img() {
		return ios_img;
	}
	public void setIos_img(String ios_img) {
		this.ios_img = ios_img;
	}
	public String getAndroid_url() {
		return android_url;
	}
	public void setAndroid_url(String android_url) {
		this.android_url = android_url;
	}
	public String getIos_url() {
		return ios_url;
	}
	public void setIos_url(String ios_url) {
		this.ios_url = ios_url;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public double getApp_version() {
		return app_version;
	}
	public void setApp_version(double app_version) {
		this.app_version = app_version;
	}
	public int getDownlod_num() {
		return downlod_num;
	}
	public void setDownlod_num(int downlod_num) {
		this.downlod_num = downlod_num;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	
}
