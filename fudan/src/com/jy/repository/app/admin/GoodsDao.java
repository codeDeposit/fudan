package com.jy.repository.app.admin;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.jy.entity.app.admin.Goods;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface GoodsDao{
	
	public List<Goods> find(Goods goods);
	
	public List<Goods> findLimit(@Param("page")int page,@Param("num")int num,@Param("gc_id")int gc_id,@Param("storage_state")int storage_state);
	
	public int count(Goods goods);
	
	public List<Goods> search(Goods goods);

	public void insert(Goods goods);

	public int update(Goods goods);

	public int delete(Goods goods);
	
}
