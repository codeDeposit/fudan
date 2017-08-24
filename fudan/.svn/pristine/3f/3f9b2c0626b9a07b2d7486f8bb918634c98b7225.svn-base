package com.jy.controller.app.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.jy.common.ajax.AjaxRes;
import com.jy.common.utils.FileUpload;
import com.jy.common.utils.base.Tools;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Person;
import com.jy.service.app.admin.PersonService;

@Controller("appPersonController")
@RequestMapping(value="/appPerson")
public class AppPersonController extends BaseController<Object> {
	
	@Resource(name="personService")
	private PersonService personService;
	
	/**
	 * 配送人添加
	 */
	@RequestMapping("/personPage")
	public String personPage(HttpServletRequest request,Model model,Person person)throws Exception{	
		return "app/admin/person/person_list";
	}
	
	/**
	 * 配送人添加
	 */
	@RequestMapping("/add")
	@ResponseBody
	public AjaxRes add(HttpServletRequest request,Model model,Person person)throws Exception{	
		int res = personService.insert(person);
		return resMsg(res);
	}

	/**
	 * 配送人添加
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public AjaxRes delete(HttpServletRequest request,Model model,Person person)throws Exception{	
		int res = personService.delete(person);
		return resMsg(res);
	}
	
	/**
	 * 配送人添加
	 */
	@RequestMapping("/update")
	@ResponseBody
	public AjaxRes update(HttpServletRequest request,Model model,Person person)throws Exception{	
		int res = personService.update(person);
		return resMsg(res);
	}
	
	/**
	 * 头像上传
	 * @param request
	 * @param model
	 * @param adv
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateImg")  
	@ResponseBody
	public AjaxRes updateImg(HttpServletRequest request,Model model,Person person,
			@RequestParam(value = "picUrl", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\person\\";	
		String fileName = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName += number + timeOutStr + file.getOriginalFilename();
		}
		return resMsg(1,fileName);
	}
	
	/**
	 * 配送人列表分页
	 */
	@RequestMapping("/listLimitData")
	@ResponseBody
	public AjaxRes listLimitData(HttpServletRequest request,Model model,Person person)throws Exception{	
		String pageStr = request.getParameter("page");
		String limitStr = request.getParameter("limit");
		String startStr = request.getParameter("start");
		int page = 0;
		int limit = 0;
		int start = 0;
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
		map.put("total",personService.count());
		map.put("data",personService.listLimitData(start,limit));
		return resMsg(1,map);
	}
	
	/**
	 * 配送人列表
	 */
	@RequestMapping("/list")
	@ResponseBody
	public AjaxRes list(HttpServletRequest request,Model model,Person person)throws Exception{	
		return resMsg(1,personService.find(person));
	}
	
}