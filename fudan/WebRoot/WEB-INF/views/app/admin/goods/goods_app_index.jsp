<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="../../common/styleUrl.jsp" %>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<%@ include file="../../common/css.jsp" %>
		<%@ include file="../../common/js.jsp" %>
		<script src="${jypath}/app/js/file/ajaxfileupload.js"></script>
		<style type="text/css">
			input{vertical-align:middle; margin:0; padding:0}
			.btn-sm{margin-top:4px !important;}
		</style>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>app购物页面</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	药品商城
                    </li>
                    <li>
                        <strong>app购物页面</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div style="width:100%;height:10px;background:#ebeced"></div>
        <div class="ibox-title" >
       		<h5>广告添加</h5>
        	<small style="letter-spacing:2px;color:#3498db;float:right">广告图片大小636*357像素</small>
        </div> 
            <div class="ibox-content">
                <table class="table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th style="width:300px !important;">图片</th>
                            <th style="width:300px !important;">上传</th>
                            <th>链接</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                   		<c:forEach items="${list}" var="list" varStatus="vs">
	                    	<tr>
		                    	<td>${vs.index+1}</td>
		                    	<td>
		                    		<c:if test="${list.img == '无'}">
		                    			无
		                    		</c:if>
		                    		<c:if test="${list.img != '无'}">
		                    			<img src="${list.img}" width="120px;">
		                    		</c:if>
	                    		</td>
		                    	<td>
									<div style="position:relative;width:300px;top:4px;">
					                    <input type="text" id="advtextfield${vs.index+1}" style="height:22px; border:1px solid #cdcdcd; width:180px;" />
										<input type="button" value="图片上传" style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/>
										<input type="file" name="file" id="advfileField${vs.index+1}" style="cursor:pointer;position:absolute;top:0px;left:38px;filter:alpha(opacity:0);opacity: 0;" onchange="fAdvUrlShow(${vs.index+1})" />
									</div>
								</td>
		                    	<td>
		                    		<button onclick="fAdvAdvId(${vs.index+1})" data-toggle="modal" data-target="#modal_goods_list" type="button" class="btn btn-default btn-sm">商品选择</button>
		                    	</td>
		                    	<td>
									<button onclick="fAdvUpdateImg(${vs.index+1})" type="button" class="btn btn-info btn-sm"><i class="fa fa-edit"></i>&nbsp;更新</button>
									&nbsp;
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                </table>
            </div>
		</div>
		<div style="width:100%;height:10px;background:#ebeced"></div>
    	<div class="ibox-title">
       		<h5>类别添加</h5>
        </div> 
        <div class="ibox-content">
			<form id="Form_class_add" class="form-horizontal" onsubmit="return fClassAdd()">
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">商品分类</label>
					<div class="col-sm-2">
						<select class="form-control m-b" name="gc_id_1" id="gc_id_1" onchange="fGetClass(1,2)" required>
							<option value="0">请选择</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control m-b" name="gc_id_2" id="gc_id_2" onchange="fGetClass(2,3)" required>
							<option value="0">请选择</option>
						</select>
					</div>
					<div class="col-sm-2">
						<select class="form-control m-b" name="gc_id_3" id="gc_id_3" >
							<option value="0">请选择</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-10">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-plus"></i>&nbsp;添加
						</button>
					</div>
				</div>
			</form>
		</div>
        <div class="ibox-title" >
        	<small style="letter-spacing:2px;color:#3498db;float:right">广告图片大小636*357像素</small>
        </div> 
        <div class="ibox-content" id="dom_class_box">
        	 
        </div>     
        <div class="modal inmodal fade" id="modal_goods_list" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h6 class="modal-title">商品列表</h6>
					</div>
					<div class="modal-body">
						 <table id="example" class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>序号</th>
									<th style="width:120px;">商品名称</th>
									<th>商品图片</th>
									<th>商品货号</th>
									<th>价格</th>
									<th>促销</th>
									<th>库存</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="dom_table"></tbody>
						</table>
                   	</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="submit" class="btn btn-primary" onclick="fGoodsChoice()">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>  
	</body>
	<script>
		var _advId = 0;
		var _advImgId = 0;
		
		$(document).ready(function(){
			parent.scrollTo(0,0);
			//类别调取
			fGetClass(0,1);
			fList();
			fGoodsList();
		});
		function fGoodsList() {
			//初始化表格
		   	var table = $("#example").DataTable({
				pageLength:10, //首次加载的数据条数
				stateSave: false, //状态保存，再次加载页面时还原表格状态
				autoWidth: false, //禁用自动调整列宽
				stripeClasses: ["odd", "even"], //为奇偶行加上样式，兼容不支持CSS伪类的场合
				processing: false, //隐藏加载提示,自行处理
				serverSide: true, //启用服务器端分页
				orderMulti: false, //多列排序
				searching: false,
				columns: [{//对应列表表头字段
			      "data": null,
				}, {
			        data: "goods_name",
			        "orderable": false,
			        "targets": 1
				}, {
			        data: "goods_image",
			        "orderable": false,
			        "targets":2,
			        "render": function(data,type,row,meta){
	                    return data = '<a class="fancybox" target="_blank" href="' + data + '" title="' + data + '">' + '<img style="width:40px;height:40px;" alt="image" src="' + data + '" /></a>';
	                }
				}, {
			        data: "goods_number",
			        "orderable": false,
			        "targets": 3
				}, {
			        data: "goods_price",
			        "targets": 4
				}, {
			        data: "goods_promotion_price",
			        "orderable": false,
			        "targets": 5
				}, {
			        data: "goods_storage",
			        "orderable": false,
			        "targets": 6,
				},{
			        data: "caozuo",
			        "orderable": false,
			        "targets": 7,
			        "render": function(data,type,row,meta){
	                    return data = '<input type="radio" name="goodsList" value="'+ row.goods_id +'">';
	                }
				}],
				ajax: function(data, callback, settings) {
					//封装请求参数
					var page = (data.start / data.length) + 1; //当前页码（不使用）
					var limit = data.length; //页面显示记录条数，在页面显示每页显示多少项的时候
					var start = data.start; //开始的记录序号
					$.ajax({
						url: basePath + "appAdminGoods/listLimitData",
						type: "POST",
						cache: false, //禁用缓存
						data: {page:page,limit:limit,start:start,goods_state:1,}, //传入组装的参数
						dataType: "json",
						beforeSend: function(request) {
							request.setRequestHeader("token", localStorage.token);
						},
						success: function(result) {
							// 封装返回数据
							var returnData = {};
							returnData.draw = data.draw; //这里直接自行返回了draw计数器,应该由后台返回
							returnData.recordsTotal = result.obj.total; //页数（所有数据总数）
							returnData.recordsFiltered = result.obj.total; //后台不实现过滤功能，每次查询均视作全部结果
							returnData.data = result.obj.data;//返回的数据列表
							//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染，此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
							callback(returnData);
						}
					});
				},
			});
			//序号增加
			table.on('order.dt search.dt',function(){  
		        table.column(0,{  
		            search: 'applied',  
		            order: 'applied'  
		        }).nodes().each(function(cell,i){  
		            i = i + 1;  
		            var page = table.page.info();  
		            var pageno = page.page;  
		            var length = page.length;  
		            var columnIndex = (i+pageno*length);  
		            cell.innerHTML = columnIndex;  
		        });  
		    }).draw();  
		}
		function fGetClass(param,param2){
			if(param != 0){
				var item_select = document.getElementById("gc_id_" + param);
		  		var item_value = item_select.options[item_select.selectedIndex].value;
		  		if(param == 2){
		  			_class_id2 = document.getElementById("gc_id_2").options[item_select.selectedIndex].value;
					_class_name2 = document.getElementById("gc_id_2").options[item_select.selectedIndex].innerText;
		  		}
		  		param = item_value;
			}else{
				param = 0;
			}
			document.getElementById('gc_id_' + param2).innerHTML = '<option value="">请选择</option>';
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appAdminGoods/classData",
				data:{gc_parent_id:param},
				success:function(data){
					var obj = eval('('+ data +')');
					var ret = obj.obj;		
					if(obj.res == 0){
						fuError();
					}else{
						for(var i=0;i<ret.length;i++){
							document.getElementById('gc_id_' + param2).innerHTML += '<option value="'+ ret[i]['gc_id'] +'">'+ ret[i]['gc_name'] +'</option>';
						}
					}
				}
			}); 
		}
		//类别添加
		function fClassAdd(){
			var item_select = document.getElementById("gc_id_3");
			var class_id = document.getElementById("gc_id_3").options[item_select.selectedIndex].value;
			if(class_id == ''){
				var class_id = _class_id2;
				var class_name = _class_name2;
			}else{
				var class_name = document.getElementById("gc_id_3").options[item_select.selectedIndex].innerText;
			}
			var box_num = document.getElementsByName('dom_box');
			for(var i=0;i<box_num.length;i++){//类别id比对,避免重复添加
				if(box_num[i].value == class_id){
					fuError("此类别已添加");
					return false;
				}
			}
			var table_list = '<table class="table">'
								+'<thead>'
									+'<tr>'
										+'<th>图片</th>'
										+'<th style="width:300px !important;">上传</th>'
										+'<th>位置</th>'
										+'<th>操作</th>'
									+'</tr>'
								+'</thead><tbody>';
			for(var i=0;i<4;i++){
				if(i == 0){
					var location = '</i></a>&nbsp;&nbsp; <a href="javascript:void(0)"><i class="fa fa-long-arrow-down"></i>';
				}else if(i == 3){
					var location = '</i></a>&nbsp;&nbsp; <a href="javascript:void(0)"><i class="fa fa-long-arrow-up"></i>';
				}else{
					var location = '</i></a>&nbsp;&nbsp; <a href="javascript:void(0)"><i class="fa fa-long-arrow-up"></i>'
									+'</i></a>&nbsp;&nbsp; <a href="javascript:void(0)"><i class="fa fa-long-arrow-down"></i>';
				}
				table_list += '<tr>'
									+'<td><div style="margin-top:4px;">无</div></td>'
									+'<td>'
										+'<div style="position:relative;width:300px;top:4px;">'
		                                	+'<input type="text" id="textfield'+ class_id + (i+1) +'" style="height:22px; border:1px solid #cdcdcd; width:180px;" />&nbsp;'
											+'<input type="button" value="图片上传" style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/>'
											+'<input type="file" name="file" id="fileField'+ class_id + (i+1) +'" style="cursor:pointer;position:absolute;top:0px;left:38px;filter:alpha(opacity:0);opacity: 0;" onchange="fUrlShow('+ class_id +','+ (i+1) +')" />'
										+'</div>'
									+'</td>'
									+'<td><div style="margin-top:4px;">'
									+ location
									+'</div></td>'
									+'<td>'
										+'<button onclick="fSave('+ class_id +','+ (i+1)+')" type="button" class="btn btn-success btn-sm">'
											+'<i class="fa fa-save"></i>&nbsp;保存'
										+'</button>'
									+'</td>'
								+'</tr>'
			}
			table_list += '</tbody>'
							+'</table>';
			document.getElementById("dom_class_box").innerHTML += '<div id="dom_box'+ class_id +'"><h5><span class="badge badge-info">'+ class_name +'</span></h5>'
				+'<input type="hidden" name="dom_box" value="'+ class_id +'">'
	        	+'<div class="text-right" style="margin:10px">'
	            +'<button type="button" class="btn btn-danger btn-sm" onclick="fClassRemove('+ class_id +')">'
	               	+'<i class="fa fa-trash-o"></i>&nbsp;删除'
	            +'</button>&nbsp;'
	            +'<button type="button" class="btn btn-primary btn-sm" onclick="fClassRemove('+ class_id +')">'
	               	+'<i class="fa fa-eye"></i>&nbsp;显示'
	            +'</button>'
			+'</div>'
        	+ table_list;
        	+'</div>';
			document.getElementById("Form_class_add").reset();
			return false;
		}
		function fClassRemove(param){
			document.getElementById('dom_box'+param).innerHTML = '';
		}
		function fUrlShow(param,param2){
	    	document.getElementById("textfield" + param + param2).value = document.getElementById("fileField" + param + param2).value;
	    }
	    function fList(){
	    	document.getElementById("dom_class_box").innerHTML = '';
	    	$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallList",
				/* data:{order_state:${order_state}}, */
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						if (ret.length == 0) {
								document.getElementById('dom_class_box').innerHTML = '<center><i class="icon-comments"></i> 没有相关数据 <center>';
						} else {
							for(var j=0;j<ret.length;j++){
								var class_name = ret[j]['class_name'];
								var table_list = '<table class="table">'
									+'<thead>'
										+'<tr>'
											+'<th>图片</th>'
											+'<th style="width:300px !important;">上传</th>'
											+'<th>位置</th>'
											+'<th>链接</th>'
											+'<th>操作</th>'
										+'</tr>'
									+'</thead><tbody>';
								for (var i = 0; i < ret[j]['list'].length; i++) {
									if(ret[j]['list'][i]['img'] == '' || ret[j]['list'][i]['img'] == null){
										var img = '无';
									}else{
										var img = '<img src="'+ret[j]['list'][i]['img']+'" width="120px;">';
									}
									if(ret[j]['list'][i]['sort'] == 1){
										var sortStr = '<a href="javascript:void(0)" title="下移" onclick="fDown('+ ret[j]['list'][i]['mall_id'] +','+ ret[j]['list'][i]['sort'] +','+ ret[j]['list'][i]['id'] +')"><i class="fa fa-long-arrow-down"></i></a>&nbsp;&nbsp;';
									}else if(ret[j]['list'][i]['sort'] == ret[j]['list'].length ){
										var sortStr = '<a href="javascript:void(0)" title="上移" onclick="fUp('+ ret[j]['list'][i]['mall_id'] +','+ ret[j]['list'][i]['sort'] +','+ ret[j]['list'][i]['id'] +')"><i class="fa fa-long-arrow-up"></i></a>&nbsp;&nbsp;';
									}else{
										var sortStr = '<a href="javascript:void(0)" title="下移" onclick="fDown('+ ret[j]['list'][i]['mall_id'] +','+ ret[j]['list'][i]['sort'] +','+ ret[j]['list'][i]['id'] +')"><i class="fa fa-long-arrow-down"></i></a>&nbsp;&nbsp;'
													 +'<a href="javascript:void(0)" title="上移" onclick="fUp('+ ret[j]['list'][i]['mall_id'] +','+ ret[j]['list'][i]['sort'] +','+ ret[j]['list'][i]['id'] +')"><i class="fa fa-long-arrow-up"></i></a>&nbsp;&nbsp;';
									}
									if(ret[j]['list'][i]['state'] == 1){
										var button = '<button onclick="fItemUpdate('+  ret[j]['id'] +','+ ret[j]['list'][i]['id'] +',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;'
													+'<button onclick="fUpdateImg('+ ret[j]['class_id'] + (i+1) +','+  ret[j]['id'] +','+ ret[j]['list'][i]['id'] +')" type="button" class="btn btn-info btn-sm">'
														+'<i class="fa fa-edit"></i>&nbsp;更新'
													+'</button>&nbsp;';
									}else if(ret[j]['list'][i]['state'] == 2){
										var button = '<button onclick="fItemUpdate('+  ret[j]['id'] +','+ ret[j]['list'][i]['id'] +',1)" type="button" class="btn btn-primary btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;'
													+'<button onclick="fUpdateImg('+ ret[j]['class_id'] + (i+1) +','+  ret[j]['id'] +','+ ret[j]['list'][i]['id'] +')" type="button" class="btn btn-info btn-sm">'
														+'<i class="fa fa-edit"></i>&nbsp;更新'
													+'</button>&nbsp;';
									}else{
										var button = '<button onclick="fSave('+ ret[j]['class_id'] +','+(i+1)+')" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-save"></i>&nbsp;保存'
													+'</button>&nbsp;';
									}
									table_list += '<tr>'
														+'<td><div style="margin-top:4px;">'+ img +'</div></td>'
														+'<td>'
														+'<div style="position:relative;width:300px;top:4px;">'
						                                	+'<input type="text" id="textfield'+ ret[j]['class_id'] + (i+1) +'" style="height:22px; border:1px solid #cdcdcd; width:180px;" />&nbsp;'
															+'<input type="button" value="图片上传" style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/>'
															+'<input type="file" name="file" id="fileField'+ ret[j]['class_id'] + (i+1) +'" style="cursor:pointer;position:absolute;top:0px;left:38px;filter:alpha(opacity:0);opacity: 0;" onchange="fUrlShow('+ ret[j]['class_id'] +','+ (i+1) +')" />'
														+'</div>'
														+'</td>'
														+'<td><div style="margin-top:4px;">'
														+ sortStr
														+'</div></td>'
														+'<td>'
														+'<button onclick="fAdvId('+ ret[j]['id'] +','+ ret[j]['list'][i]['id'] +')" data-toggle="modal" data-target="#modal_goods_list" type="button" class="btn btn-default btn-sm" onclick="">'
										               	+'商品选择'
											            +'</button>'
														+'</td>'
														+'<td>'
														+ button
														+'</td>'
													+'</tr>';
								}
								if(ret[j]['state'] == 2){
									var state = '<button type="button" class="btn btn-primary btn-sm" onclick="fUpdate('+ ret[j]['id'] +',1)">'
									               	+'<i class="fa fa-eye"></i>&nbsp;显示'
									            +'</button>';
								}else{
									var state = '<button type="button" class="btn btn-warning btn-sm" onclick="fUpdate('+ ret[j]['id'] +',2)">'
									               	+'<i class="fa fa-close"></i>&nbsp;关闭'
									            +'</button>';
								}
							document.getElementById("dom_class_box").innerHTML += '<div id="dom_box'+ ret[j]['class_id'] +'"><h5><span class="badge badge-info">'+ class_name +'</span></h5>'
											+'<input type="hidden" name="dom_box" value="'+ ret[j]['class_id'] +'">'
								        	+'<div class="text-right" style="margin:10px">'
								            +'<button type="button" class="btn btn-danger btn-sm" onclick="fRemove('+ ret[j]['id'] +')">'
								               	+'<i class="fa fa-trash-o"></i>&nbsp;删除'
								            +'</button>&nbsp;'
								            + state
										+'</div>'
							        	+ table_list
							        	+'</div>';
							}
						}
					}
				}
			});
	    }
	    function fSave(param,param2){
	     	var arrId = "fileField" + param + param2;
	     	var pd = document.getElementById(arrId).value;
	     	if(pd == '' || pd == undefined){
	     		fuError('请选择 图片');
	     	}else{
		     	$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminGoods/mallAdd",
					ecureuri:false,
			    	fileElementId:arrId,
					dataType:"JSON",
					data:{
						state:1,
						class_id:param,
						sort:param2
					},
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fList();
						}
					}
				});
			}
	    }
	  	function fRemove(param){
     		$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallDelete",
				data:{id:param},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						fList();
					}
				}
			});
	     }
	     function fUpdate(param,param2){
	     	$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallUpdate",
				data:{id:param,state:param2},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						fList();
					}
				}
			});
	     }
	     function fItemUpdate(param,param2,param3){
	     	$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallImgUpdate",
				data:{mall_id:param,id:param2,state:param3},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						fList();
					}
				}
			});
	     }
	     function fUpdateImg(param,param2,param3){
	     	var arrId = "fileField" + param;
	     	var pd = document.getElementById(arrId).value;
	     	if(pd == '' || pd == undefined){
	     		fuError('请上传 图片');
	     	}else{
		     	$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminGoods/mallImgImageUpdate",
					ecureuri:false,
			    	fileElementId:arrId,
					dataType:"JSON",
					data:{
						mall_id:param2,
						id:param3
					},
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fList();
						}
					}
				});
			}
	    }
	    function fUp(param,param2,param3){
	     	var sort = param2 - 1;
	     	$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallImgUp",
				data:{mall_id:param,sort:sort,id:param3},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						fList();
					}
				}
			});
	     }
	     function fDown(param,param2,param3){
	    	var sort = param2 + 1;
	    	$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallImgDown",
				data:{mall_id:param,sort:sort,id:param3},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						fList();
					}
				}
			});
	    }
	    function fAdvId(param,param2){
	    	_advId = param;
	    	_advImgId = param2;
	    }
	    function fGoodsChoice(){
	    	var temp = document.getElementsByName("goodsList");
			for(var i=0;i<temp.length;i++)
			{
				if(temp[i].checked){
					var intHot = temp[i].value;    
				}
			}
			$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/mallImgUp",
				data:{mall_id:_advId,links:intHot,id:_advImgId},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						$("#modal_goods_list").modal("hide");
					}
				}
			});
	    }
	    function fAdvUrlShow(param){
	    	document.getElementById("advtextfield" + param).value = document.getElementById("advfileField" + param).value;
	    }
	    function fAdvUpdateImg(param){
	     	var arrId = "advfileField" + param ;
	     	var pd = document.getElementById(arrId).value;
	     	if(pd == '' || pd == undefined){
	     		fuError('请选择 图片');
	     	}else{
		     	$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminGoods/mallImgImageUpdate",
					ecureuri:false,
			    	fileElementId:arrId,
					dataType:"JSON",
					data:{
						state:1,
						id:param,
					},
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							document.location.reload();
						}
					}
				});
			}
    	}
    	function fAdvAdvId(param){
	    	_advImgId = param;
	    }
	</script>
</html>