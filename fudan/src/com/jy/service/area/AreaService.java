package com.jy.service.area;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.entity.area.Area;
import com.jy.repository.area.AreaDao;
import com.jy.service.base.BaseServiceImp;

@Service(value = "areaService")
public class AreaService extends BaseServiceImp<Area> {
	
	@Resource
	private AreaDao areaDao;
	
	public List<Area> find(Area area){
		return areaDao.find(area);
	}
	
}
