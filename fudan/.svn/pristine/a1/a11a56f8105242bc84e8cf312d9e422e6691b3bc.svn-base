package com.jy.task.utils;

/**
 * 列表的分页显示
 */
public class PageBean {

	private int currentPage; 		// 当前页
	private int rowsCount; 			// 总行数
	private int pageSize = 15; 		// 每页多少行
	private int pageCount; 			// 总页数
	
	public PageBean(int rows) {
		// 设置总行数
		this.setRowsCount(rows);
		// 设置总页数
        if(this.rowsCount % this.pageSize == 0){
            this.pageCount= this.rowsCount / this.pageSize;
        }else{
        	this.pageCount = this.rowsCount / this.pageSize +1;
        }  
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRowsCount() {
		return rowsCount;
	}

	public void setRowsCount(int rowCount) {
		this.rowsCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

}
