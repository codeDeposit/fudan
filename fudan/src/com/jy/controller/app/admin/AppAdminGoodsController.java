package com.jy.controller.app.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jy.common.ajax.AjaxRes;
import com.jy.common.utils.FileUpload;
import com.jy.common.utils.base.Tools;
import com.jy.controller.base.BaseController;
import com.jy.entity.app.admin.Admin;
import com.jy.entity.app.admin.Brand;
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
import com.jy.service.app.admin.BrandService;
import com.jy.service.app.admin.ClassService;
import com.jy.service.app.admin.GoodsCommonService;
import com.jy.service.app.admin.GoodsImgService;
import com.jy.service.app.admin.GoodsService;
import com.jy.service.app.admin.SupplierService;

@Controller("appAdminGoodsController")
@RequestMapping(value="/appAdminGoods")
public class AppAdminGoodsController extends BaseController<Object> {
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	@Resource(name="classService")
	private ClassService classService;
	@Resource(name="goodsImgService")
	private GoodsImgService goodsImgService;
	@Resource(name="goodsCommonService")
	private GoodsCommonService goodsCommonService;
	@Resource(name="brandService")
	private BrandService brandService;
	@Resource(name="supplierService")
	private SupplierService supplierService;
	
	/**
	 * 商品出库页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageSaleIndex")  
	public String storageSaleIndex(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/goods/sale_list";
	}
	
	/**
	 * 库存列表页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageIndex")  
	public String storageIndex(HttpServletRequest request,Model model,Storage storage)throws Exception{	
		return "app/admin/goods/storage_list";
	}
	
	/**
	 * 商品入库
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageIn")  
	@ResponseBody
	public AjaxRes storageIn(HttpServletRequest request,Model model,Storage storage)throws Exception{
		return resMsg(1,goodsService.storageIn(storage));
	}	
	
	/**
	 * 商品入库/未入库商品数据统计
	 */
	@RequestMapping("/meterStorage")  
	@ResponseBody
	public AjaxRes meterStorage() {
		return resMsg(1,goodsService.meterStorage());
	}
	
	/**
	 * 入库记录页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageLogIndex")  
	public String storageLogIndex(HttpServletRequest request,Model model,Storage storage)throws Exception{	
		return "app/admin/goods/storage_log";
	}
	
	/**
	 * 入库记录列表
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageList")  
	@ResponseBody
	public AjaxRes storageList(HttpServletRequest request,Model model,Storage storage)throws Exception{
		return resMsg(1,goodsService.storageList(storage));
	}	
	
	/**
	 * 入库记录详情页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/storageLogDetailPage")  
	public String storageLogDetailPage(HttpServletRequest request,Model model,Storage storage)throws Exception{	
		model.addAttribute("storage_id",storage.getId());
		return "app/admin/goods/storage_detail";
	}
	
	/**
	 * 商品列表页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/list")  
	public String list(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		return "app/admin/goods/goods_list";
	}
	
	/**
	 * 商品修改页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/goodsModify")
	public String goodsModify(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		goods = goodsService.find(goods).get(0);
		model.addAttribute("goods",goods);
		return "app/admin/goods/goods_modify";
	}	
	
	/**
	 * 商品上下架数据统计
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/meter")  
	@ResponseBody
	public AjaxRes meter(HttpServletRequest request,Model model,Goods goods)throws Exception{
		return resMsg(1,goodsService.meter(goods));
	}		
	
	/**
	 * 商品数据分页    10条
	 */
	@RequestMapping("/listLimitData")  
	@ResponseBody
	public AjaxRes listLimitData(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		String gc_idStr = request.getParameter("gc_id");
		String limitStr = request.getParameter("limit");
		String startStr = request.getParameter("start");
		int limit = 0;
		int start = 0;
		int gc_id = 0;
		if(gc_idStr != null && gc_idStr != "" && gc_idStr != "undefined"){
			gc_id = Integer.parseInt(gc_idStr);
		}
		if(limitStr != null && limitStr != "" && limitStr != "undefined"){
			limit = Integer.parseInt(limitStr);
		}
		if(startStr != null && startStr != "" && startStr != "undefined"){
			start = Integer.parseInt(startStr);
		}
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("total",goodsService.count(goods));
		map.put("data",goodsService.findLimit(start,limit,gc_id,goods.getStorage_state()));
		return resMsg(1,map);
	}
	
