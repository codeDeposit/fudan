package com.jy.service.app.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jy.entity.app.admin.Download;
import com.jy.repository.app.admin.DownloadDao;

@Service(value = "downloadService")
public class DownloadService{
	
	@Resource
	private DownloadDao downloadDao;
	
	public int insert(Download download) {
		return this.downloadDao.insert(download);
	}
	
	public List<Download> find(Download download) {
		//图片路径
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/app/";
		List<Download> list = downloadDao.find(download);
		list.get(0).setAndroid_img(imgUrl + list.get(0).getAndroid_img());
		list.get(0).setIos_img(imgUrl + list.get(0).getIos_img());
		list.get(0).setApp_logo_img(imgUrl + list.get(0).getApp_logo_img());
		return list;
	}

	public List<Download> search(Download download) {
		return this.downloadDao.search(download);
	}

	public int update(Download download) {
		return this.downloadDao.update(download);
	}

	public int delete(Download download) {
		return this.downloadDao.delete(download);
	}
	
}
