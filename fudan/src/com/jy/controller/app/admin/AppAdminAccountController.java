package com.jy.controller.app.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.jy.common.ajax.AjaxRes;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Account;
import com.jy.entity.app.admin.Admin;
import com.jy.entity.system.org.Role;
import com.jy.service.app.admin.AdminService;
import com.jy.service.app.admin.AppAccountService;
import com.jy.service.system.org.RoleService;

@Controller("appAdminAccountController")
@RequestMapping(value="/appAdminAccount")
public class AppAdminAccountController extends BaseController<Object> {
	
	@Resource(name="appAccountService")
	private AppAccountService appAccountService;
	@Resource(name="adminService")
	private AdminService adminService;
	@Autowired
	public RoleService roleService;
	
	@RequestMapping("/admin")  
	public String admin(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/account/admin_index";
	}
	
	/**
	 * 角色获取
	 * @param request
	 * @param model
	 * @param admin
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/roleList")  
	@ResponseBody
	public AjaxRes roleList(HttpServletRequest request,Model model)throws Exception{	
		List<Role> list = roleService.selectRoleAll("fa37588369cb457eb5ffc3bea5af0068");
		return resMsg(1,list);
	}
	
	@RequestMapping("/adminList")  
	@ResponseBody
	public AjaxRes adminList(HttpServletRequest request,Model model,Admin admin)throws Exception{	
		List<Admin> list = adminService.find(admin);
		for(int i=0;i<list.size();i++){
			list.get(i).setRole_name(roleService.getRole(list.get(i).getAdmin_gid()).getName());
		}
		return resMsg(1,list);
	}
	
	@RequestMapping("/adminAdd")  
	@ResponseBody
	public AjaxRes adminAdd(HttpServletRequest request,Model model,Admin admin)throws Exception{	
		admin.setAdmin_password(admin.getAdmin_password()); 
		int res = adminService.insert(admin);
		return resMsg(res);
	}
	
	@RequestMapping("/adminDelete")  
	@ResponseBody
	public AjaxRes adminDelete(HttpServletRequest request,Model model,Admin admin)throws Exception{	
		int res = adminService.delete(admin);
		return resMsg(res);
	}
	
	@RequestMapping("/adminDetail")  
	@ResponseBody
	public AjaxRes adminDetail(HttpServletRequest request,Model model,Admin admin)throws Exception{	
		admin = adminService.find(admin).get(0);
		return resMsg(1,admin);
	}
	
	@RequestMapping("/adminUpdate")  
	@ResponseBody
	public AjaxRes adminUpdate(HttpServletRequest request,Model model,Admin admin)throws Exception{	
		int res = adminService.update(admin);
		return resMsg(res);
	}
	
	@RequestMapping("/index")  
	public String index(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/account/account_add";
	}
	
	@RequestMapping("/jifen")  
	public String jifen(HttpServletRequest request,Model model,Account account)throws Exception{	
		List<Account> list = appAccountService.find(account);
		model.addAttribute("list",list);
		return "app/admin/account/account_jifen";
	}
	
	@RequestMapping("/list")  
	public String list(HttpServletRequest request,Model model,Account account)throws Exception{	
		List<Account> list = appAccountService.find(account);
		model.addAttribute("list",list);
		return "app/admin/account/account_list";
	}
	
	@RequestMapping("/detail")  
	public String detail(HttpServletRequest request,Model model,Account account)throws Exception{	
		List<Account> list = appAccountService.find(account);
		model.addAttribute("list",list);
		return "app/admin/account/account_detail";
	}
	
	@RequestMapping("/delete")  
	@ResponseBody
	public AjaxRes delete(HttpServletRequest request,Model model,Account account)throws Exception{	
		int res = appAccountService.delete(account);
		return resMsg(res);
	}
	
	/**
	 * 人员添加		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param account
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/add")  
	@ResponseBody
	public AjaxRes add(HttpServletRequest request,Model model,Account account)throws Exception{	
		int res = 0;
		try{
			res = appAccountService.insert(account);
		}catch(Exception e){
			System.out.println("数据库操作错误：" + e);
		}
		return resMsg(res);
	}
	
}
