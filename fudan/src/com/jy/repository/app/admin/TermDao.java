package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Term;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface TermDao{
	
	public List<Term> find(Term term);

	public List<Term> search(Term term);

	public int insert(Term term);

	public int update(Term term);
	
	public int upOrDown(Term term);

	public int delete(Term term);
	
}
