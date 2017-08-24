package com.jy.controller.app.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Download;
import com.jy.entity.app.admin.Version;
import com.jy.service.app.admin.DownloadService;
import com.jy.service.app.admin.VersionService;

@Controller("appDownloadController")
@RequestMapping(value="/appDownload")
public class AppDownloadController extends BaseController<Object> {
	
	@Resource(name="downloadService")
	private DownloadService downloadService;
	@Resource(name="versionService")
	private VersionService versionService;
	
	/**
	 * 下载页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/page")  
	public String page(HttpServletRequest request,Model model)throws Exception{	
		return "app/page/download";
	}
	
	/**
	 * 下载配置信息
	 * @param request
	 * @param model
	 * @param download
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/urlSet")
	@ResponseBody
	public AjaxRes urlSet(HttpServletRequest request,Model model,Download download)throws Exception{	
		return resMsg(1,downloadService.find(download).get(0));
	}
	
	/**
	 * 版本信息
	 */
	@RequestMapping("/version")
	@ResponseBody
	public AjaxRes version(HttpServletRequest request,Model model,Version version)throws Exception{	
		return resMsg(1,versionService.find(version).get((versionService.find(version).size()-1)));
	}
	
}
