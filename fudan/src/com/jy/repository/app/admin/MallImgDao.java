package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.MallImg;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface MallImgDao{
	
	public List<MallImg> find(MallImg mallImg);

	public List<MallImg> search(MallImg mallImg);

	public int insert(MallImg mallImg);

	public int update(MallImg mallImg);
	
	public int upOrDown(MallImg mallImg);
	
	public int update2(MallImg mallImg);

	public int delete(MallImg mallImg);
	
}
