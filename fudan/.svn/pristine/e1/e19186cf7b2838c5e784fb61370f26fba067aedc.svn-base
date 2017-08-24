package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jy.entity.app.admin.Adv;
import com.jy.repository.app.admin.AdvDao;

@Service(value = "appAdvService")
public class AppAdvService{
	
	@Resource
	private AdvDao advDao;
	
	public int insert(Adv adv) {
		//得出广告数量,在原有数量加1得出广告位置
		Adv adv2 = new Adv();
		int res = advDao.find(adv2).size();
		adv.setSlide_sort(res + 1);
		return this.advDao.insert(adv);
	}
	
	public List<Adv> find(Adv adv) {
		List<Adv> list = advDao.find(adv);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/adv/";
		for(int i=0;i<list.size();i++){
			list.get(i).setImg(imgUrl + list.get(i).getImg());
		}
		return list;
	}
	
	/**
	 * 广告上移
	 * @param adv
	 * @return
	 */
	public int up(Adv adv) {
		//原广告更新
		Adv adv2 = new Adv();
		adv2.setSlide_sort((adv.getSlide_sort()));
		adv2.setSort((adv.getSlide_sort()+1));
		this.advDao.upOrDown(adv2);
		return this.advDao.update(adv);
	}
	
	/**
	 * 广告下移
	 * @param adv
	 * @return
	 */
	public int down(Adv adv) {
		//原广告更新
		Adv adv2 = new Adv();
		adv2.setSlide_sort((adv.getSlide_sort()));
		adv2.setSort((adv.getSlide_sort()-1));
		this.advDao.upOrDown(adv2);
		return this.advDao.update(adv);
	}
	
	public List<Adv> search(Adv adv) {
		return this.advDao.search(adv);
	}

	public int update(Adv adv) {
		return this.advDao.update(adv);
	}

	public int delete(Adv adv) {
		return this.advDao.delete(adv);
	}
	
}
