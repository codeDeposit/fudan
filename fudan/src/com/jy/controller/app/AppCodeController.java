package com.jy.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.AppCode;
import com.jy.service.app.AppCodeService;

@Controller("appCodeController")
@RequestMapping(value="/appCode")
public class AppCodeController extends BaseController<AppCode> {
	
	@Resource(name="appCodeService")
	private AppCodeService appCodeService;
	
	/*
	 * 获取注册验证码,验证码存储,回掉验证码 .状态码: 1 成功  0 失败
	 */
	@RequestMapping(value="/getCode",method = RequestMethod.GET)
	@ResponseBody
	public AjaxRes sendCode(HttpServletRequest request,Model model,@ModelAttribute AppCode appCode) throws Exception{	
		String phone = request.getParameter("phone");
		AjaxRes ar = getAjaxRes();
		String result = appCodeService.getCode(phone);
		if(result != ""){
			ar.setSucceedMsg(1);
		}else{
			ar.setSucceedMsg(0);
		}
		ar.setResMsg(result);
		return ar;
	}
	
}
