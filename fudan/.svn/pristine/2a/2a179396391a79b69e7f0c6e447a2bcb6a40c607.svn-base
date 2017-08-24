package com.jy.service.system.org;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jy.common.utils.tree.entity.ZNodes;
import com.jy.entity.system.account.Account;
import com.jy.entity.system.org.Org;
import com.jy.entity.system.org.Position;
import com.jy.entity.system.org.Role;
import com.jy.entity.system.resources.OrgResources;
import com.jy.entity.system.resources.RoleResources;
import com.jy.repository.system.account.AccountDao;
import com.jy.repository.system.org.OrgDao;
import com.jy.repository.system.org.PositionDao;
import com.jy.service.base.BaseServiceImp;

@Service("OrgService")
public class OrgServiceImp extends BaseServiceImp<Org> implements OrgService{

	@Autowired
	private PositionDao positionDao;
	@Autowired
	private AccountDao accountDao;
	
	@Override
	@Transactional
	public int delOrg(Org o) {
		int res=0;
		//进行事务删除，删除组织还删除组织资源关系表
		OrgDao dao = (OrgDao)baseDao;
		String oId = o.getId();
		//得到组织isvalid，是否为锁死状态
		int isValid = dao.selectBy(oId).getIsValid();
		if(isValid != 2){
			List<String> orgIds=new ArrayList<String>();
			List<String> roleIds=new ArrayList<String>();
			List<Org> findOrgChilds=dao.findAndChild(oId);
			dealOrg(findOrgChilds,orgIds,roleIds);
			if(orgIds.size()==0&&roleIds.size()==0){//这样做是怕误操作
				dao.delete(o);
				dao.delAuthorizedByOrgId(oId);
				//删除其下职务
				//先查找组织其下职务，然后删除
				List<Position> poss=positionDao.findByOrgId(oId);
				if(poss!=null&&poss.size()>0){
					positionDao.deleteBatch(poss);
					positionDao.deleteBatchAccPosByPosId(poss);
				}
				res=1;
			}else{
				res=2;//旗下还有组织和角色
			}
		}else{
			res = 3;//当前组织状态为锁死，为系统默认无法删除
		}
		return res;
	}

	@Override
	public List<ZNodes> getOrgTree() {
		return ((OrgDao)baseDao).getOrgTree();
	}

	@Override
	public List<ZNodes> getPreOrgTree() {
		return ((OrgDao)baseDao).getPreOrgTree();
	}

	@Override
	public List<ZNodes> listAuthorized(String orgId,String layer) {
		OrgDao rd=(OrgDao)baseDao;
		List<ZNodes> list=new ArrayList<ZNodes>();
		Org dataOrg=rd.getOrg(orgId);
		String pId=dataOrg.getpId();
		if(StringUtils.equals("0",pId)){
			//第一机构可获取所有权限
			list=rd.listAuthorized(orgId,layer);
		}else{
			//其他机构要通过上级机构门限获取权限
			list=rd.listAuthorizedByTh(pId,orgId,layer);
		}	
		return list;
	}

	@Override
	@Transactional
	public void saveAuthorized(String orgId, String aus,String layer) {
		List<String> authIds = new ArrayList<String>();
		List<OrgResources> orgAuth = new ArrayList<OrgResources>();
		String[] auss = aus.split(",");//菜单字符数组
		for(String s:auss){
			if(StringUtils.isNotBlank(s)){//判断某字符串是否不为空且长度不为0且不由空白符(whitespace)构成
				orgAuth.add(new OrgResources(orgId,s));//存入组织id，菜单id
				authIds.add(s);
			}
		} 
		OrgDao dao = (OrgDao)baseDao;	
		//处理旗下机构和其子机构
		List<Org> findOrgChilds = dao.findAndChild(orgId);
		List<String> orgIds = new ArrayList<String>();
		List<String> roleIds = new ArrayList<String>();
		List<OrgResources> ors = new ArrayList<OrgResources>();
		List<RoleResources> rrs = new ArrayList<RoleResources>();
		dealOrg(findOrgChilds,orgIds,roleIds);
		if(orgAuth.size()>0){
			List<String> notAuths=dao.getNotAuthoByOrg(orgId,authIds,layer);
			if(notAuths.size()>0){		
				for(String nAuth:notAuths){
					for(String oId:orgIds){
						ors.add(new OrgResources(oId,nAuth));
					}
					for(String rId:roleIds){
						rrs.add(new RoleResources(rId,nAuth));
					}
				}
				//批量删除机构权限
				if(ors.size()>0)dao.delBatchAuthByOrg(ors);
				//批量删除角色权限
				if(rrs.size()>0)dao.delBatchAuthByRole(rrs);
			}
		}	
		//处理机构，先根据机构Id删除机构权限再重新插入机构权限，优化速度
		dao.delAuthorizedByOrgIdAndLayer(orgId,layer);
		if(orgAuth.size()>0)dao.insertAuthorizedByOrgId(orgAuth);	
	}
	
