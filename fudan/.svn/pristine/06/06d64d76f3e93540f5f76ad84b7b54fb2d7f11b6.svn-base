package com.jy.service.app;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.common.code.Code;
import com.jy.common.utils.DateUnix;
import com.jy.entity.app.AppCode;
import com.jy.repository.app.AppCodeDao;
import com.taobao.api.ApiException;

@Service(value = "appCodeService")
public class AppCodeService{
	
	@Resource
	private AppCodeDao appCodeDao;
	
	
	/**
	 * 获取注册验证码,验证码存储
	 * @param phone
	 * @return
	 * @throws ApiException
	 */
	public String getCode(String phone) throws ApiException{
		AppCode appCode = new AppCode();
		DateUnix dateUnix = new DateUnix();
		Code code = new Code();
		String codeStr = code.msgCode();
		appCode.setCode(codeStr);
		appCode.setSend_code_time(dateUnix.dateUnix());
		appCode.setPhone(phone);
		String msg = code.sendMsg(phone,codeStr);
System.out.println("短信发送状态：" + msg);
		int result = appCodeDao.insert(appCode);
		if(result == 1){
			return codeStr;
		}else{
			return "";
		}
	}
	
}
