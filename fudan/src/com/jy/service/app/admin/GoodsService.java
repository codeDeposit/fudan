package com.jy.service.app.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jy.common.utils.DateUtil;
import com.jy.common.utils.base.Tools;
import com.jy.entity.app.admin.Class;
import com.jy.entity.app.admin.Factory;
import com.jy.entity.app.admin.Goods;
import com.jy.entity.app.admin.GoodsCommon;
import com.jy.entity.app.admin.GoodsImg;
import com.jy.entity.app.admin.Mall;
import com.jy.entity.app.admin.MallImg;
import com.jy.entity.app.admin.Pill;
import com.jy.entity.app.admin.Storage;
import com.jy.entity.app.admin.Supplier;
import com.jy.entity.app.admin.Term;
import com.jy.entity.app.admin.Unit;
import com.jy.repository.app.admin.BrandDao;
import com.jy.repository.app.admin.ClassDao;
import com.jy.repository.app.admin.FactoryDao;
import com.jy.repository.app.admin.GoodsCommonDao;
import com.jy.repository.app.admin.GoodsDao;
import com.jy.repository.app.admin.GoodsImgDao;
import com.jy.repository.app.admin.MallDao;
import com.jy.repository.app.admin.MallImgDao;
import com.jy.repository.app.admin.PillDao;
import com.jy.repository.app.admin.StorageDao;
import com.jy.repository.app.admin.SupplierDao;
import com.jy.repository.app.admin.TermDao;
import com.jy.repository.app.admin.UnitDao;

@Service(value = "goodsService")
public class GoodsService{
	
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private GoodsImgDao goodsImgDao;
	@Resource
	private GoodsCommonDao goodsCommonDao;
	@Resource
	private BrandDao brandDao;
	@Resource
	private ClassDao goodsClassDao;
	@Resource
	private MallDao mallDao;
	@Resource
	private MallImgDao mallImgDao;
	@Resource
	private FactoryDao factoryDao;
	@Resource
	private PillDao pillDao;
	@Resource
	private UnitDao unitDao;
	@Resource
	private StorageDao storageDao;
	@Resource
	private TermDao termDao;
	@Resource
	private SupplierDao supplierDao;
	
	/**
	 * 商品入库
	 * @return
	 */
	public int storageIn(Storage storage){
		//库存单号生成
		String number = DateUtil.getDateString() + Tools.getRandomNum();
		storage.setNumbers("RKD-" + number);
		
		//商品总价计算
		storage.setTotal_price(storage.getGoods_price()*storage.getGoods_storage());
		
		//商品数量
		storage.setCounts(storage.getGoods_storage());
		
		storageDao.insert(storage);
		//商品库存表更新
		Goods goods = new Goods();
		goods.setGoods_id(storage.getGoods_id());
		goods.setStorage_id(storage.getId());
		goods.setStorage_state(1);//1入库2未入库
		int res = goodsDao.update(goods);
		return res;
	}
	
	/**
	 * 商品入库/未入库数据统计
	 */
	public Map<String,Object> meterStorage() {
		Goods goods = new Goods();
		Map<String,Object> map = new HashMap<String,Object>();
		//入库商品
		goods.setStorage_state(1);
		int storage_in = goodsDao.count(goods);
		
		//未入库
		goods.setStorage_state(2);
		int storage_out = goodsDao.count(goods);
		
		map.put("storage_in",storage_in);
		map.put("storage_out",storage_out);
		return map;
	} 
	
	/**
	 * 商品入库记录列表
	 */
	public List<Storage> storageList(Storage storage) {
		List<Storage> list = this.storageDao.find(storage);
		return list;
	}
	
	/**
	 * 单位获取
	 */
	public Unit getUnit(int id) {
		Unit unit = new Unit();
		unit.setId(id);
		unit = this.unitDao.find(unit).get(0);
		return unit;
	}
	
	/**
	 * 商品列表，数量统计   （商品总数，上架数，下架数）
	 * @param goods
	 * @return
	 */
	public Map<String,Object> meter(Goods goods) {
		//商品总数
		Map<String,Object> map = new HashMap<String,Object>();
		int total = goodsDao.find(goods).size();
		map.put("total",total);
		goods.setGoods_state(2);
		map.put("down",goodsDao.find(goods).size());
		int up = total - goodsDao.find(goods).size();
		map.put("up",up);
		goods.setGoods_state(0);
		return map;
	}
	
