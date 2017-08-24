package com.jy.service.app;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.AppCart;
import com.jy.repository.app.AppCartDao;

@Service(value = "appCartService")
public class AppCartService{
	
	@Resource
	private AppCartDao cartDao;
	
	public int insert(AppCart cart) {
		return this.cartDao.insert(cart);
	}
	
	/**
	 * 得到购物车数据
	 * @param cart
	 * @return
	 */
	public List<AppCart> cartList(AppCart cart) {
		return this.cartDao.find(cart);
	}
	
	public List<AppCart> check(AppCart cart) {
		return this.cartDao.find(cart);
	}
	
	public List<AppCart> total(AppCart cart) {
		return this.cartDao.find(cart);
	}
	
	public List<AppCart> find(AppCart cart) {
		List<AppCart> list = new ArrayList<AppCart>();
		String goodsIdStr[] = cart.getGoods_id_str().split(",");
		for(int i=0;i<goodsIdStr.length;i++){
			cart.setGoods_id(Integer.parseInt(goodsIdStr[i]));
			cart.setBuyer_id(cart.getBuyer_id());
			list.add(this.cartDao.find(cart).get(0));
		}
		return list;
	}
	
	public List<AppCart> search(AppCart cart) {
		return this.cartDao.search(cart);
	}

	public int update(AppCart cart) {
		return this.cartDao.update(cart);
	}

	public int update2(AppCart cart) {
		return this.cartDao.update2(cart);
	}
	
	public int delete(AppCart cart) {
		return this.cartDao.delete(cart);
	}
	
}
