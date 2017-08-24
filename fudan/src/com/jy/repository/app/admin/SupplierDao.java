package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Supplier;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface SupplierDao{
	
	public List<Supplier> find(Supplier supplier);

	public List<Supplier> search(Supplier supplier);

	public int insert(Supplier supplier);

	public int update(Supplier supplier);
	
	public int upOrDown(Supplier supplier);

	public int delete(Supplier supplier);
	
}
