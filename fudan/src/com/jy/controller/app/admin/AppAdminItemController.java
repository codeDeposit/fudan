package com.jy.controller.app.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppItem;
import com.jy.service.app.AppItemService;
import com.jy.service.app.admin.DownloadService;

@Controller("AppAdminItemController")
@RequestMapping(value="/appAdminItem")
public class AppAdminItemController extends BaseController<Object> {
	
	@Resource(name="downloadService")
	private DownloadService downloadService;
	@Resource(name="appItemService")
	private AppItemService appItemService;
	
	@RequestMapping("/index")  
	public String index(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_item";
	}
	
	@RequestMapping("/list")  
	@ResponseBody
	public AjaxRes list(HttpServletRequest request,Model model,AppItem appItem)throws Exception{	
		appItem = appItemService.find(appItem);
		return resMsg(1,appItem);
	}
	
	@RequestMapping("/update")  
	@ResponseBody
	public AjaxRes update(HttpServletRequest request,Model model,AppItem appItem)throws Exception{	
		int res = appItemService.update(appItem);
		return resMsg(res);
	}
	
}