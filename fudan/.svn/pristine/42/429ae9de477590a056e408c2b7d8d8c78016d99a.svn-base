package com.jy.service.app.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.Class;
import com.jy.repository.app.admin.ClassDao;

@Service(value = "classService")
public class ClassService{
	
	@Resource
	private ClassDao goodsClassDao;
	
	public int insert(Class goodsClass) {
		return this.goodsClassDao.insert(goodsClass);
	}
	public Map<String,Object> findMap(Class goodsClass){
		Map<String,Object> map = new HashMap<String,Object>();
		int size = 0;
		int one = 0;//一级类别
		int two = 0;//二级类别
		int three = 0;//三级类别
		//一级类别
		Class goodsClass2 = new Class();
		goodsClass2.setGc_parent_id(0);
		goodsClass2.setGc_show(1);
		List<Class> list = goodsClassDao.find(goodsClass2);
		one = list.size();
		map.put("one",one);
		//二级类别
		for(int i=0;i<list.size();i++){
			Class goodsClass3 = new Class();
			goodsClass3.setGc_parent_id(list.get(i).getGc_id());
			goodsClass3.setGc_show(1);
			List<Class> list2 = goodsClassDao.find(goodsClass3);
			two += list2.size();
			//三级类别
			for(int j=0;j<list2.size();j++){
				Class goodsClass4 = new Class();
				goodsClass4.setGc_parent_id(list2.get(j).getGc_id());
				goodsClass4.setGc_show(1);
				List<Class> list3 = goodsClassDao.find(goodsClass4);
				three += list3.size();
			}
			map.put("three",three);
		}
		map.put("two",two);
		size = one + two + three;
		map.put("size",size);
		//显示类别
//		Class goodsClass2 = new Class();
//		goodsClass2.setGc_parent_id(0);
//		goodsClass2.setGc_show(1);
//		List<Class> list = goodsClassDao.find(goodsClass2);
//		for(int i=0;i<list.size();i++){
//			Class goodsClass3 = new Class();
//			goodsClass3.setGc_parent_id(list.get(i).getGc_id());
//			goodsClass3.setGc_show(1);
//			List<Class> list2 = goodsClassDao.find(goodsClass3);
//			size += list2.size();
//		}
//		map.put("size",size);
//		//未显示类别
//		Class goodsClass3 = new Class();
//		goodsClass3.setGc_parent_id(0);
//		goodsClass3.setGc_show(2);
//		List<Class> list3 = goodsClassDao.find(goodsClass3);
//		for(int i=0;i<list3.size();i++){
//			Class goodsClass4 = new Class();
//			goodsClass4.setGc_parent_id(list3.get(i).getGc_id());
//			goodsClass4.setGc_show(2);
//			List<Class> list5 = goodsClassDao.find(goodsClass4);
//			noSize += list5.size();
//		}
		return map;
	}
	public List<Class> find(Class goodsClass) {
		return this.goodsClassDao.find(goodsClass);
	}
	
	public List<Class> search(Class goodsClass) {
		return this.goodsClassDao.search(goodsClass);
	}

	public int update(Class goodsClass) {
		return this.goodsClassDao.update(goodsClass);
	}

	public int update2(Class goodsClass) {
		return this.goodsClassDao.update2(goodsClass);
	}
	
	public int delete(Class goodsClass) {
		return this.goodsClassDao.delete(goodsClass);
	}
	
}
