package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Admin;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface AdminDao{
	
	public List<Admin> find(Admin admin);

	public List<Admin> search(Admin admin);

	public int insert(Admin admin);

	public int update(Admin admin);
	
	public int upOrDown(Admin admin);

	public int delete(Admin admin);
	
}