	/**
	 * app商品列表数据调取
	 */
	@RequestMapping("/appGoodsList")  
	@ResponseBody
	public AjaxRes appGoodsList(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		return resMsg(1,goodsService.find(goods));
	}
	
	/**
	 * 商品详情页面
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/detail")  
	public String detail(HttpServletRequest request,Model model){	
		int goods_id = Integer.parseInt(request.getParameter("goods_id"));
		model.addAttribute("goods_id",goods_id);
		return "app/admin/goods/goods_detail";
	}
	
	/**
	 * 产品添加 step1
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addOne")  
	public String addOne(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/goods/goods_add";
	}
	
	/**
	 * 产品添加 step2
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addTwo")  
	public String addTwo(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		model.addAttribute("mark",goods.getGoods_id());
		return "app/admin/goods/goods_add2";
	}
	
	@RequestMapping("/find")  
	@ResponseBody
	public AjaxRes find(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		AjaxRes ar = getAjaxRes();
		goods = goodsService.find(goods).get(0);
		ar.setSucceed(goods,1);
		return ar;
	}
	
	@RequestMapping("/cartFind")  
	@ResponseBody
	public AjaxRes cartFind(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		AjaxRes ar = getAjaxRes();
		List<Goods> list = new ArrayList<Goods>();
		String strs[] = goods.getGoods_id_list().split(",");
		for(int i=0;i<strs.length;i++){
			Goods goods2 = new Goods();
			goods2.setGoods_id(Integer.parseInt(strs[i]));
			goods2 = goodsService.find(goods2).get(0);
			list.add(goods2);
		}
		ar.setSucceed(list,1);
		return ar;
	}
	
	@RequestMapping("/delete")  
	@ResponseBody
	public AjaxRes delete(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		int res = goodsService.delete(goods);
		return resMsg(res);
	}
	
	/**
	 * 商品添加		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/add")  
	@ResponseBody
	public AjaxRes add(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		AjaxRes ar = new AjaxRes();
		int res = 0;
		try{
			res = goodsService.insert(goods);
			ar.setSucceed(res,1);
		}catch(Exception e){
			ar.setSucceed(res,0);
			System.out.println("数据库操作错误：" + e);
		}
		return ar;
	}
	
	/**
	 * 产品轮播图
	 * @param request
	 * @param model
	 * @param file
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addImg")  
	@ResponseBody
	public AjaxRes add(HttpServletRequest request,Model model,
			@RequestParam(value = "file", required = false) MultipartFile file,Goods goods)throws Exception{	
		//取出图片路径
		GoodsImg goodsImg = goodsImgService.find().get(0);
		String filePath = "c:\\image\\goods\\";	
		String fileName = "";
		AjaxRes ar = getAjaxRes();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName += number + timeOutStr + file.getOriginalFilename();
			if(goodsImg.getGoods_img().equals("")){
				goodsImg.setGoods_img(fileName);
			}else{
				goodsImg.setGoods_img(goodsImg.getGoods_img() + "," + fileName);
			}
		}
		goodsImgService.update(goodsImg);
		ar.setSucceed(fileName);
		return ar;
	}
	
	/**
	 * 产品说明书图片
	 * @param request
	 * @param model
	 * @param file
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addImgDesc")  
	@ResponseBody
	public AjaxRes addImgDesc(HttpServletRequest request,Model model,
			@RequestParam(value = "imgDesc", required = false) MultipartFile file,GoodsCommon goodsCommon)throws Exception{	
		//取出图片路径
		String filePath = "c:\\image\\goods\\common\\" + goodsCommon.getGoods_id();
		String fileName = "";
		AjaxRes ar = getAjaxRes();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = number + timeOutStr + file.getOriginalFilename();
		}
		//取出图片路径
		GoodsImg goodsImg = goodsImgService.find().get(0);
		goodsCommon.setImg_desc(fileName);//说明书图片
		goodsCommon.setImg_detail(goodsImg.getGoods_img());//图文详情图片
		int res = goodsCommonService.insert(goodsCommon);
		//产品状态更改
		Goods goods = new Goods();
		goods.setGoods_id(goodsCommon.getGoods_id());
		goods.setGoods_state(1);
		goodsService.update(goods);
		//图片清空
		goodsImg.setGoods_img("");
		goodsImgService.update(goodsImg);
		ar.setSucceed(res);
		return ar;
	}
	
	/**
	 * 图文详情
	 * @param request
	 * @param model
	 * @param file
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/addImgList")  
	@ResponseBody
	public AjaxRes addImgList(HttpServletRequest request,Model model,
			@RequestParam(value = "file", required = false) MultipartFile file)throws Exception{	
		//取出图片路径
		GoodsImg goodsImg = goodsImgService.find().get(0);
		String filePath = "c:\\image\\goods\\common";	
		String fileName = "";
		AjaxRes ar = getAjaxRes();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName += number + timeOutStr + file.getOriginalFilename();
			if(goodsImg.getGoods_img().equals("")){
				goodsImg.setGoods_img(fileName);
			}else{
				goodsImg.setGoods_img(goodsImg.getGoods_img() + "," + fileName);
			}
		}
		goodsImgService.update(goodsImg);
		ar.setSucceed(fileName);
		return ar;
	}
	
	/**
	 * 商品公共表添加
	 */
	@RequestMapping("/addImgAdd")  
	@ResponseBody
	public AjaxRes addImgAdd(HttpServletRequest request,Model model,GoodsCommon goodsCommon)throws Exception{	
		int res = 0;
		//用户id插入
		Admin admin = (Admin)getSession().getAttribute("admin");
		goodsCommon.setMember_id(admin.getAdmin_id());
		try{
			res = goodsCommonService.insert(goodsCommon);
		}catch(Exception e){
			System.out.println("数据库操作错误：" + e);
		}
		return resMsg(res);
	}
	
