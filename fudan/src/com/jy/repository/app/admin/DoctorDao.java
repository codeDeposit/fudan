package com.jy.repository.app.admin;

import java.util.List;
import com.jy.entity.app.admin.Doctor;
import com.jy.repository.base.JYBatis;

@JYBatis
public abstract interface DoctorDao{
	
	public List<Doctor> find(Doctor doctor);

	public List<Doctor> search(Doctor doctor);

	public int insert(Doctor doctor);

	public int update(Doctor doctor);
	
	public int upOrDown(Doctor doctor);

	public int delete(Doctor doctor);
	
}
