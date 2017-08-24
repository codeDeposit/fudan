package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Pill;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface PillDao{
	
	public List<Pill> find(Pill pill);

	public List<Pill> search(Pill pill);

	public int insert(Pill pill);

	public int update(Pill pill);
	
	public int delete(Pill pill);
	
}
