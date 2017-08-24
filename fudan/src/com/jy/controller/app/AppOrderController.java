package com.jy.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppOrder;
import com.jy.entity.app.AppOrderGoods;
import com.jy.service.app.AppOrderService;

@Controller("appOrderController")
@RequestMapping(value="/appOrder")
public class AppOrderController extends BaseController<Object> {
	
	@Resource(name="appOrderService")
	private AppOrderService appOrderService;
	
	/**
	 * 商品插入
	 * @param request
	 * @param model
	 * @param appOrder
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goodsAdd")  
	@ResponseBody
	public AjaxRes goodsAdd(HttpServletRequest request,Model model,AppOrderGoods appOrderGoods)throws Exception{	
		int res = appOrderService.goodsAdd(appOrderGoods);
		return resMsg(res);
	}
	
	@RequestMapping("/listData")  
	@ResponseBody
	public AjaxRes listData(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		AjaxRes ar = getAjaxRes();
		ar.setSucceed(appOrderService.find(appOrder),1);
		return ar;
	}
	
}
