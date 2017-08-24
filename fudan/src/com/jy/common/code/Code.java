package com.jy.common.code;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

public class Code {
	
	public static String url = "http://gw.api.taobao.com/router/rest";
	public String appkey = "23973431";
	public String secret = "a811e121c4b9816113ad0d78da8457c2";
	public String product = "掌上医苑";//签名名称
	public String templateCode = "SMS_13765654";//模板名称
	
	/*
	 * 短信验证码生成,4位整数
	 */
	public String msgCode(){
		String code = "";
		for(int i=0;i<4;i++){	
			int q = (int)(1+Math.random()*9);
			code += q;
		}
		return code;
	}
	
	/*
	 * 验证码发送
	 */
	public String sendMsg(String phone,String code) throws ApiException{
		TaobaoClient client = new DefaultTaobaoClient(url,appkey,secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setSmsParamString("{\"number\":\""+ code +"\",\"message\":\"掌上医苑注册验证\",\"product\":\""+ product +"\"}");
		req.setSmsType("normal");
		req.setSmsFreeSignName(product);
		req.setRecNum(phone);
		req.setSmsTemplateCode(templateCode);
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		return rsp.getBody();
	}
	
	public String getAppkey() {
		return appkey;
	}
	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getTemplateCode() {
		return templateCode;
	}
	public void setTemplateCode(String templateCode) {
		this.templateCode = templateCode;
	}
	
}
