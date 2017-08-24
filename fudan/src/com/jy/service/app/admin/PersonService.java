package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jy.entity.app.AppOrder;
import com.jy.entity.app.admin.Class;
import com.jy.entity.app.admin.Person;
import com.jy.repository.app.admin.PersonDao;

@Service(value = "personService")
public class PersonService{
	
	@Resource
	private PersonDao personDao;
	
	public int insert(Person person) {
		return this.personDao.insert(person);
	}
	
	public List<Person> listLimitData(int page,int num){
		List<Person> list = this.personDao.listLimitData(page,num);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/person/";
		//取出图片路径
		for(int i=0;i<list.size();i++){
			list.get(i).setPicture(imgUrl + list.get(i).getPicture());
		}
		return list;
	}
	
	public List<Person> find(Person person) {
		List<Person> list = this.personDao.find(person);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/person/";
		//取出图片路径
		for(int i=0;i<list.size();i++){
			list.get(i).setPicture(imgUrl + list.get(i).getPicture());
		}
		return list;
	}
	
	public int update(Person person) {
		return this.personDao.update(person);
	}
	
	public int delete(Person person) {
		return this.personDao.delete(person);
	}
	
	public int count(){
		return personDao.count();
	}
	
}
