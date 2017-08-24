package com.jy.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppItem;
import com.jy.service.app.AppItemService;

@Controller("appItemController")
@RequestMapping(value="/appItem")
public class AppItemController extends BaseController<AppItem> {
	
	@Resource(name="appItemService")
	private AppItemService appItemService;
	
	/*
	 * 协议内容
	 */
	@RequestMapping("/list")  
	public String list(HttpServletRequest request,Model model,@ModelAttribute AppItem appItem) throws Exception{	
		AppItem list = this.appItemService.find(appItem);
		model.addAttribute("list",list);
		return "app/page/app_item";
	}
	
}