	/**
	 * 产品上下架
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/GoodsUpOrDown")  
	@ResponseBody
	public AjaxRes GoodsUpOrDown(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		int res = goodsService.update(goods);
		return resMsg(res);
	}
	
	/**
	 * 产品推荐
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/GoodsTui")  
	@ResponseBody
	public AjaxRes GoodsTui(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		int res = goodsService.update(goods);
		return resMsg(res);
	}
	
	/**
	 * 产品更新
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/update")  
	@ResponseBody
	public AjaxRes update(HttpServletRequest request,Model model,Goods goods)throws Exception{	
		int res = goodsService.update(goods);
		return resMsg(res);
	}
	
	/**
	 * 商品类别index		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classIndex")  
	public String classIndex(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		return "app/admin/goodsClass/class_add";
	}
	
	@RequestMapping("/classListPage")  
	public String classListPage(HttpServletRequest request,Model model)throws Exception{	
		return "app/admin/goodsClass/class_list";
	}
	
	/**
	 * 商品类别添加		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classAdd")  
	@ResponseBody
	public AjaxRes classAdd(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		int class2 = Integer.parseInt(request.getParameter("gc_id2"));
		if(goodsClass.getGc_id() != 0){
			goodsClass.setGc_parent_id(goodsClass.getGc_id());
		}else{
			goodsClass.setGc_parent_id(0);
		}
		if(class2 != 0){
			goodsClass.setGc_parent_id(class2);
		}
		int res = 0;
		try{
			res = classService.insert(goodsClass);
		}catch(Exception e){
			System.out.println("数据库操作错误：" + e);
		}
		return resMsg(res);
	}
	
	/**
	 * 
	 * 类别列表
	 * @param request
	 * @param model
	 * @param goodsClass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classList")  
	@ResponseBody
	public AjaxRes classList(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		goodsClass.setGc_parent_id(0);
		List<Class> list = classService.find(goodsClass);//得到一级分类
		for(int i=0;i<list.size();i++){
			//得到二级分类
			Class goodsClass2 = new Class();
			goodsClass2.setGc_parent_id(list.get(i).getGc_id());
			List<Class> list2 = classService.find(goodsClass2);
			list.get(i).setClass2(list2);
			//得到三级分类
			for(int j=0;j<list2.size();j++){
				Class goodsClass3 = new Class();
				goodsClass3.setGc_parent_id(list2.get(j).getGc_id());
				List<Class> list3 = classService.find(goodsClass3);
				list2.get(j).setClass3(list3);
			}
		}
		Map<String,Object> map = classService.findMap(goodsClass);
		map.put("list", list);
		return resMsg(1,map);
	}
	
	/**
	 * 类别搜索
	 */
	@RequestMapping("/classSearch")  
	@ResponseBody
	public AjaxRes classSearch(HttpServletRequest request,Model model,Class goodsClass){	
		if(classService.find(goodsClass).size() != 0){
			return resMsg(1,classService.find(goodsClass));
		}else{
			return resMsg(0);
		}
	}
	