	private void dealOrg(List<Org> orgChilds,List<String> orgIds,List<String> roleIds){
		//递归处理机构和角色
		for(Org orgChild:orgChilds){
			List<Org> orgs=orgChild.getOrgs();
			List<Role> roles=orgChild.getRoles();
			for(Org o:orgs){
				orgIds.add(o.getId());
			}
			for(Role r:roles){
				roleIds.add(r.getId());
			}
			//递归
			dealOrg(orgs,orgIds,roleIds);
		}
	}

	// 获取本公司的所有部门
	@Override
	public List<Org> getAll() {
		OrgDao dao = (OrgDao)baseDao;
		List<Org> orgs = dao.selectAllOrg();
		//递归获取所有组织
		List<Org> allorg = new ArrayList<Org>();
		List<Org> allOrgs = digui(orgs, allorg);
		return allOrgs;
	}
	
	private List<Org> digui(List<Org> orgs, List<Org> allorg) {
		OrgDao dao = (OrgDao)baseDao;
		allorg.addAll(orgs);
		for(Org org: orgs) {
			List<Org> list = dao.selectBaseBranch(org);
			if(list == null || list.size() == 0) continue;
			digui(list, allorg);
		}
		return allorg;
	}

	/**
	 * 获取所有部门
	 */
	public List<Org> selectAll(){
		OrgDao dao = (OrgDao)baseDao;
		List<Org> list = dao.selectAll(); 	
		return list;
	}
	
	/**
	 * 获取所有基础部门
	 */
	public List<Org> selectBaseBranch(){
		OrgDao dao = (OrgDao)baseDao;
		List<Org> listAll = this.selectAll();
		List<Org> listChild = new ArrayList<Org>();
		for(int i=0;i<listAll.size();i++){
			Org org = listAll.get(i);
			List<Org> listResult = dao.selectBaseBranch(org); 	
			if(listResult.size() == 0){
				listChild.add(org);
			}
		}
		return listChild;
	}

	/**
	 * 获取所有部门除去基础部门
	 */
	public List<Org> selectBranch(){
		OrgDao dao = (OrgDao)baseDao;
		List<Org> listAll = this.selectAll();
		List<Org> listChild = new ArrayList<Org>();
		for(int i=0;i<listAll.size();i++){
			Org org = listAll.get(i);
			List<Org> listResult = dao.selectBaseBranch(org); 	
			if(listResult.size() != 0){
				listChild.add(org);
			}
		}
		return listChild;
	}

	/**
	 * 查询id为orgId的部门及其子部门
	 * @param orgId
	 * @return
	 */
	@Override
	public List<Org> getBy(String orgId) {
		OrgDao dao = (OrgDao)baseDao;
		List<Org> orgs = dao.selectDetails(orgId);
		return orgs;
	}

	/**
	 * 查询用户所在的组织
	 */
	@Override
	public String findBy(String accountId) {
		OrgDao dao = (OrgDao)baseDao;
		String orgId = dao.selectByAccountId(accountId);
		return orgId;
	}
	
	/**
	 * 获取所有部门下的所有职务下的所有用户
	 */
	public List<Org> getOrgEmployee(String orgId){
		List<Org> list = new ArrayList<Org>();
		OrgDao dao = (OrgDao)baseDao;
		List<ZNodes> orgList = dao.getOrgTree();//得到所有部门
		for(ZNodes zNodes:orgList){
			Org org = new Org();
			org.setOrgName(zNodes.getName());//部门名称
			List<Position> positionList = new ArrayList<Position>();
			positionList = positionDao.findByOrgId(zNodes.getId());//获取对应部门下的所有职务
			for(Position position:positionList){
				List<Account> accountList = new ArrayList<Account>();
				accountList = accountDao.selectBy(position.getId());//获取对应部门下的对应职务的所有用户
				position.setAccountList(accountList);//职务下的所有用户
			}
			org.setPositionList(positionList);//所有职务
			list.add(org);
		}
		return list;
	}
	
}
