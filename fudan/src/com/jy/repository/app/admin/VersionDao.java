package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Version;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface VersionDao{
	
	public List<Version> find(Version version);

	public List<Version> search(Version version);

	public int insert(Version version);

	public int update(Version version);

	public int delete(Version version);
	
}
