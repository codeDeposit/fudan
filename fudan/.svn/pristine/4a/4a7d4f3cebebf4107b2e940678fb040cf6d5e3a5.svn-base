package com.jy.service.system.org;

import java.util.List;
import com.jy.common.utils.tree.entity.ZNodes;
import com.jy.entity.system.org.Org;
import com.jy.service.base.BaseService;

public interface OrgService extends BaseService<Org>{

	/**
	 * 获取机构树
	 * @return
	 */
	public List<ZNodes> getOrgTree();
	/**
     * 获取上级机构树
     * @return
     */
	public List<ZNodes> getPreOrgTree();
	 /**
     * 权限列表包含按钮
     * @param orgId 组织Id
     * @param layer 显示层级
     * @return
     */
	public List<ZNodes> listAuthorized(String orgId,String layer);
	 /**
     * 根据角色Id保存权限列表
     * @param orgId 组织Id
     * @param auss 权限数组
     * @param layer 显示层级
     * @return
     */
	public void saveAuthorized(String orgId,String auss,String layer);
	/**
	 * 删除机构
	 * @return
	 */
	public int delOrg(Org o);
	
	/**
	 * 获取本公司的所有部门
	 * @return
	 */
	public List<Org> getAll();
	
	/**
	 * 获取所有部门
	 */
	public List<Org> selectAll();
	
	/**
	 * 获取所有基础部门
	 */
	public List<Org> selectBaseBranch();
	
	/**
	 * 获取所有部门除去基础部门
	 */
	public List<Org> selectBranch();
	
	/**
	 * 查询id为orgId的部门及其子部门
	 * @param orgId
	 * @return
	 */
	public List<Org> getBy(String orgId);
	
	/**
	 * 查询用户所在的组织
	 * @param accountId
	 * @return
	 */
	public String findBy(String accountId);
	
	public List<Org> getOrgEmployee(String orgId);
	
}