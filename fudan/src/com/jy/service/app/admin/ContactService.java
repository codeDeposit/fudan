package com.jy.service.app.admin;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jy.entity.app.admin.Contact;
import com.jy.repository.app.admin.ContactDao;

@Service(value = "contactService")
public class ContactService{
	
	@Resource
	private ContactDao contactDao;
	
	public int insert(Contact contact) {
		return this.contactDao.insert(contact);
	}
	
	public List<Contact> find(Contact contact) {
		return this.contactDao.find(contact);
	}

	public List<Contact> search(Contact contact) {
		return this.contactDao.search(contact);
	}

	public int update(Contact contact) {
		String mark = contact.getMark();
		if(mark != null){
			if(mark.equals("msg")){
				contact.setMsg_state(contact.getState());
			}else if(mark.equals("phone")){
				contact.setPhone_state(contact.getState());
			}else if(mark.equals("email")){
				contact.setEmail_state(contact.getState());
			}else if(mark.equals("weixin")){
				contact.setWeixin_state(contact.getState());
			}else if(mark.equals("urls")){
				contact.setUrls_state(contact.getState());
			}else if(mark.equals("company")){
				contact.setCompany_state(contact.getState());
			}
		}
		return this.contactDao.update(contact);
	}
	
	public int delete(Contact contact) {
		return this.contactDao.delete(contact);
	}
	
}
