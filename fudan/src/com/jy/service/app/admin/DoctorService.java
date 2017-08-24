package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.jy.entity.app.admin.Doctor;
import com.jy.repository.app.admin.DoctorDao;

@Service(value = "doctorService")
public class DoctorService{
	
	@Resource
	private DoctorDao doctorDao;
	
	public int insert(Doctor doctor) {
		return this.doctorDao.insert(doctor);
	}
	
	public List<Doctor> find(Doctor doctor) {
		//图片路径
		List<Doctor> list = doctorDao.find(doctor);
		for(int i=0;i<list.size();i++){
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
			String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/doctor/";
			list.get(i).setPicture(imgUrl + list.get(i).getPicture());
		}
		return list;
	}

	public List<Doctor> search(Doctor doctor) {
		return this.doctorDao.search(doctor);
	}

	public int update(Doctor doctor) {
		return this.doctorDao.update(doctor);
	}

	public int delete(Doctor doctor) {
		return this.doctorDao.delete(doctor);
	}
	
}