	public int count(Goods goods){
		return goodsDao.count(goods);
	}
	
	/**
	 * 商品数据分页  10条
	 * @param goods
	 * @return
	 */
	public List<Goods> findLimit(int page,int num,int gc_id,int storage_state){
		List<Goods> list = goodsDao.findLimit(page,num,gc_id,storage_state);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/goods/";
		for(int i=0;i<list.size();i++){
			//取出图片路径
			list.get(i).setGoods_image(imgUrl + list.get(i).getGoods_image());
			list.get(i).setGoods_image1(imgUrl + list.get(i).getGoods_image1());
			list.get(i).setGoods_image2(imgUrl + list.get(i).getGoods_image2());
			list.get(i).setGoods_image3(imgUrl + list.get(i).getGoods_image3());
			list.get(i).setGoods_image4(imgUrl + list.get(i).getGoods_image4());
			list.get(i).setGoods_image5(imgUrl + list.get(i).getGoods_image5());
			Class goodsClass = new Class();
			goodsClass.setGc_id(Integer.parseInt(list.get(i).getGc_id()));
			goodsClass.setGc_parent_id(-1);
			List<Class> goodsClassList = goodsClassDao.find(goodsClass);
			if(goodsClassList.size() != 0){
				list.get(i).setGc_name(goodsClassList.get(0).getGc_name());
			}else{
				list.get(i).setGc_name("无");
			}
			//厂家
			Factory factory = new Factory();
			factory.setId(list.get(i).getGoods_address());
			list.get(i).setGoods_addressStr(factoryDao.find(factory).get(0).getName());
			//供应商列表
			Supplier supplier = new Supplier();
			supplier.setId(list.get(i).getSupplier());
			list.get(i).setSupplierStr(supplierDao.find(supplier).get(0).getName());
			//单位
			Unit unit = new Unit();
			unit.setId(list.get(i).getUnit());
			list.get(i).setSupplierStr(unitDao.find(unit).get(0).getName());
		}
		return list;
	}
	
