package com.jy.controller.app.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.jy.common.utils.base.Tools;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Doctor;
import com.jy.service.app.admin.DoctorService;

@Controller("appDoctorController")
@RequestMapping(value="/appAdminDoctor")
public class AppAdminDoctorController extends BaseController<Object> {
	
	@Resource(name="doctorService")
	private DoctorService doctorService;
	
	/**
	 * 医生页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/doctorPage")
	public String doctorPage(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/doctor/doctor_index";
	}
	
	/**
	 * 药师页面
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seniorPage")
	public String seniorPage(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/doctor/senior_index";
	}
	
	@RequestMapping("/doctorList")  
	@ResponseBody
	public AjaxRes doctorList(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		List<Doctor> list = doctorService.find(doctor);
		return resMsg(1,list);
	}
	
	@RequestMapping("/phoneEcho")  
	@ResponseBody
	public AjaxRes phoneEcho(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		List<Doctor> list = doctorService.find(doctor);
		if(list.size() != 0){
			doctor = list.get(0);
		}
		return resMsg(list.size(),doctor);
	}
	
	@RequestMapping("/doctorAdd")  
	@ResponseBody
	public AjaxRes doctorAdd(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		int res = doctorService.insert(doctor);
		return resMsg(res);
	}
	
	@RequestMapping("/doctorDelete")  
	@ResponseBody
	public AjaxRes doctorDelete(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		int res = doctorService.delete(doctor);
		return resMsg(res);
	}
	
	@RequestMapping("/doctorDetailPage")  
	public String doctorDetailPage(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		doctor.setJobState(1);
		model.addAttribute("list",doctorService.find(doctor).get(0));
		return "app/admin/doctor/doctor_detail";
	}
	
	@RequestMapping("/seniorDetailPage")  
	public String seniorDetailPage(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		doctor.setJobState(2);
		model.addAttribute("list",doctorService.find(doctor).get(0));
		return "app/admin/doctor/senior_detail";
	}
	
	@RequestMapping("/doctorDetail")  
	@ResponseBody
	public AjaxRes doctorDetail(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		doctor = doctorService.find(doctor).get(0);
		return resMsg(1,doctor);
	}
	
	@RequestMapping("/doctorUpdate")  
	@ResponseBody
	public AjaxRes doctorUpdate(HttpServletRequest request,Model model,Doctor doctor)throws Exception{	
		int res = doctorService.update(doctor);
		return resMsg(res);
	}

	/**
	 * 照片上传
	 * @param request
	 * @param model
	 * @param adv
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updatePicture")  
	@ResponseBody
	public AjaxRes updatePicture(HttpServletRequest request,Model model,
			@RequestParam(value = "picUrl", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\doctor\\";	
		String fileName = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = number + timeOutStr + file.getOriginalFilename();
		}
		return resMsg(1,fileName);
	}	
	
	/**
	 * 照片上传手机端
	 * @param request
	 * @param model
	 * @param adv
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateMobilePicture")  
	@ResponseBody
	public AjaxRes updateMobilePicture(HttpServletRequest request,Model model,Doctor doctor,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(value = "files", required = false) MultipartFile[] files)throws Exception{	
		String filePath = "c:\\image\\doctor\\";	
		String fileName = "";
		String fileNameList = "";
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = number + timeOutStr + file.getOriginalFilename();
		}
		
		for(int i=0;i<files.length;i++){
			if (files[i] != null && !files[i].isEmpty()){
				FileUpload.fileUp(files[i], filePath, number + timeOutStr + files[i].getOriginalFilename().substring(0, files[i].getOriginalFilename().lastIndexOf(".")));
				fileNameList += number + timeOutStr + files[i].getOriginalFilename() + ",";
			}
		}
		doctor.setPicture(fileName);
		doctor.setFileImg(fileNameList);
		doctorService.update(doctor);
		return resMsg(1,fileName);
	}
	
}