	/**
	 * 
	 *手机端 类别列表
	 * @param request
	 * @param model
	 * @param goodsClass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classList2")  
	@ResponseBody
	public AjaxRes classList2(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		List<Class> list = new ArrayList<Class>();
		if(goodsClass.getGc_parent_id() != 0){//二三级分类调取
			list = classService.find(goodsClass);//得到二级分类
			for(int i=0;i<list.size();i++){
				//得到三级分类
				Class goodsClass3 = new Class();
				goodsClass3.setGc_parent_id(list.get(i).getGc_id());
				List<Class> list2 = classService.find(goodsClass3);
				list.get(i).setClass3(list2);
			}
		}else{//一级分类调取
			list = classService.find(goodsClass);//得到一级分类
			for(int i=0;i<list.size();i++){
				//得到二级分类
				Class goodsClass2 = new Class();
				goodsClass2.setGc_parent_id(list.get(i).getGc_id());
				List<Class> list2 = classService.find(goodsClass2);
				list.get(i).setClass2(list2);
				//得到三级分类
				for(int j=0;j<list2.size();j++){
					Class goodsClass3 = new Class();
					goodsClass3.setGc_parent_id(list2.get(j).getGc_id());
					List<Class> list3 = classService.find(goodsClass3);
					list2.get(j).setClass3(list3);
				}
			}
		}
		return resMsg(1,list);
	}
	
	/**
	 * 商品类别详细		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classDetail")  
	@ResponseBody
	public AjaxRes classDetail(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		goodsClass.setGc_parent_id(-1);
		goodsClass = classService.find(goodsClass).get(0);
		return resMsg(1,goodsClass);
	}
	
	/**
	 * 商品类别更新		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classUpdate")  
	@ResponseBody
	public AjaxRes classUpdate(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		int res = classService.update(goodsClass);
		return resMsg(res);
	}
	
	/**
	 * 类别调取,单一类别调取
	 * @param request
	 * @param model
	 * @param goodsClass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classData") 
	@ResponseBody
	public AjaxRes classData(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		return resMsg(1,classService.find(goodsClass));
	}
	
	/**
	 * 类别显示控制
	 * @param request
	 * @param model
	 * @param goodsClass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classShow") 
	@ResponseBody
	public AjaxRes classShow(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		int gc_show = 0;
		if(goodsClass.getGc_show() == 1){
			gc_show = 2;
		}else{
			gc_show = 1;
		}
		goodsClass.setGc_show(gc_show);
		//二级类别判断
		Class goodsClass2 = new Class();
		goodsClass2.setGc_parent_id(goodsClass.getGc_id());
		List<Class> list = classService.find(goodsClass2);
		if(list.size() != 0){//二级分类不为空
			goodsClass2.setGc_show(gc_show);
			classService.update2(goodsClass2);
			//三级分类判断
			for(int i=0;i<list.size();i++){
				Class goodsClass3 = new Class();
				goodsClass3.setGc_parent_id(list.get(i).getGc_id());
				List<Class> list2 = classService.find(goodsClass3);
				if(list2.size() != 0){
					goodsClass3.setGc_show(gc_show);
					classService.update2(goodsClass3);
				}
			}
		}
		int res = classService.update(goodsClass);//一级分类
		return resMsg(res);
	}
	
	/**
	 * 类别删除
	 * @param request
	 * @param model
	 * @param goodsClass
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/classDelete") 
	@ResponseBody
	public AjaxRes classDelete(HttpServletRequest request,Model model,Class goodsClass)throws Exception{	
		//二级类别判断
		Class goodsClass2 = new Class();
		goodsClass2.setGc_parent_id(goodsClass.getGc_id());
		List<Class> list = classService.find(goodsClass2);
		if(list.size() != 0){//二级分类不为空
			classService.delete(goodsClass2);
			//三级分类判断
			for(int i=0;i<list.size();i++){
				Class goodsClass3 = new Class();
				goodsClass3.setGc_parent_id(list.get(i).getGc_id());
				List<Class> list2 = classService.find(goodsClass3);
				if(list2.size() != 0){
					classService.delete(goodsClass3);
				}
			}
		}
		int res = classService.delete(goodsClass);//一级分类
		return resMsg(res);
	}
	
	/**
	 * 商品品牌列表		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/brandListPage")  
	public String brandListPage(HttpServletRequest request,Model model,Brand brand)throws Exception{	
		return "app/admin/goodsBrand/brand_list";
	}
	
	/**
	 * 品牌图片更换
	 * @param request
	 * @param model
	 * @param file
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/brandImgUpdate")  
	@ResponseBody
	public AjaxRes brandImgUpdate(HttpServletRequest request,Model model,
			@RequestParam(value = "picUrl", required = false) MultipartFile file,Brand brand)throws Exception{	
		//取出图片路径
		String filePath = "c:\\image\\goods\\brand\\";	
		String fileName = "";
		AjaxRes ar = getAjaxRes();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
		int number = Tools.getRandomNum();
		long timeOutStr = sdf.parse(sdf.format(date)).getTime();
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,number + timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = number + timeOutStr + file.getOriginalFilename();
			brand.setBrand_pic(fileName);
		}
		brandService.update(brand);
		ar.setSucceed(fileName);
		return ar;
	}
	
	/**
	 * 品牌列表
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/brandList")  
	@ResponseBody
	public AjaxRes brandList(HttpServletRequest request,Model model,Brand brand){
		Map<String,Object> map = brandService.mapFind(brand);
		return resMsg(1, map);
	}
	
	/**
	 * 品牌列表data
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/brandData")  
	@ResponseBody
	public AjaxRes brandData(HttpServletRequest request,Model model,Brand brand){
		return resMsg(1,brandService.find(brand));
	}
	
	/**
	 * 品牌显示
	 */
	@RequestMapping("/brandShow")  
	@ResponseBody
	public AjaxRes brandShow(HttpServletRequest request,Model model,Brand brand){
		return resMsg(1, brandService.update(brand));
	}
	