	public List<Goods> find(Goods goods) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/goods/";
		List<Goods> list = goodsDao.find(goods);
		//取出图片路径
		for(int i=0;i<list.size();i++){
			list.get(i).setGoods_image(imgUrl + list.get(i).getGoods_image());
			list.get(i).setGoods_image1(imgUrl + list.get(i).getGoods_image1());
			list.get(i).setGoods_image2(imgUrl + list.get(i).getGoods_image2());
			list.get(i).setGoods_image3(imgUrl + list.get(i).getGoods_image3());
			list.get(i).setGoods_image4(imgUrl + list.get(i).getGoods_image4());
			list.get(i).setGoods_image5(imgUrl + list.get(i).getGoods_image5());
			//商品类别
			if(!list.get(i).getGc_id_1().equals("")){
				Class goodsClass = new Class();
				goodsClass.setGc_id(Integer.parseInt(list.get(i).getGc_id_1()));
				goodsClass.setGc_parent_id(-1);
				List<Class> goodsList = goodsClassDao.find(goodsClass);
				if(goodsList.size() != 0){
					list.get(i).setGc_name(goodsList.get(0).getGc_name());
				}else{
					list.get(i).setGc_name("无");
				}
			}else{
				list.get(i).setGc_name("无");
			}
			if(!list.get(i).getGc_id_2().equals("")){
				Class goodsClass2 = new Class();
				goodsClass2.setGc_id(Integer.parseInt(list.get(i).getGc_id_2()));
				goodsClass2.setGc_parent_id(-1);
				List<Class> goodsList2 = goodsClassDao.find(goodsClass2);
				if(goodsList2.size() != 0){
					list.get(i).setGc_name2(goodsList2.get(0).getGc_name());
				}else{
					list.get(i).setGc_name2("无");
				}
			}else{
				list.get(i).setGc_name2("无");
			}
			if(!list.get(i).getGc_id_3().equals("")){
				Class goodsClass3 = new Class();
				goodsClass3.setGc_id(Integer.parseInt(list.get(i).getGc_id_3()));
				goodsClass3.setGc_parent_id(-1);
				List<Class> goodsList3 = goodsClassDao.find(goodsClass3);
				if(goodsList3.size() != 0){
					list.get(i).setGc_name3(goodsList3.get(0).getGc_name());
				}else{
					list.get(i).setGc_name3("无");
				}
			}else{
				list.get(i).setGc_name3("无");
			}
			//公共表查询
			GoodsCommon goodsCommon = new GoodsCommon();
			goodsCommon.setGoods_id(list.get(i).getGoods_id());
			List<GoodsCommon> goodsList = goodsCommonDao.find(goodsCommon);
			if(goodsList.size() != 0){
				list.get(i).setCommons(goodsCommonDao.find(goodsCommon).get(0));
			}
		}
		return list;
	}

	public List<Goods> search(Goods goods) {
		return this.goodsDao.search(goods);
	}

	public int insert(Goods goods) {
		//类别级别判断
		if(goods.getGc_id_3() == ""){
			goods.setGc_id(goods.getGc_id_2());
		}else{
			goods.setGc_id(goods.getGc_id_3());
		}
		if(goods.getGoods_hour() == 0){
			goods.setGoods_hour(1);
		}
		if(goods.getGoods_promotion() == 0){
			goods.setGoods_promotion(1);
		}
		if(goods.getGoods_number() == null || goods.getGoods_number() == ""){//商品货号生成,如果货号为空，则生成唯一货号
			String number = DateUtil.getDateString() + Tools.getRandomNum();
			goods.setGoods_number(number);
		}
		//商品图片
		GoodsImg goodsImg = goodsImgDao.find().get(0);
		String str[] = goodsImg.getGoods_img().split(",");
		String img = "";
		String img1 = "";
		String img2 = "";
		String img3 = "";
		String img4 = "";
		String img5 = "";
		if(str.length == 5){
			img = str[0];
			img1 = str[0];
			img2 = str[1];
			img3 = str[2];
			img4 = str[3];
			img5 = str[4];
		}
		if(str.length == 4){
			img = str[0];
			img1 = str[0];
			img2 = str[1];
			img3 = str[2];
			img4 = str[3];
		}
		if(str.length == 3){
			img = str[0];
			img1 = str[0];
			img2 = str[1];
			img3 = str[2];
		}
		if(str.length == 2){
			img = str[0];
			img1 = str[0];
			img2 = str[1];
		}
		if(str.length == 1){
			img = str[0];
			img1 = str[0];
		}
		goods.setGoods_image(img);
		goods.setGoods_image1(img1);
		goods.setGoods_image2(img2);
		goods.setGoods_image3(img3);
		goods.setGoods_image4(img4);
		goods.setGoods_image5(img5);
		//上传成功后图片表清空
		goodsImg.setGoods_img("");
		goodsImgDao.update(goodsImg);
		this.goodsDao.insert(goods);
		return goods.getGoods_id();
	}
	
	/**
	 * 产品上下架
	 * @param goods
	 * @return
	 */
	public int update(Goods goods) {
		return this.goodsDao.update(goods);
	}

	public int delete(Goods goods) {
		return this.goodsDao.delete(goods);
	}
	
	/**
	 * app商城首页广告列表
	 */
	public List<Mall> mallFind(MallImg mallImg){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/mall/";
		Mall mall = new Mall();
		List<Mall> list = mallDao.find(mall);
		for(int i=0;i<list.size();i++){
			Class goodsClass = new Class();
			goodsClass.setGc_id(list.get(i).getClass_id());
			goodsClass.setGc_parent_id(-1);
			list.get(i).setClass_name(goodsClassDao.find(goodsClass).get(0).getGc_name());
			mallImg.setMall_id(list.get(i).getId());
			List<MallImg> list2 = mallImgDao.find(mallImg);
			for(int j=0;j<list2.size();j++){
				if(list2.get(j).getImg() == null){
					list2.get(j).setImg("");
				}else{
					list2.get(j).setImg(imgUrl + list2.get(j).getImg());
				}
			}
			list.get(i).setList(list2);
		}
		return list;
	}
	
	public List<MallImg> mallAdvfind(MallImg mallImg){
		List<MallImg> list = mallImgDao.search(mallImg);
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();	
		String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/image/mall/";
		for(int i=0;i<list.size();i++){
			if(list.get(i).getImg().equals("")){
				list.get(i).setImg("无");
			}else{
				list.get(i).setImg(imgUrl + list.get(i).getImg());
			}
		}
		return list;
	}
	
	/**
	 * 商城添加
	 */
	public int mallAdd(MallImg mallImg) {
		//根据class_id判断是否存在
		Mall mall = new Mall();
		mall.setClass_id(mallImg.getClass_id());
		int res = mallDao.find(mall).size();
		if(res == 0){//插入得到id
			//mall表插入返回id
			mall.setState(mallImg.getState());
			mallDao.insert(mall);
			int mall_id = mall.getId();
			//判断是否为第一次插入
			mallImg.setMall_id(mall_id);
			int res2 = mallImgDao.find(mallImg).size();
			if(res2 == 0){
				//循环插入4条数据
				for(int i=0;i<4;i++){
					MallImg mallImg2 = new MallImg();
					mallImg2.setSort(i+1);
					mallImg2.setMall_id(mall_id);
					mallImgDao.insert(mallImg2);
				}
				mallImgDao.update(mallImg);
			}
		}else{
			mallImg.setMall_id(mallDao.find(mall).get(0).getId());
			mallImgDao.update(mallImg);
		}
		return 1;
	}
	
	/**
	 * 商城状态更改
	 */
	public int mallUpdate(Mall mall) {
		return mallDao.update(mall);
	}
	
	/**
	 * 商城类别广告删除
	 */
	public int mallDelete(Mall mall) {
		mallDao.delete(mall);
		//子项删除
		MallImg mallImg = new MallImg();
		mallImg.setMall_id(mall.getId());
		return mallImgDao.delete(mallImg);
	}
	
	/**
	 * 商城广告图片状态更改
	 */
	public int mallImgUpdate(MallImg mallImg) {
		return mallImgDao.update(mallImg);
	}
	
	/**
	 * 商城 类别上移
	 */
	public int mallImgUp(MallImg mallImg) {
		//原广告更新
		MallImg mallImg2 = new MallImg();
		mallImg2.setSort(mallImg.getSort());
		mallImg2.setMall_id(mallImg.getMall_id());
		mallImg2.setSortM(mallImg.getSort()+1);
		this.mallImgDao.upOrDown(mallImg2);
		return this.mallImgDao.update2(mallImg);
	}
	
	/**
	 * 商城 类别下移
	 */
	public int mallImgDown(MallImg mallImg) {
		//原广告更新
		MallImg mallImg2 = new MallImg();
		mallImg2.setSort(mallImg.getSort());
		mallImg2.setMall_id(mallImg.getMall_id());
		mallImg2.setSortM(mallImg.getSort()-1);
		this.mallImgDao.upOrDown(mallImg2);
		return this.mallImgDao.update2(mallImg);
	}
	
	/**
	 * 工厂
	 * @param factory
	 * @return
	 */
	public List<Factory> factorList(Factory factory) {
		return this.factoryDao.find(factory);
	}
	
	public int factorAdd(Factory factory) {
		return this.factoryDao.insert(factory);
	}
	
	public int factorDel(Factory factory) {
		return this.factoryDao.delete(factory);
	}
	
	public int factorUpdate(Factory factory) {
		return this.factoryDao.update(factory);
	}
	
	/**
	 * 药剂
	 * @param pill
	 * @return
	 */
	public List<Pill> pillList(Pill pill) {
		return this.pillDao.find(pill);
	}
	
	public int pillAdd(Pill pill) {
		return this.pillDao.insert(pill);
	}
	
	public int pillDel(Pill pill) {
		return this.pillDao.delete(pill);
	}
	
	public int pillUpdate(Pill pill) {
		return this.pillDao.update(pill);
	}
	
	/**
	 * 药品单位
	 * @param unit
	 * @return
	 */
	public List<Unit> unitList(Unit unit) {
		return this.unitDao.find(unit);
	}
	
	public int unitAdd(Unit unit) {
		return this.unitDao.insert(unit);
	}
	
	public int unitDel(Unit unit) {
		return this.unitDao.delete(unit);
	}
	
	public int unitUpdate(Unit unit) {
		return this.unitDao.update(unit);
	}
	
	/**
	 * 
	 * 药品有效期更新
	 */
	public int termUpdate(Term term) {
		return this.termDao.update(term);
	}
	
	/**
	 * 
	 * 药品有效期更新
	 */
	public Term termFind(Term term) {
		return this.termDao.find(term).get(0);
	}
	
}