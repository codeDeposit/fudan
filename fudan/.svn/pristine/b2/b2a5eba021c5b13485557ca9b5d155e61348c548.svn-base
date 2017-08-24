package com.jy.service.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.jy.entity.app.AppCart;
import com.jy.entity.app.AppOrderGoods;
import com.jy.entity.app.AppOrder;
import com.jy.entity.app.admin.Goods;
import com.jy.repository.app.AppCartDao;
import com.jy.repository.app.AppOrderDao;
import com.jy.repository.app.AppOrderGoodsDao;
import com.jy.repository.app.admin.GoodsDao;

@Service(value = "appOrderService")
public class AppOrderService{
	
	@Resource
	private AppOrderDao appOrderDao;
	@Resource
	private AppOrderGoodsDao appOrderGoodsDao;
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private AppCartDao cartDao;
	
	/*
	 * 订单插入
	 */
	public int orderAdd(AppOrder appOrder){
		this.appOrderDao.insert(appOrder);//订单插入
		return appOrder.getOrder_id();
	}
	
	/**
	 * 订单商品插入
	 */
	public int goodsAdd(AppOrderGoods appOrderGoods) {
		AppOrder appOrder = new AppOrder();
		appOrder.setBuyer_id(appOrderGoods.getBuyer_id());
		appOrder.setBuyer_email(appOrderGoods.getBuyer_email());
		appOrder.setBuyer_name(appOrderGoods.getBuyer_name());
		appOrder.setGoods_amount(appOrderGoods.getGoods_amount());
		appOrder.setOrder_amount(appOrderGoods.getGoods_amount());
		appOrder.setOrder_sn(appOrderGoods.getOrder_sn());
		int order_id = orderAdd(appOrder);//订单插入,得到订单id
		String strs[] = appOrderGoods.getGoodsList().split(",");
		for(int i=0;i<strs.length;i++){
			//根据商品id得到商品信息
			Goods goods = new Goods();
			int goods_id = Integer.parseInt(strs[i]);
			goods.setGoods_id(goods_id);
			goods = goodsDao.find(goods).get(0);
			appOrderGoods.setGoods_id(goods_id);
			appOrderGoods.setGoods_name(goods.getGoods_name());
			appOrderGoods.setGoods_price(goods.getGoods_price());
			//根据goods_id,buyer_id得到商品数量,从购物车移除数据
			AppCart appCart = new AppCart();
			appCart.setGoods_id(goods_id);
			appCart.setBuyer_id(Integer.toString(appOrderGoods.getBuyer_id()));
			List<AppCart> list = cartDao.find(appCart);
			if(list.size() == 0){
				appOrderGoods.setGoods_num(1);
			}else{
				appOrderGoods.setGoods_num(cartDao.find(appCart).get(0).getGoods_num());
			}
			cartDao.delete(cartDao.find(appCart).get(0));
			appOrderGoods.setOrder_id(order_id);
			appOrderGoods.setGoods_image(goods.getGoods_image());
			appOrderGoods.setGoods_pay_price(goods.getGoods_price());
//			appOrderGoods.setGoods_type(goods.getGoods_promotion());
			appOrderGoods.setGoods_fenxiao_price(goods.getGoods_promotion_price());
			appOrderGoodsDao.insert(appOrderGoods);
		}
		return 1;
	}
	
	public List<AppOrder> find(AppOrder appOrder) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/goods/";
		List<AppOrder> list = appOrderDao.find(appOrder);
		//订单商品列表
		for(int i=0;i<list.size();i++){
			AppOrderGoods appOrderGoods = new AppOrderGoods();
			appOrderGoods.setOrder_id(list.get(i).getOrder_id());
			List<AppOrderGoods> list2 = appOrderGoodsDao.find(appOrderGoods);
			for(int j=0;j<list2.size();j++){
				//商品图片
				list2.get(j).setGoods_image(imgUrl + list2.get(j).getGoods_image());
			}
			list.get(i).setAppOrderList(list2);
		}
		return list;
	}
	
	/*
	 * 订单列表，数量统计   （订单总数，待付款，待发货，待收货，已完成，已取消）
	 */
	public Map<String,Object> meter(AppOrder appOrder) {
		//商品总数
		Map<String,Object> map = new HashMap<String,Object>();
		int total = appOrderDao.find(appOrder).size();
		map.put("total",total);
		appOrder.setOrder_state(10);
		map.put("daifu",appOrderDao.find(appOrder).size());
		appOrder.setOrder_state(20);
		map.put("daifa",appOrderDao.find(appOrder).size());
		appOrder.setOrder_state(30);
		map.put("daishou",appOrderDao.find(appOrder).size());
		appOrder.setOrder_state(40);
		map.put("yishou",appOrderDao.find(appOrder).size());
		appOrder.setOrder_state(50);
		map.put("quxiao",appOrderDao.find(appOrder).size());
		return map;
	}
	
	public List<AppOrder> listLimitData(int page,int num,int order_state){
		return this.appOrderDao.listLimitData(page,num,order_state);
	}
	
	public int count(){
		return appOrderDao.count();
	}
	
	public List<AppOrder> search(AppOrder appOrder) {
		return this.appOrderDao.find(appOrder);
	}
	
	public int update(AppOrder appOrder) {
		return this.appOrderDao.update(appOrder);
	}
	
	public int delete(AppOrder appOrder) {
		return this.appOrderDao.delete(appOrder);
	}
	
}
