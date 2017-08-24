package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.Advise;
import com.jy.repository.app.admin.AdviseDao;

@Service(value = "adviseService")
public class AdviseService{
	
	@Resource
	private AdviseDao adivseDao;
	
	public int insert(Advise advise) {
		return this.adivseDao.insert(advise);
	}
	
	public List<Advise> find(Advise advise) {
		return this.adivseDao.find(advise);
	}

	public List<Advise> search(Advise advise) {
		return this.adivseDao.search(advise);
	}

	public int update(Advise advise) {
		return this.adivseDao.update(advise);
	}

	public int delete(Advise advise) {
		return this.adivseDao.delete(advise);
	}
	
}
