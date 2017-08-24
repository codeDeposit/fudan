package com.jy.controller.area;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.area.Area;
import com.jy.service.area.AreaService;

@Controller("areaController")
@RequestMapping(value="/area")
public class AreaController extends BaseController<Area> {
	
	@Resource(name="areaService")
	private AreaService areaService;
	
	/*
	 * 省份地址
	 */
	@RequestMapping("/list")  
	@ResponseBody
	public AjaxRes list(HttpServletRequest request,Model model,@ModelAttribute Area area) throws Exception{	
		AjaxRes ar = getAjaxRes();
		List<Area> arealist = this.areaService.find(area);
		ar.setSucceed(arealist, 1);
		return ar;
	}
	
	
}
