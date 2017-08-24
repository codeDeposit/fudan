package com.jy.service.app.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.entity.app.admin.GoodsImg;
import com.jy.repository.app.admin.GoodsImgDao;

@Service(value = "goodsImgService")
public class GoodsImgService{
	
	@Resource
	private GoodsImgDao goodsImgDao;
	
	public List<GoodsImg> find() {
		return this.goodsImgDao.find();
	}
	
	public int update(GoodsImg goodsImg) {
		return this.goodsImgDao.update(goodsImg);
	}
	
}
