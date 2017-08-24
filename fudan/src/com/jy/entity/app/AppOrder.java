package com.jy.entity.app;

import java.util.List;

public class AppOrder {
	
	private int order_id;
	private String order_sn;
	private String pay_sn;
	private int buyer_id;
	private String buyer_name;
	private String buyer_email;
	private String add_time;
	private String payment_code;
	private String payment_time;
	private String finnshed_time;
	private double goods_amount;
	private double order_amount;
	private int shipping_fee;
	private int evaluation_state;
	private int order_state;
	private int delete_state;
	private double refund_amount;
	private String shipping_code;
	private String cancel_reason;
	private int personId;
	private String remark;
	
	//订单商品列表
	private List<AppOrderGoods> AppOrderList; 
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_sn() {
		return order_sn;
	}
	public void setOrder_sn(String order_sn) {
		this.order_sn = order_sn;
	}
	public String getPay_sn() {
		return pay_sn;
	}
	public void setPay_sn(String pay_sn) {
		this.pay_sn = pay_sn;
	}
	public int getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getAdd_time() {
		return add_time;
	}
	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}
	public String getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(String payment_code) {
		this.payment_code = payment_code;
	}
	public String getPayment_time() {
		return payment_time;
	}
	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}
	public String getFinnshed_time() {
		return finnshed_time;
	}
	public void setFinnshed_time(String finnshed_time) {
		this.finnshed_time = finnshed_time;
	}
	public double getGoods_amount() {
		return goods_amount;
	}
	public void setGoods_amount(double goods_amount) {
		this.goods_amount = goods_amount;
	}
	public double getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(double order_amount) {
		this.order_amount = order_amount;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
	}
	public int getEvaluation_state() {
		return evaluation_state;
	}
	public void setEvaluation_state(int evaluation_state) {
		this.evaluation_state = evaluation_state;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public int getDelete_state() {
		return delete_state;
	}
	public void setDelete_state(int delete_state) {
		this.delete_state = delete_state;
	}
	public double getRefund_amount() {
		return refund_amount;
	}
	public void setRefund_amount(double refund_amount) {
		this.refund_amount = refund_amount;
	}
	public String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(String shipping_code) {
		this.shipping_code = shipping_code;
	}
	public List<AppOrderGoods> getAppOrderList() {
		return AppOrderList;
	}
	public void setAppOrderList(List<AppOrderGoods> appOrderList) {
		AppOrderList = appOrderList;
	}
	public String getCancel_reason() {
		return cancel_reason;
	}
	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}
	public int getPersonId() {
		return personId;
	}
	public void setPersonId(int personId) {
		this.personId = personId;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
