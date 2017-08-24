package com.jy.controller.app.admin;

import java.util.List;
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
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Adv;
import com.jy.entity.app.admin.Advise;
import com.jy.entity.app.admin.Contact;
import com.jy.entity.app.admin.Version;
import com.jy.service.app.admin.AdviseService;
import com.jy.service.app.admin.ContactService;
import com.jy.service.app.admin.DownloadService;
import com.jy.service.app.admin.VersionService;

@Controller("AppAdminSettingController")
@RequestMapping(value="/appAdminSetting")
public class AppAdminSettingController extends BaseController<Object> {
	
	@Resource(name="adviseService")
	private AdviseService adviseService;
	@Resource(name="versionService")
	private VersionService versionService;
	@Resource(name="contactService")
	private ContactService contactService;
	@Resource(name="downloadService")
	private DownloadService downloadService;
	
	@RequestMapping("/startImgIndex")  
	public String startImgIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_start_img";
	}
	
	@RequestMapping("/contactIndex")  
	public String contactIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_contact";
	}
	
	/**
	 * 服务信息修改 
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contactUpdate")  
	@ResponseBody
	public AjaxRes contactUpdate(HttpServletRequest request,Model model,Contact contact)throws Exception{	
		int res = contactService.update(contact);
		return resMsg(res);
	}
	
	/**
	 * 服务信息列表
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/contactList")  
	@ResponseBody
	public AjaxRes contactList(HttpServletRequest request,Model model,Contact contact)throws Exception{	
		List<Contact> list = contactService.find(contact);
		return resMsg(1,list);
	}
	
	@RequestMapping("/suggestIndex")  
	public String suggestIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_suggest";
	}
	
	/**
	 * 意见反馈列表
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/suggestList")  
	@ResponseBody
	public AjaxRes suggestList(HttpServletRequest request,Model model,Advise advise)throws Exception{	
		List<Advise> list = adviseService.find(advise);
		return resMsg(1,list);
	}
	
	/**
	 * 意见反馈添加
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/suggestAdd")  
	@ResponseBody
	public AjaxRes suggestAdd(HttpServletRequest request,Model model,Advise advise)throws Exception{	
		int res = adviseService.insert(advise);
		return resMsg(res);
	}
	
	/**
	 * 意见反馈回复
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/suggestReply")  
	@ResponseBody
	public AjaxRes suggestReply(HttpServletRequest request,Model model,Advise advise)throws Exception{	
		int res = 0;
		try{
			res = adviseService.update(advise);
		}catch(Exception e){
			System.out.println("数据库操作错误：" + e);
		}
		return resMsg(res);
	}
	
	@RequestMapping("/pushIndex")  
	public String pushIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_push";
	}
	
	/**
	 * 版本管理
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/versionIndex")  
	public String versionIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/appSetting/app_version";
	}
	
	/**
	 * 版本添加
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/versionAdd")  
	@ResponseBody
	public AjaxRes versionAdd(HttpServletRequest request,Model model,Version version,
			@RequestParam(value = "file", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\app\\version\\";	
		String fileName = "";
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = file.getOriginalFilename();
		}
		version.setAppPack(fileName);
		int res = versionService.insert(version);
		return resMsg(res);
	}
	
	/**
	 * 版本列表
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/versionList")  
	@ResponseBody
	public AjaxRes versionList(HttpServletRequest request,Model model,Version version)throws Exception{	
		return resMsg(1,versionService.find(version));
	}
	
	/**
	 * 版本状态更新
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/versionUpdate")  
	@ResponseBody
	public AjaxRes versionUpdate(HttpServletRequest request,Model model,Version version)throws Exception{	
		return resMsg(1,versionService.update(version));
	}
	
	/**
	 * 版本删除
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/versionDelete")  
	@ResponseBody
	public AjaxRes versionDelete(HttpServletRequest request,Model model,Version version)throws Exception{	
		return resMsg(1,versionService.delete(version));
	}
	
}
