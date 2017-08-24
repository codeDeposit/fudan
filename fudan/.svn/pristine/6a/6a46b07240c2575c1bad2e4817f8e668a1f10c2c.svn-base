package com.jy.controller.system.tool;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.ajax.AjaxRes;
import com.jy.common.mybatis.Page;
import com.jy.common.utils.base.Const;
import com.jy.common.utils.email.MailConfig;
import com.jy.common.utils.email.MailUtil;
import com.jy.controller.base.BaseController;
import com.jy.entity.system.tool.Email;
import com.jy.service.system.tool.EmailService;

@Controller
@RequestMapping("/backstage/tool/email/")
public class EmailController extends BaseController<Email>{

	@Autowired
	private EmailService service;
	
	@RequestMapping("index")	
	public String index(Model model) throws UnsupportedEncodingException{
		if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
			return "/system/tool/email/list";
		}
		return Const.NO_AUTHORIZED_URL;
	}
	
	
	@RequestMapping(value="findByPage", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes findByPage(Page<Email> page,Email o){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/tool/email/index"))){
			try {
				Page<Email> em=service.findByPage(o, page);
				Map<String, Object> p=new HashMap<String, Object>();
				p.put("permitBtn",getPermitBtn(Const.RESOURCES_TYPE_BUTTON));
				p.put("list",em);		
				ar.setSucceed(p);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}	
		return ar;
	}

	@RequestMapping(value="sendMail", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes sendMail(Email o){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/tool/email/index"))){
			try {
				o.setId(get32UUID());
				boolean res=service.sentEmailSimple(o);
				if(res){
					ar.setSucceedMsg("发送成功");
				}
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg("发送失败");
			}
		}	
		return ar;
	}
			
	@RequestMapping(value="getConfig", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes getConfig(){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/tool/email/index"))){
			try {
				MailConfig mc=MailUtil.setConfig(Const.EMAIL_CONFIG);
				ar.setSucceed(mc);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}	
		return ar;
	}	
	
	/**
	 * 邮箱验证码发送
	 */
	@RequestMapping(value="sendCode")
	@ResponseBody
	public AjaxRes sendCode(String email) throws Exception {
		randomController random = new randomController();
		AjaxRes ar = getAjaxRes();
		String code = random.random();
		String emailServer = "smtp.163.com";
		String sendUser = "15083411305@163.com";//发件人
		String receiveUser = email;//收件人
		String emailTitle = "上海复单协同办公系统";//邮件标题
		String emailText = "修改密码邮箱验证,验证码：" + code;//邮件内容
		String emailType = "text/html;charset=UTF-8";//文本格式
		Properties prop = new Properties();
        prop.setProperty("mail.host", emailServer);//邮箱服务地址
        prop.setProperty("mail.transport.protocol", "smtp");//服务器类型
        prop.setProperty("mail.smtp.auth", "true");
        //使用JavaMail发送邮件的5个步骤
        Session session = Session.getInstance(prop); //1、创建session
        session.setDebug(true); //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
        Transport ts = session.getTransport(); //2、通过session得到transport对象
        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
        ts.connect(emailServer, "15083411305", "wy123456");//依次输入服务器地址,邮箱登录名,邮箱客户端授权码 
        //4、创建邮件
        MimeMessage message = new MimeMessage(session); //创建邮件对象
        message.setFrom(new InternetAddress(sendUser));//指明发件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveUser));//收件人
        message.setSubject(emailTitle);//邮件的标题
        message.setContent(emailText,emailType); //邮件的文本内容
        ts.sendMessage(message, message.getAllRecipients()); //5、发送邮件
        ts.close();
        ar.setSucceedMsg(code);
		return ar;
	}	
	
}
