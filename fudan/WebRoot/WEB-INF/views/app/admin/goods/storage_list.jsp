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
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body style='background-color:#fff;height:1200px;'>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>商品库存</h2>
				<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
					<li>
						<a href="../appAdminLogin/statistics">主页</a>
					</li>
					<li>
						基础信息
					</li>
					<li>
						商品管理
					</li>
					<li>
						<strong>商品库存</strong>
					</li>
				</ol>
			</div>
		</div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="col-lg-1">
							<span class="label label-info">入库商品：<span id="storage_in">0</span>
						</div>
						<div class="col-lg-1">
							<span class="label label-danger">未入库商品：<span id="storage_out">0</span></span>
						</div>
						<div class="col-lg-9" style="text-align:right;margin-top:-20px;">
							<a href="../appAdminGoods/addOne">
							<button class="btn btn-primary" type="button">
								<i class="fa fa-plus"></i>&nbsp;添加商品
							</button></a>
						</div>
					</div>
					<div class="ibox-content">
						<table id="example" class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>供应商</th>
									<th>货号</th>
									<th>名称</th>
									<th>分类</th>
									<th>厂家</th>
									<th>单位</th>
									<th>规格</th>
									<th>批准文号</th>
									<th>库存</th>
									<th>库存报警</th>
									<th>销售价</th>
									<th>库存金额</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				parent.scrollTo(0,0);
				setInterval(windowHeight,100);     //每隔100毫秒刷新一次页面
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
					//对应列表表头字段
					columns: [{
				        data: null,
				        "orderable": false,
				        "targets": 1
					},{
				        data: "supplierStr",
				        "orderable": false,
				        "targets": 2
					}, {
				        data: "goods_number",
				        "orderable": false,
				        "targets": 3,
					}, {
				        data: "goods_name",
				        "orderable": false,
				        "targets": 4
					}, {
				        data: "gc_name",
				        "orderable": false,
				        "targets": 5
					}, {
				        data: "goods_addressStr",
				        "orderable": false,
				        "targets": 6,
					}, {
				        data: "unitStr",
				        "orderable": false,
				        "targets": 7
					}, {
				        data: "goods_norms",
				        "orderable": false,
				        "targets": 8
					}, {
				        data: "approve",
				        "orderable": false,
				        "targets": 9
					}, {
				        data: "goods_storage",
				        "orderable": false,
				        "targets": 10
					}, {
				        data: "goods_storage_alarm",
				        "orderable": false,
				        "targets": 11
					}, {
				        data: null,
				        "orderable": false,
				        "targets": 12,
				        "render": function(data,type,row,meta){
		                    return data = '<input type="text">';
		                }
	                }, {
				        data: null,
				        "orderable": false,
				        "targets": 13,
				        "render": function(data,type,row,meta){
		                    return data = '<input type="text">';
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
						data: {page:page,limit:limit,start:start,storage_state:2}, //传入组装的参数
						dataType: "json",
						beforeSend: function(request) {
							request.setRequestHeader("token", localStorage.token);
						},
						success: function(result) {
							setTimeout('fMeter()',600);
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
		});
		function windowHeight() {
			var h = document.getElementById("example").offsetHeight;
			var bodyHeight = document.body;
			bodyHeight.style.height  = (h+320) + "px";
		}
		//入库未入库数据统计
		function fMeter(){
			$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/meterStorage",
				success : function(data) {
					var obj = eval('(' + data + ')');
					if (obj.res == 0) {
						fuError();
					} else {
						document.getElementById("storage_in").innerHTML = obj.obj.storage_in;
						document.getElementById("storage_out").innerHTML = obj.obj.storage_out;
					}
				}
			});
		}
		function fData(){
			var table = $("#example").DataTable();
			table.draw();
		}
		function fStorageIn(param,param2,param3){
			$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/storageIn",
				data : {
					goods_id : param,
					goods_price:param2,
					goods_storage:param3
				},
				success : function(data) {
					var obj = eval('(' + data + ')');
					console.log(obj);
					if (obj.res == 0) {
						fuError();
					} else {
						fuClose();
						fTemp();
					}
				}
			});
		}
		function fTemp(){
			fData();
		}
		</script>
	</body>
</html>