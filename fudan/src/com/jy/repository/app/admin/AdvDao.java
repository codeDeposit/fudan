package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Adv;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface AdvDao{
	
	public List<Adv> find(Adv adv);

	public List<Adv> search(Adv adv);

	public int insert(Adv adv);

	public int update(Adv adv);
	
	public int upOrDown(Adv adv);

	public int delete(Adv adv);
	
}
