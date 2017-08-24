package com.jy.controller.system.account;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jy.common.ajax.AjaxRes;
import com.jy.common.mybatis.Page;
import com.jy.common.utils.FileUpload;
import com.jy.common.utils.base.Const;
import com.jy.common.utils.base.MD5;
import com.jy.common.utils.security.AccountShiroUtil;
import com.jy.common.utils.tree.entity.ZNodes;
import com.jy.controller.base.BaseController;
import com.jy.entity.system.account.Account;
import com.jy.service.system.account.AccountService;

@Controller
@RequestMapping("/backstage/account/")
public class AccountController extends BaseController<Account>{

	@Autowired
	private AccountService service;

	@RequestMapping("index")	
	public String index(Model model){
		if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
			model.addAttribute("permitBtn", getPermitBtn(Const.RESOURCES_TYPE_FUNCTION));	
			return "/system/account/list";
		}
		return Const.NO_AUTHORIZED_URL;
	}
	
	@RequestMapping(value="roleTree", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes roleTree(){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/account/index"))){
			try {
				List<ZNodes> list = service.getRoles();
				ar.setSucceed(list);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}	
		return ar;
	}
		
	@RequestMapping(value="findByPage", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes findByPage(Page<Account> page,Account o){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/account/index"))){
			try {
				Page<Account> accounts=service.findByPage(o, page);
				Map<String, Object> p = new HashMap<String, Object>();
				p.put("permitBtn",getPermitBtn(Const.RESOURCES_TYPE_BUTTON));
				p.put("list",accounts);		
				ar.setSucceed(p);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}	
		return ar;
	}
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes add(Account o){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){			
			try {
				o.setAccountId(get32UUID());
				int res = service.insertAccount(o);
				if(res == 1){
					ar.setSucceedMsg(Const.SAVE_SUCCEED);
				}else{
					ar.setFailMsg("登录名已存在");	
				}
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.SAVE_FAIL);
			}
		}
		return ar;
	}
	
	@RequestMapping(value="delBatch", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes delBatch(String chks){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){		
			try {
				service.deleteBatchAccount(chks);
				ar.setSucceedMsg(Const.DEL_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DEL_FAIL);
			}
		}
		return ar;
	}
	
	@RequestMapping(value="find", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes find(Account o){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){	
			try {
				List<Account> list=service.find(o);
				Account acount =list.get(0);
				ar.setSucceed(acount);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ar;
	}
	
	/**
	 * 用户信息更新
	 * @param o
	 * @return
	 */
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes update(Account o){
		AjaxRes ar = getAjaxRes();
//		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
		try {
			o.setUpdateTime(new Date());
			service.update(o);
			ar.setSucceedMsg(Const.UPDATE_SUCCEED);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.UPDATE_FAIL);
		}
//		}	
		return ar;
	}
	
	@RequestMapping(value="del", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes del(Account o){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				service.deleteAccount(o);
				ar.setSucceedMsg(Const.DEL_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DEL_FAIL);
			}
		}	
		return ar;
	}
	
	@RequestMapping(value="resetPwd", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes resetPwd(Account o){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {		
				o.setPassword(getPageData().getString("pwd"));
				int res = service.sysResetPwd(o);
				if(res==1) ar.setSucceedMsg(Const.UPDATE_SUCCEED);
				else ar.setFailMsg(Const.UPDATE_FAIL);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.UPDATE_FAIL);
			}
		}
		return ar;
	}
	
	@RequestMapping(value="setSetting", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes setSetting(String skin){
		AjaxRes ar = getAjaxRes();
		try {
			service.setSetting(skin);
			ar.setSucceedMsg(Const.UPDATE_SUCCEED);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.UPDATE_FAIL);
		}
		return ar;
	}
	
	@RequestMapping(value="getPerData", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes getPerData(){
		AjaxRes ar = getAjaxRes();
		try {
			Account account = service.getPerData();
			ar.setSucceed(account);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.DATA_FAIL);
		}
		return ar;
	}
	
	@RequestMapping(value="setHeadpic", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes setHeadpic(Account o){
		AjaxRes ar=getAjaxRes();
		try {
			service.setHeadpic(o);
			ar.setSucceedMsg(Const.UPDATE_SUCCEED);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.UPDATE_FAIL);
		}
		return ar;
	}
	
	@RequestMapping(value="setPerData", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes setPerData(Account o){
		AjaxRes ar = getAjaxRes();
		try { 
			service.setPerData(o);
			ar.setSucceedMsg(Const.UPDATE_SUCCEED);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.UPDATE_FAIL);
		}
		return ar;
	}
	
	/**
	 * 用户名重复检测
	 */
	@RequestMapping(value="checkName", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes checkName(HttpServletRequest request,Account account){
		AjaxRes ar = getAjaxRes();
		int res = service.checkName(account);
		if(res != 0){
			ar.setFailMsg("* 用户名已注册,请更换其他用户名");
		}else{
			ar.setSucceedMsg("");
		}
		return ar;
	}
	
	/**
	 * 用户注册
	 */
	@RequestMapping(value="register")
	public String register(HttpServletRequest request,Account account){
		return "system/login/register";
	}
	
	/**
	 * 添加
	 * @param o
	 * @return
	 */
	@RequestMapping(value="addAcount", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes addAcount(Account o){
		AjaxRes ar = getAjaxRes();
		try {
			o.setAccountId(get32UUID());	
			int res = service.insertAccount(o);
			if(res == 1){
				ar.setSucceedMsg(Const.SAVE_SUCCEED);
			}else{
				ar.setFailMsg("登录名已存在");	
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.SAVE_FAIL);
		}
		return ar;
	}
	
	/**
	 *邮箱验证
	 */
	@RequestMapping(value="checkEmail")
	@ResponseBody
	public AjaxRes checkEmail(HttpServletRequest request,Account account){
		AjaxRes ar = getAjaxRes();
		int res = service.checkEmail(account.getEmail());//判断邮箱是否为注册邮箱
		if(res == 0){
			ar.setFailMsg("无此用户");
		}else{
			ar.setSucceedMsg("success");
		}
		return ar;
	}
	
	/**
	 * 修改密码 step1
	 */
	@RequestMapping(value="step1")
	public String step1(HttpServletRequest request,Account account){
		return "system/login/forgot1";
	}
	
	/**
	 * 修改密码 step2
	 */
	@RequestMapping(value="step2")
	public String step2(HttpServletRequest request,Account account,Model model){
		account = service.getAccount(account.getEmail());//根据邮箱得到用户信息
		model.addAttribute("account",account);
		return "system/login/forgot2";
	}
	
	/**
	 * 旧密码校验  
	 */
	@RequestMapping(value="checkOldPwd")
	@ResponseBody
	public AjaxRes checkOldPwd(HttpServletRequest request){
		AjaxRes ar = getAjaxRes();
		String pwd0 = request.getParameter("lPwd0");
		String pwd1 = request.getParameter("lPwd1");
		Account account = AccountShiroUtil.getCurrentUser();
		if(MD5.md5(pwd0).equals(account.getPassword())){
			account.setPassword(pwd1);
			resertPwd(account);
			ar.setSucceedMsg("密码修改成功!");
		}else{
			ar.setFailMsg("密码输入不正确");
		}
		return ar;
	}
	
	/**
	 * 密码重置
	 */
	@RequestMapping(value="resertPwd", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes resertPwd(Account o){
		AjaxRes ar = getAjaxRes();
		o.setPassword(o.getPassword());
		service.sysResetPwd(o);
		ar.setSucceedMsg("success");
		return ar;
	}
	
	/**
	 * 密码重置
	 */
	@RequestMapping(value="accountModify", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes accountModify(@RequestParam(value = "picUrl", required = false) MultipartFile picUrl){
		Account account = AccountShiroUtil.getCurrentUser();
		String filePath = "c:\\fudanImage\\account\\" + account.getLoginName();
		String fileName = "";
		//单张照片上传
		if(picUrl != null && !picUrl.isEmpty()){
			FileUpload.fileUp(picUrl, filePath, picUrl.getOriginalFilename().substring(0, picUrl.getOriginalFilename().lastIndexOf(".")));
			fileName = picUrl.getOriginalFilename();
		}
		AjaxRes ar = getAjaxRes();
		account.setPicUrl(fileName);
		service.update(account);
		ar.setSucceedMsg("success");
		return ar;
	}
	
	/**
	 * 根据职务获取获取账号信息
	 * @param positionId
	 * @return
	 */
	@RequestMapping("/listby")
	@ResponseBody
	public List<Account> listBy(String positionId) {
		List<Account> accounts = service.getBy(positionId);
		return accounts;
	}
	
	@RequestMapping("/tajax")
	@ResponseBody
	public AjaxRes tajax(HttpServletResponse response) throws IOException{
		AjaxRes ar = getAjaxRes();
		ar.setSucceedMsg("success" + new Timestamp(System.currentTimeMillis()));
		return ar;
	}
	
}
