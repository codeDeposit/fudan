package com.jy.service.system.account;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jy.common.utils.base.MD5;
import com.jy.common.utils.security.AccountShiroUtil;
import com.jy.common.utils.tree.entity.ZNodes;
import com.jy.entity.system.account.Account;
import com.jy.repository.system.account.AccountDao;
import com.jy.repository.system.org.PositionDao;
import com.jy.service.base.BaseServiceImp;
import com.jy.service.system.org.OrgService;
import com.jy.service.system.org.RoleService;


@Service("AccountService")
public class AccountServiceImp extends BaseServiceImp<Account> implements AccountService {

	@Autowired
	private AccountDao accountDao;
	@Autowired
	private PositionDao positionDao;
	@Autowired
	public OrgService orgService;
	@Autowired
	public RoleService roleService;
	
	@Override
    public Account findFormatByLoginName(String loginName){
		Account a = null;
		try {
			a= accountDao.findFormatByLoginName(loginName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	@Transactional
	public void setSetting(String skin){
		Account currentAccount=AccountShiroUtil.getCurrentUser();	
		currentAccount.setSkin(skin);
		accountDao.setSetting(currentAccount);
		AccountShiroUtil.getRealCurrentUser().setSkin(skin);
	}
 
	public Account getPerData(){
		Account pd=accountDao.getPerData(AccountShiroUtil.getCurrentUser().getAccountId());
		return pd;	 
	}
	 
	public void setPerData(Account account){
		 Account cu =AccountShiroUtil.getRealCurrentUser();
		 account.setAccountId(cu.getAccountId());
		 account.setUpdateTime((new Date()));
		 accountDao.setPerData(account);
		 cu.setName(account.getName());
		 cu.setEmail(account.getEmail());
	}
	
	public void setHeadpic (Account account){
		 Account cu =AccountShiroUtil.getRealCurrentUser();
		 account.setAccountId(cu.getAccountId());
		 account.setUpdateTime((new Date()));
		 accountDao.setHeadpic(account);
		 cu.setPicUrl(account.getPicUrl());
	}

	@Override
	public int insertAccount(Account o) throws Exception {
		int res = 0;
		String loginName = o.getLoginName();
		//查询数据库是否已经存在用户名
		if(StringUtils.isNotBlank(loginName) && (accountDao.findCountByLoginName(loginName) == 0)){
			if(o.getPassword() == null){
                o.setPassword("123456");
            }
			String pwrsMD5 = MD5.md5(o.getPassword());//md5加密，
			o.setPassword(pwrsMD5);
			o.setCreateTime(new Date());
			accountDao.insert(o);	
			res = 1;//数据插入成功
		}
		return res;
	}
	
	@Override
	public List<ZNodes> getRoles() {
		return accountDao.getRoles();
	}

	@Override
	public int sysResetPwd(Account o) {
		int res = 0;
		String pwd = o.getPassword();
		o.setUpdateTime(new Date());
		String accountId = o.getAccountId();
		if(StringUtils.isNotBlank(pwd) && StringUtils.isNotBlank(accountId)){
			Account odata = accountDao.find(o).get(0);
			String loginName = odata.getLoginName();
			String pwrsMD5 = MD5.md5(pwd);		
			o.setPassword(pwrsMD5);	
			accountDao.resetPwd(o);
			res = 1;
		}else{
			res = 2;
		}
		return res;
	}

	@Override
	@Transactional
	public void deleteAccount(Account o) {
		//事务删除
		accountDao.delete(o);
		//删除人员职务关系表
		positionDao.deleteAccPosByAccId(o.getAccountId());	
	}

	@Override	
	@Transactional
	public void deleteBatchAccount(String chks) {
		//事务删除	
		if(StringUtils.isNotBlank(chks)){
			String[] chk =chks.split(",");
			List<Account> list=new ArrayList<Account>();
			for(String s:chk){
				Account sd=new Account();
				sd.setAccountId(s);
				list.add(sd);
			}
			accountDao.deleteBatch(list);
			positionDao.deleteBatchAccPosByAccId(list);
		}
	
	}

	@Override
	public int checkName(Account account) {
		return accountDao.checkName(account);
	}

	@Override
	public Account getAccount(String email) {
		return accountDao.getAccount(email);
	}

	@Override
	public int checkEmail(String email) {
		return accountDao.checkEmail(email);
	}

	@Override
	public Account accountInfo(Account account) {
		return accountDao.accountInfo(account);
	}

	@Override
	public List<Account> getBy(String positionId) {
		return accountDao.selectBy(positionId);
	}
	
}
