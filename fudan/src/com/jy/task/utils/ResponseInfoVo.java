package com.jy.task.utils;

import java.util.List;

public class ResponseInfoVo<T> {

	private boolean success;

	private int totalCount;

	private List<T> list;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	/**
	 * 单例模式
	 */
	
	private static ResponseInfoVo single = null;

	// 静态工厂方法
	public static ResponseInfoVo getInstance() {
		if (single == null) {
			single = new ResponseInfoVo();
		}
		return single;
	}

}
