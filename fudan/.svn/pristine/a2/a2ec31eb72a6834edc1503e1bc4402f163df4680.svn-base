package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.Admin;
import com.jy.repository.app.admin.AdminDao;

@Service(value = "adminService")
public class AdminService{
	
	@Resource
	private AdminDao adminDao;
	
	public int insert(Admin admin) {
		return this.adminDao.insert(admin);
	}
	
	public List<Admin> find(Admin admin) {
		return this.adminDao.find(admin);
	}

	public List<Admin> search(Admin admin) {
		return this.adminDao.search(admin);
	}

	public int update(Admin admin) {
		return this.adminDao.update(admin);
	}

	public int delete(Admin admin) {
		return this.adminDao.delete(admin);
	}
	
}
