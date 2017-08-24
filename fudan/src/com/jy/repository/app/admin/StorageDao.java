package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Storage;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface StorageDao{
	
	public List<Storage> find(Storage storage);

	public List<Storage> search(Storage storage);

	public void insert(Storage storage);

	public int update(Storage storage);
	
	public int delete(Storage storage);
	
}
