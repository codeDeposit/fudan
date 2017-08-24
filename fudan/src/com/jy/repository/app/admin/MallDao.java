package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Mall;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface MallDao{
	
	public List<Mall> find(Mall mall);

	public List<Mall> search(Mall mall);

	public void insert(Mall mall);

	public int update(Mall mall);
	
	public int update2(Mall mall);

	public int delete(Mall mall);
	
}
