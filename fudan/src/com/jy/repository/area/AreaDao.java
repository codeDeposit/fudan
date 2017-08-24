package com.jy.repository.area;

import java.util.List;

import com.jy.entity.area.Area;
import com.jy.repository.base.BaseDao;
import com.jy.repository.base.JYBatis;

@JYBatis
public interface AreaDao extends BaseDao<Area>{
	
	List<Area> find(Area area);

}
