package com.jy.repository.app;

import java.util.List;

import com.jy.entity.app.AppItem;
import com.jy.entity.app.admin.Advise;
import com.jy.repository.base.JYBatis;

@JYBatis
public interface AppItemDao{
	
	AppItem find(AppItem appItem);

	public List<AppItem> search(AppItem appItem);

	public int insert(AppItem appItem);

	public int update(AppItem appItem);
	
	public int delete(AppItem appItem);
	
}
