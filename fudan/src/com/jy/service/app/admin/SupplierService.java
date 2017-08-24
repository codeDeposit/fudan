package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.Supplier;
import com.jy.repository.app.admin.SupplierDao;

@Service(value = "supplierService")
public class SupplierService{
	
	@Resource
	private SupplierDao supplierDao;
	
	public int insert(Supplier supplier) {
		return this.supplierDao.insert(supplier);
	}
	
	public List<Supplier> find(Supplier supplier) {
		return supplierDao.find(supplier);
	}

	public List<Supplier> search(Supplier supplier) {
		return this.supplierDao.search(supplier);
	}

	public int update(Supplier supplier) {
		return this.supplierDao.update(supplier);
	}

	public int delete(Supplier supplier) {
		return this.supplierDao.delete(supplier);
	}
	
}