	/**
	 * 品牌推荐
	 */
	@RequestMapping("/brandTui")  
	@ResponseBody
	public AjaxRes brandTui(HttpServletRequest request,Model model,Brand brand){
		return resMsg(1, brandService.update(brand));
	}
	
	/**
	 * 品牌添加页面
	 */
	@RequestMapping("/brandAddPage")  
	public String brandAddPage(HttpServletRequest request,Model model,Brand brand){
		return "app/admin/goodsBrand/brand_add";
	}
	
	/**
	 * 品牌添加		 状态码返回：1成功 	0错误
	 * @param request
	 * @param model
	 * @param goods
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/brandAdd")  
	@ResponseBody
	public AjaxRes brandAdd(HttpServletRequest request,Model model,Brand brand,
			@RequestParam(value = "file", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\goods\\brand\\";	
		if (file != null && !file.isEmpty()){
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); 
			long timeOutStr = sdf.parse(sdf.format(date)).getTime();
			FileUpload.fileUp(file, filePath,timeOutStr + file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			String fileName = timeOutStr + file.getOriginalFilename();
			brand.setBrand_pic(fileName);
		}
		int res = 0;
		try{
			res = brandService.insert(brand);
		}catch(Exception e){
			System.out.println("数据库操作错误：" + e);
		}
		return resMsg(res);
	}
	
	@RequestMapping("/brandDetail")  
	@ResponseBody
	public AjaxRes brandDetail(HttpServletRequest request,Model model,Brand brand)throws Exception{	
		return resMsg(1,brandService.find(brand).get(0));
	}

	@RequestMapping("/brandUpdate")  
	@ResponseBody
	public AjaxRes brandUpdate(HttpServletRequest request,Model model,Brand brand)throws Exception{	
		int res = brandService.update(brand);
		return resMsg(res);
	}
	
	@RequestMapping("/brandDelete")  
	@ResponseBody
	public AjaxRes brandDelete(HttpServletRequest request,Model model,Brand brand)throws Exception{	
		int res = brandService.delete(brand);
		return resMsg(res);
	}
	
	/**
	 * 商城首页轮播
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/appIndex")  
	public String appIndex(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		model.addAttribute("list",goodsService.mallAdvfind(mallImg));
		return "app/admin/goods/goods_app_index";
	}

	/**
	 * 商城首页轮播data
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mallAdvData")  
	@ResponseBody
	public AjaxRes mallAdvData(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		return resMsg(1,goodsService.mallAdvfind(mallImg));
	}
	
	/**
	 * 商城产品推荐列表
	 */
	@RequestMapping("/mallList")  
	@ResponseBody
	public AjaxRes mallList(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		return resMsg(1,goodsService.mallFind(mallImg));
	}
	
