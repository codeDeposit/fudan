package com.jy.controller.app.admin;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppOrder;
import com.jy.service.app.AppOrderService;

@Controller("appAdminOrderController")
@RequestMapping(value="/appAdminOrder")
public class AppAdminOrderController extends BaseController<Object> {
	
	@Resource(name="appOrderService")
	private AppOrderService appOrderService;
	
	/**
	 * 订单列表页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/listPage")  
	public String index(HttpServletRequest request,Model model)throws Exception{	
		int order_state = Integer.parseInt(request.getParameter("order_state"));
		model.addAttribute("order_state",order_state);
		return "app/admin/order/order_list";
	}
	
	/**
	 * 数量统计   （订单总数，待付款，待发货，待收货，已完成，已取消）
	 * @param request
	 * @param model
	 * @param appOrder
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/meter")
	@ResponseBody
	public AjaxRes meter(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		Map<String, Object> map = appOrderService.meter(appOrder);
		return resMsg(1,map);
	}
	
	/**
	 * 订单数据分页
	 */
	@RequestMapping("/listLimitData")  
	@ResponseBody
	public AjaxRes listLimitData(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		String order_stateStr = request.getParameter("order_state");
		String pageStr = request.getParameter("page");
		String limitStr = request.getParameter("limit");
		String startStr = request.getParameter("start");
		int order_state = 0;
		int page = 0;
		int limit = 0;
		int start = 0;
		if(order_stateStr != null && order_stateStr != "" && order_stateStr != "undefined"){
			order_state = Integer.parseInt(order_stateStr);
		}
		if(pageStr != null && pageStr != "" && pageStr != "undefined"){
			page = Integer.parseInt(pageStr);
		}
		if(limitStr != null && limitStr != "" && limitStr != "undefined"){
			limit = Integer.parseInt(limitStr);
		}
		if(startStr != null && startStr != "" && startStr != "undefined"){
			start = Integer.parseInt(startStr);
		}
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("total",appOrderService.count());
		map.put("data",appOrderService.listLimitData(start,limit,order_state));
		return resMsg(1,map);
	}
	
	/**
	 * 商品详情
	 */
	@RequestMapping("/detail")  
	public String detail(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		model.addAttribute("list",appOrderService.search(appOrder).get(0));
		return "app/admin/order/order_detail";
	}
	
	/**
	 * 商品价格修改
	 */
	@RequestMapping("/update")  
	@ResponseBody
	public AjaxRes update(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		int res = appOrderService.update(appOrder);
		return resMsg(res);
	}
	
	/**
	 * 发货
	 */
	@RequestMapping("/OrderSend")  
	@ResponseBody
	public AjaxRes OrderSend(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		int res = appOrderService.update(appOrder);
		return resMsg(res);
	}
	
	/**
	 * 订单取消
	 */
	@RequestMapping("/orderCancel")  
	@ResponseBody
	public AjaxRes orderCancel(HttpServletRequest request,Model model,AppOrder appOrder)throws Exception{	
		int res = appOrderService.update(appOrder);
		return resMsg(res);
	}
}
