package com.jy.repository.app;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.entity.app.AppOrder;
import com.jy.repository.base.JYBatis;

@JYBatis
public interface AppOrderDao{
	
	public void insert(AppOrder appOrder);
	
	public List<AppOrder> find(AppOrder appOrder);

	public List<AppOrder> search(AppOrder appOrder);
	
	public List<AppOrder> listLimitData(@Param("page")int page,@Param("num")int num,@Param("order_state")int order_state);
	
	public int count();
	
	public int update(AppOrder appOrder);
	
	public int delete(AppOrder appOrder);
	
}
