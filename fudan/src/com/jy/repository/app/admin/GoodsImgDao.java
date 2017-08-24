package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.GoodsImg;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface GoodsImgDao{
	
	public List<GoodsImg> find();
	
	public int update(GoodsImg goodsImg);
	
}
