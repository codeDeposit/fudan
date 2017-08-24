package com.jy.service.app;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.AppAddress;
import com.jy.repository.app.AppAddressDao;

@Service(value = "appAddressService")
public class AppAddressService{
	
	@Resource
	private AppAddressDao appAddressDao;
	
	public List<AppAddress> find(AppAddress appAddress) {
		return this.appAddressDao.find(appAddress);
	}

	public List<AppAddress> search(AppAddress appAddress) {
		return this.appAddressDao.search(appAddress);
	}
	
	public int insert(AppAddress appAddress) {
		//是否为第一条数据,第一条数据设定为默认地址
		AppAddress appAddress2 = new AppAddress();
		appAddress2.setMember_id(appAddress2.getMember_id());
		List<AppAddress> list = this.find(appAddress2);
		if(list.size() == 0){
			appAddress.setIs_default(1);
		}
		return this.appAddressDao.insert(appAddress);
	}
	
	/**
	 * 默认地址设置
	 * @param appAddress
	 * @return
	 */
	public int addressDefault(AppAddress appAddress) {
		//清除默认地址
		AppAddress appAddress2 = new AppAddress();
		appAddress2.setMember_id(appAddress.getMember_id());
		appAddress2.setIs_default(0);
		this.appAddressDao.update(appAddress2);
		appAddress.setMember_id(0);
		return this.appAddressDao.update(appAddress);
	}
	
	public int update(AppAddress appAddress) {
		return this.appAddressDao.update(appAddress);
	}
	
	public int delete(AppAddress appAddress) {
		return this.appAddressDao.delete(appAddress);
	}
	
}
