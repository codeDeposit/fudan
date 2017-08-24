package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jy.entity.app.admin.Version;
import com.jy.repository.app.admin.VersionDao;

@Service(value = "versionService")
public class VersionService{
	
	@Resource
	private VersionDao versionDao;
	
	public int insert(Version version) {
		return this.versionDao.insert(version);
	}
	
	public List<Version> find(Version version) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/app/version/";
		List<Version> list = versionDao.find(version);
		for(int i=0;i<list.size();i++){
			list.get(i).setAppPack(imgUrl + list.get(i).getAppPack());
		}
		return list;
	}

	public List<Version> search(Version version) {
		return this.versionDao.search(version);
	}

	public int update(Version version) {
		return this.versionDao.update(version);
	}
	
	public int delete(Version version) {
		return this.versionDao.delete(version);
	}
	
}