	/**
	 * 商城首页 产品推荐添加
	 * @param request
	 * @param model
	 * @param mallImg
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mallAdd")  
	@ResponseBody
	public AjaxRes mallAdd(HttpServletRequest request,Model model,MallImg mallImg,
			@RequestParam(value = "file", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\mall\\";	
		String fileName = "";
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = file.getOriginalFilename();
		}
		mallImg.setImg(fileName);
		int res = goodsService.mallAdd(mallImg);
		return resMsg(res);
	}
	
	/**
	 * 商城状态更改
	 */
	@RequestMapping("/mallUpdate")  
	@ResponseBody
	public AjaxRes mallUpdate(HttpServletRequest request,Model model,Mall mall)throws Exception{	
		int res = goodsService.mallUpdate(mall);
		return resMsg(res);
	}
	
	/**
	 * 商城类别广告删除
	 */
	@RequestMapping("/mallDelete")  
	@ResponseBody
	public AjaxRes mallDelete(HttpServletRequest request,Model model,Mall mall)throws Exception{	
		int res = goodsService.mallDelete(mall);
		return resMsg(res);
	}
	 
	 /**
	  * 商城广告图片状态更改
	  */
	@RequestMapping("/mallImgUpdate")  
	@ResponseBody
	public AjaxRes mallImgUpdate(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		int res = goodsService.mallImgUpdate(mallImg);
		return resMsg(res);
	}
	
