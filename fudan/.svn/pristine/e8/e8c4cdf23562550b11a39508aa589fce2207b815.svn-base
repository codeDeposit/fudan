package com.jy.service.app.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import com.jy.common.utils.base.Tools;
import com.jy.entity.app.admin.Account;
import com.jy.repository.app.admin.AppAccountDao;

@Service(value = "appAccountService")
public class AppAccountService{
	
	@Resource
	private AppAccountDao appAccountDao;
	
	public int insert(Account account) {
		//用户名
		account.setName("用户");
		//默认头像插入
		account.setAvatar("default.png");
		//健康号
		int number = Tools.getRandomNum();
		account.setNumber(number);
		return this.appAccountDao.insert(account);
	}
	
	/**
	 * 用户登录记录
	 * @param account
	 * @return
	 */
	public int AppLoginPour(Account account) {
		account = appAccountDao.find(account).get(0);
		Account account2 = new Account();
		account2.setLogin_num((account.getLogin_num() + 1));
		account2.setId(account.getId());
		return this.appAccountDao.update(account2);
	}
	
	public List<Account> find(Account account) {
		List<Account> list = appAccountDao.find(account);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/account/";
		for(int i=0;i<list.size();i++){
			//头像取出
			if(list.get(i).getAvatar().equals("default.png")){//默认头像
				list.get(i).setAvatar(imgUrl + list.get(i).getAvatar());
			}else{
				list.get(i).setAvatar(imgUrl + list.get(i).getId() + "/" + list.get(i).getAvatar());
			}
			
			
		}
		return list;
	}

	public List<Account> search(Account account) {
		return this.appAccountDao.search(account);
	}

	public int update(Account account) {
		return this.appAccountDao.update(account);
	}

	public int update2(Account account) {
		return this.appAccountDao.update2(account);
	}
	
	public int delete(Account account) {
		return this.appAccountDao.delete(account);
	}
	
}
