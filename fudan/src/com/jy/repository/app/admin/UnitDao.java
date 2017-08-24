package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Unit;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface UnitDao{
	
	public List<Unit> find(Unit unit);

	public List<Unit> search(Unit unit);

	public int insert(Unit unit);

	public int update(Unit unit);
	
	public int delete(Unit unit);
	
}
