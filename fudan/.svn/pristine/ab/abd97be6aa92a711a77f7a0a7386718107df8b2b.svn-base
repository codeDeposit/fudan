package com.jy.service.app;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.AppItem;
import com.jy.repository.app.AppItemDao;

@Service(value = "appItemService")
public class AppItemService{
	
	@Resource
	private AppItemDao appItemDao;
	
	public int insert(AppItem appItem) {
		return this.appItemDao.insert(appItem);
	}
	
	public AppItem find(AppItem appItem) {
		return this.appItemDao.find(appItem);
	}

	public List<AppItem> search(AppItem appItem) {
		return this.appItemDao.search(appItem);
	}

	public int update(AppItem appItem) {
		return this.appItemDao.update(appItem);
	}

	public int delete(AppItem appItem) {
		return this.appItemDao.delete(appItem);
	}
	
}
