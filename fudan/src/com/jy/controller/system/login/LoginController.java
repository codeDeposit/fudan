package com.jy.controller.system.login;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jy.common.utils.IPUtil;
import com.jy.common.utils.base.Const;
import com.jy.common.utils.security.AccountShiroUtil;
import com.jy.common.utils.webpage.PageData;
import com.jy.controller.base.BaseController;
import com.jy.entity.setting.WebSite;
import com.jy.entity.system.account.Account;
import com.jy.entity.system.log.LoginLog;
import com.jy.service.system.account.AccountService;
import com.jy.service.system.log.LoginLogService;


@Controller
public class LoginController extends BaseController<Object>{
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private LoginLogService loginLogService;
	
	/*
	 * 访问登录页
	 */
	@RequestMapping(value="/loginIndex")
	public ModelAndView toLogin(Model model)throws Exception{
		ModelAndView mv =  new ModelAndView();
		mv.setViewName("system/login/login");
		return mv;
	}
	
	/*
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/system_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> login()throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").split(",jy,");
		if(null != KEYDATA && KEYDATA.length == 2){
			Subject currentUser = SecurityUtils.getSubject();//shiro管理的session
			String username = KEYDATA[0];
			String password  = KEYDATA[1];	
			if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
				errInfo = "nullup";	//缺少用户名或密码
			}else{
				Account account = new Account();
				account.setLoginName(username);
				int res = accountService.checkName(account);
				if(res == 0){
					errInfo = "usererror";// 用户名或密码有误
				}else{
					account = accountService.find(account).get(0);
					if(!password.equals(account.getPassword())){
						errInfo = "usererror"; // 密码错误
					}else{
						UsernamePasswordToken token = new UsernamePasswordToken(username, password);
						token.setRememberMe(true);
						currentUser.login(token);
						errInfo = "success"; //登陆成功
						//记录登录日志
						String accountId = AccountShiroUtil.getCurrentUser().getAccountId();
						String loginIP = IPUtil.getIpAddr(getRequest());//获取用户登录IP
						LoginLog loginLog = new LoginLog(accountId,loginIP);
						loginLogService.saveLoginLog(loginLog);
					}
				}
			}
		}else{
			errInfo = "error";	//缺少参数
		}	
		map.put("result", errInfo);
		return map;
	}	
	
	/*
     * 帐号注销
     */
    @RequestMapping("/system_logout")
    public String logout(HttpServletRequest request,HttpSession session,Model model) {
        Subject currentUser = SecurityUtils.getSubject();
        currentUser.logout();
        session = request.getSession(true);
        session.removeAttribute(Const.SESSION_USER);
		session.removeAttribute(Const.SESSION_MENULIST);
		session.removeAttribute("name");
		session.removeAttribute("loginName");
		session.removeAttribute("picUrl");
		session.removeAttribute("orgName");
        return "system/login/login";
    }
    
}
