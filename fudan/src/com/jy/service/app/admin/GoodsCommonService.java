package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.GoodsCommon;
import com.jy.repository.app.admin.GoodsCommonDao;

@Service(value = "goodsCommonService")
public class GoodsCommonService{
	
	@Resource
	private GoodsCommonDao goodsCommonDao;
	
	public int insert(GoodsCommon goodsCommon) {
		return this.goodsCommonDao.insert(goodsCommon);
	}
	
	public List<GoodsCommon> find(GoodsCommon goodsCommon) {
		return this.goodsCommonDao.find(goodsCommon);
	}
	
	public int update(GoodsCommon goodsCommon) {
		return this.goodsCommonDao.update(goodsCommon);
	}
	
}