	/**
	 * 商城子项图片更换
	 */
	@RequestMapping("/mallImgImageUpdate")  
	@ResponseBody
	public AjaxRes mallImgImageUpdate(HttpServletRequest request,Model model,MallImg mallImg,
			@RequestParam(value = "file", required = false) MultipartFile file)throws Exception{	
		String filePath = "c:\\image\\mall\\";	
		String fileName = "";
		if (file != null && !file.isEmpty()){
			FileUpload.fileUp(file, filePath,file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")));
			fileName = file.getOriginalFilename();
		}
		mallImg.setImg(fileName);
		int res = goodsService.mallImgUpdate(mallImg);
		return resMsg(res);
	}
	
	/**
	 * 商城 类别上移
	 */
	@RequestMapping("/mallImgUp")  
	@ResponseBody
	public AjaxRes mallImgUp(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		int res = goodsService.mallImgUp(mallImg);
		return resMsg(res);
	}
	
	/**
	 * 商城 类别下移
	 */
	@RequestMapping("/mallImgDown")  
	@ResponseBody
	public AjaxRes mallImgDown(HttpServletRequest request,Model model,MallImg mallImg)throws Exception{	
		int res = goodsService.mallImgDown(mallImg);
		return resMsg(res);
	}
	

	/**
	 * 厂家管理
	 */
	@RequestMapping("/factorIndex")  
	public String factorIndex(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		return "app/admin/goodsFactory/factory_list";
	}
	
	/**
	 * 厂家列表
	 */
	@RequestMapping("/factorList")  
	@ResponseBody
	public AjaxRes factorList(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		List<Factory> list = goodsService.factorList(factory);
		return resMsg(1,list);
	}
	
	/**
	 * 厂家添加
	 */
	@RequestMapping("/factorAdd")  
	@ResponseBody
	public AjaxRes factorAdd(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		int res = goodsService.factorAdd(factory);
		return resMsg(res);
	}
	
	/**
	 * 厂家删除
	 */
	@RequestMapping("/factorDelete")  
	@ResponseBody
	public AjaxRes factorDelete(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		int res = goodsService.factorDel(factory);
		return resMsg(res);
	}
	
	/**
	 * 厂家详情
	 */
	@RequestMapping("/factorDetail")  
	@ResponseBody
	public AjaxRes factorDetail(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		factory  = goodsService.factorList(factory).get(0);
		return resMsg(1,factory);
	}
	
	/**
	 * 厂家更新
	 */
	@RequestMapping("/factorUpdate")  
	@ResponseBody
	public AjaxRes factorUpdate(HttpServletRequest request,Model model,Factory factory)throws Exception{	
		int res = goodsService.factorUpdate(factory);
		return resMsg(res);
	}
	
	/**
	 * 剂型管理页面
	 */
	@RequestMapping("/pillIndex")  
	public String pillIndex(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		return "app/admin/pill/pill_list";
	}
	
	/**
	 * 剂型列表
	 */
	@RequestMapping("/pillList")  
	@ResponseBody
	public AjaxRes pillList(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		List<Pill> list = goodsService.pillList(pill);
		return resMsg(1,list);
	}
	
	/**
	 * 剂型添加
	 */
	@RequestMapping("/pillAdd")  
	@ResponseBody
	public AjaxRes pillAdd(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		int res = goodsService.pillAdd(pill);
		return resMsg(res);
	}
	
	/**
	 * 剂型删除
	 */
	@RequestMapping("/pillDelete")  
	@ResponseBody
	public AjaxRes pillDelete(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		int res = goodsService.pillDel(pill);
		return resMsg(res);
	}
	
	/**
	 * 剂型详情
	 */
	@RequestMapping("/pillDetail")  
	@ResponseBody
	public AjaxRes pillDetail(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		pill  = goodsService.pillList(pill).get(0);
		return resMsg(1,pill);
	}
	
	/**
	 * 剂型更新
	 */
	@RequestMapping("/pillUpdate")  
	@ResponseBody
	public AjaxRes pillUpdate(HttpServletRequest request,Model model,Pill pill)throws Exception{	
		int res = goodsService.pillUpdate(pill);
		return resMsg(res);
	}
	
	/**
	 * 药品单位页面
	 */
	@RequestMapping("/unitIndex")  
	public String unitIndex(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		return "app/admin/unit/unit_list";
	}
	
	/**
	 * 药品单位列表
	 */
	@RequestMapping("/unitList")  
	@ResponseBody
	public AjaxRes unitList(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		List<Unit> list = goodsService.unitList(unit);
		return resMsg(1,list);
	}
	
	/**
	 * 药品单位添加
	 */
	@RequestMapping("/unitAdd")  
	@ResponseBody
	public AjaxRes unitAdd(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		int res = goodsService.unitAdd(unit);
		return resMsg(res);
	}
	
	/**
	 * 药品单位删除
	 */
	@RequestMapping("/unitDelete")  
	@ResponseBody
	public AjaxRes unitDelete(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		int res = goodsService.unitDel(unit);
		return resMsg(res);
	}
	
	/**
	 * 药品单位详情
	 */
	@RequestMapping("/unitDetail")  
	@ResponseBody
	public AjaxRes unitDetail(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		unit  = goodsService.unitList(unit).get(0);
		return resMsg(1,unit);
	}
	
	/**
	 * 药品单位更新
	 */
	@RequestMapping("/unitUpdate")  
	@ResponseBody
	public AjaxRes unitUpdate(HttpServletRequest request,Model model,Unit unit)throws Exception{	
		int res = goodsService.unitUpdate(unit);
		return resMsg(res);
	}
	
	/**
	 * 供应商页面
	 */
	@RequestMapping("/supplierIndex")  
	public String supplierIndex(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		return "app/admin/supplier/supplier_list";
	}
	
	/**
	 * 供应商列表
	 */
	@RequestMapping("/supplierList")  
	@ResponseBody
	public AjaxRes supplierList(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		List<Supplier> list = supplierService.find(supplier);
		return resMsg(1,list);
	}
	
	/**
	 * 供应商添加
	 */
	@RequestMapping("/supplierAdd")  
	@ResponseBody
	public AjaxRes supplierAdd(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		int res = supplierService.insert(supplier);
		return resMsg(res);
	}
	
	/**
	 * 供应商删除
	 */
	@RequestMapping("/supplierDelete")  
	@ResponseBody
	public AjaxRes supplierDelete(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		int res = supplierService.delete(supplier);
		return resMsg(res);
	}
	
	/**
	 * 供应商详情
	 */
	@RequestMapping("/supplierDetail")  
	@ResponseBody
	public AjaxRes supplierDetail(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		supplier  = supplierService.find(supplier).get(0);
		return resMsg(1,supplier);
	}
	
	/**
	 * 供应商更新
	 */
	@RequestMapping("/supplierUpdate")  
	@ResponseBody
	public AjaxRes supplierUpdate(HttpServletRequest request,Model model,Supplier supplier)throws Exception{	
		int res = supplierService.update(supplier);
		return resMsg(res);
	}
	
	/**
	 * 有效期页面
	 */
	@RequestMapping("/termIndex")  
	public String termIndex(HttpServletRequest request,Model model,Term term)throws Exception{	
	    if(goodsService.termFind(term).getNumber() % 1.0 == 0){
	    	int num = (int)goodsService.termFind(term).getNumber();
	    	model.addAttribute("number",num);
	    }else{
	    	model.addAttribute("number",goodsService.termFind(term).getNumber());
	    }
		return "app/admin/term/term_list";
	}
	
	/**
	 * 有效期更新
	 */
	@RequestMapping("/termUpdate")  
	@ResponseBody
	public AjaxRes termUpdate(HttpServletRequest request,Model model,Term term)throws Exception{	
		int res = goodsService.termUpdate(term);
		return resMsg(res);
	}
}