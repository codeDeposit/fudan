package com.jy.service.system.org;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jy.common.mybatis.Page;
import com.jy.common.utils.tree.entity.ZNodes;
import com.jy.entity.system.account.Account;
import com.jy.entity.system.org.Org;
import com.jy.entity.system.org.Role;
import com.jy.entity.system.resources.RoleResources;
import com.jy.repository.system.account.AccountDao;
import com.jy.repository.system.org.OrgDao;
import com.jy.repository.system.org.RoleDao;
import com.jy.service.base.BaseServiceImp;

@Service("RoleService")
public class RoleServiceImp extends BaseServiceImp<Role> implements RoleService{
	
	@Autowired
	private RoleDao roleDao; 
	@Autowired
	private OrgDao orgDao; 
	@Autowired
	private AccountDao accountDao;
	
	@Override
	public List<ZNodes> listAuthorized(String roleId,String layer) {
		return roleDao.listAuthorized(roleId,layer);
	}

	@Override
	@Transactional
	public void saveAuthorized(String roleId, String aus,String layer) {
		List<RoleResources> roleAuth=new ArrayList<RoleResources>();
		String[] auss=aus.split(",");
		for(String s:auss){
			if(StringUtils.isNotBlank(s))
				roleAuth.add(new RoleResources(roleId,s));
		}
		roleDao.delAuthorizedByRoleIdAndLayer(roleId, layer);
		if(roleAuth.size()>0)roleDao.insertAuthorizedByRoleId(roleAuth);
	}

	@Override
	@Transactional
	public void delete(Role o) {	
		//进行事务删除，删除角色还删除角色资源关系表
		roleDao.delete(o);
		roleDao.delAuthorizedByRoleId(o.getId());
	}

	@Override
	@Transactional
	public void deleteBatch(List<Role> os){
		//进行事务删除，删除角色还删除角色资源关系表
		roleDao.deleteBatch(os);
		roleDao.deleteBatchAuthorizedByRoleId(os);
	}

	@Override
	public Page<Role> findAllRoleByPage(Role o, Page<Role> page) {
		String orgId=o.getOrgId();
		StringBuffer orgIds=new StringBuffer();
		List<Org> orgs=orgDao.findAllOrg(orgId);
		//设置父和子组织id
		orgIds.append("'"+orgId+"'"+",");
		dealOrg(orgs,orgIds);
		orgIds.deleteCharAt(orgIds.length()-1);
		o.setAllOrgIds(orgIds.toString());
		
		List<Role> roles=roleDao.findAllRoleByPage(o,page);
		page.setResults(roles);
		return page;
	}

	private void dealOrg(List<Org> orgChilds,StringBuffer orgIds){
		//递归处理所有机构
		for(Org orgChild:orgChilds){
			List<Org> orgs=orgChild.getOrgs();			
			for(Org o:orgs){orgIds.append("'"+o.getId()+"'"+",");}		
			//递归
			dealOrg(orgs,orgIds);
		}		
	}

	public Org getOrgBy(String roleId) {
		String orgId = roleDao.selectOrgIdBy(roleId);
		Org org = orgDao.selectBy(orgId);
		return org;
	}
	
	/**
	 * 根据用户id获取对应所有角色
	 */
	public Role getAccountRole(String id) {
		Account o = new Account();								
		o.setAccountId(id);
		return getRole(accountDao.find(o).get(0).getRoleId());
	}

	/**
	 * 根据用户id得到角色对象
	 */
	public Org getAccountOrg (String id) {
		Account account = new Account();
		account.setAccountId(id);
		String roleId = accountDao.find(account).get(0).getRoleId();
		return getOrg(roleId);
	}
	
	/**
	 * 根据角色id得到角色对象
	 */
	public Role getRole(String id){
		return roleDao.getRole(id);
	}
	
	/**
	 * 根据角色id得到组织对象
	 */
	public Org getOrg(String id){
		return orgDao.getOrg(this.getRole(id).getOrgId());
	}
	
	/**
	 * 根据组织id得到组织对象
	 */
	public Org getOrgObject(String id){
		return orgDao.getOrg(id);
	}
	
	/**
	 * 根据组织id得到角色对象
	 */
	public List<Role> selectRoleAll(String orgId){
		List<Role> list = roleDao.selectRoleAll(orgId);
		return list;
	}

}
