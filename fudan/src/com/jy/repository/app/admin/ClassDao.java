package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Class;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface ClassDao{
	
	public List<Class> find(Class goodsClass);

	public List<Class> search(Class goodsClass);

	public int insert(Class goodsClass);

	public int update(Class goodsClass);
	
	public int update2(Class goodsClass);

	public int delete(Class goodsClass);
	
}
