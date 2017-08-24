package com.jy.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppCart;
import com.jy.service.app.AppCartService;

@Controller("appCartController")
@RequestMapping(value="/appCart")
public class AppCartController extends BaseController<Object> {
	
	@Resource(name="appCartService")
	private AppCartService cartService;
	
	@RequestMapping("/insert")  
	@ResponseBody
	public AjaxRes insert(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		int res = cartService.insert(cart);
		return resMsg(res);
	}
	
	@RequestMapping("/delete")  
	@ResponseBody
	public AjaxRes delete(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		int res = cartService.delete(cart);
		return resMsg(res);
	}
	
	@RequestMapping("/cartList")  
	@ResponseBody
	public AjaxRes cartList(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		AjaxRes ar = getAjaxRes();
		ar.setSucceed(cartService.cartList(cart), 1);
		return ar;
	}
	
	@RequestMapping("/find")  
	@ResponseBody
	public AjaxRes find(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		AjaxRes ar = getAjaxRes();
		ar.setSucceed(cartService.find(cart), 1);
		return ar;
	}
	
	@RequestMapping("/check")  
	@ResponseBody
	public AjaxRes check(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		AjaxRes ar = getAjaxRes();
		ar.setSucceed(cartService.check(cart), 1);
		return ar;
	}
	
	@RequestMapping("/total")  
	@ResponseBody
	public AjaxRes total(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		AjaxRes ar = getAjaxRes();
		ar.setSucceed(cartService.total(cart), 1);
		return ar;
	}
	
	@RequestMapping("/detail")  
	@ResponseBody
	public AjaxRes detail(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		AjaxRes ar = getAjaxRes();
		AppCart cart2 = cartService.find(cart).get(0);
		ar.setSucceed(cart2, 1);
		return ar;
	}
	
	@RequestMapping("/update")  
	@ResponseBody
	public AjaxRes update(HttpServletRequest request,Model model,AppCart cart)throws Exception{	
		int res = cartService.update(cart);
		return resMsg(res);
	}
	
}
