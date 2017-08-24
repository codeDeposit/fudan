package com.jy.repository.app.admin;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.jy.entity.app.admin.Person;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface PersonDao{
	
	public List<Person> find(Person person);

	public List<Person> search(Person person);
	
	public List<Person> listLimitData(@Param("page")int page,@Param("num")int num);
	
	public int insert(Person person);

	public int update(Person person);

	public int delete(Person person);
	
	public int count();
	
}
