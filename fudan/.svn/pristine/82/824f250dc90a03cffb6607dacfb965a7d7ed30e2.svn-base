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
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>订单列表</h2>
					<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
						<li>
							<a href="../appAdminLogin/statistics">主页</a>
						</li>
						<li>
							订单管理
						</li>
						<li>
							<strong>订单列表</strong>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="col-lg-1">
							<span class="label label-info" style="color:#fff;">订单总数：<span id="dom_total">0</span></span>
						</div>
						<div class="col-lg-1">
							<span class="label label-info">待付款：<span id="dom_daifu">0</span>
						</div>
						<div class="col-lg-1">
							<span class="label label-info">待发货：<span id="dom_daifa">0</span></span>
						</div>
						<div class="col-lg-1">
							<span class="label label-info">待收货：<span id="dom_daishou">0</span></span>
						</div>
						<div class="col-lg-1">
							<span class="label label-info">已完成：<span id="dom_yishou">0</span></span>
						</div>
						<div class="col-lg-1">
							<span class="label label-info">已取消：<span id="dom_quxiao">0</span></span>
						</div>
					</div>
					<div class="ibox-content">
						<table id="example" class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th style="width:120px;">订单编号</th>
									<th>支付单号</th>
									<th>下单时间</th>
									<th>订单金额</th>
									<th>完成时间</th>
									<th>买家姓名</th>
									<th>订单状态</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="dom_table"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal inmodal fade" id="modal_goods_price" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-ml">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">商品价格修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_goods_price" onsubmit="return fGoodsPriceModify()">
							<div class="form-group col-sm-12">
								<input type="hidden" name="order_id" id="dom_order_id">
								<label class="col-sm-4 control-label">订单金额</label>
								<div class="col-sm-6">
									<div class="input-group m-b">
										<input type="text" id="dom_order_amount" onfocus="this.blur()" class="form-control">
										<span class="input-group-addon">¥</span>
									</div>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label">输入价格</label>
								<div class="col-sm-6">
									<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"  name="order_amount" class="form-control" placeholder="输入价格" maxlength="30" required>
								</div>
							</div>
						</form>
                       </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="submit" class="btn btn-primary" form="Form_goods_price">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 订单取消 -->
		<div class="modal inmodal fade" id="modal_order_cancel" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">订单取消</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_order_cancel" onsubmit="return fGoodsPriceModify()">
							<div class="form-group col-sm-12">
								<div class="radio i-checks">
                                    <label><input type="radio" value="无法备齐货物" checked name="a"> <i></i>无法备齐货物</label>
                                </div>
							</div>
							<div class="form-group col-sm-12">
								<div class="radio i-checks">
                                    <label><input type="radio" value="不是有效的订单" name="a"> <i></i>不是有效的订单</label>
                                </div>
							</div>
							<div class="form-group col-sm-12">
								<div class="radio i-checks">
                                    <label><input type="radio" value="买家主动要求" name="a"> <i></i>买家主动要求</label>
                                </div>
							</div>
							<div class="form-group col-sm-12">
								<div class="radio i-checks">
                                    <label><input type="radio" value="其他原因" name="a"> <i></i>其他原因</label>
                                </div>
							</div>
						</form>
                    </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="button" onclick="fOrderOption(true)" class="btn btn-primary" form="Form_goods_price">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 货物发送 -->
		<div class="modal inmodal fade" id="modal_order_send" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-ml">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">设置发货</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_order_send" onsubmit="return fOrderSend()">
							<input type="hidden" id="order_id" name="order_id">
							<input type="hidden" id="order_state" name="order_state" value="30">
							<div class="form-group col-sm-12">
								<input type="hidden" name="order_id" id="dom_order_id">
								<label class="col-sm-4 control-label"><span style="color:red;">*</span>配送人员</label>
								<div class="col-sm-6">
									<select class="form-control m-b" name="personId" id="dom_personId" required>
										<option value="">--请选择--</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-4 control-label">发货备忘</label>
								<div class="col-sm-6">
									<input type="text" id="remark" name="remark" class="form-control" placeholder="备忘信息（100字）" maxlength="100" >
								</div>
							</div>
						</form>
                       </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="submit" class="btn btn-primary" form="Form_order_send">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			var order_id = 0;
			$(document).ready(function() {
				parent.scrollTo(0,0);
					//初始化表格
				   table = $("#example").DataTable({
						pageLength:10, //首次加载的数据条数
						stateSave: false, //状态保存，再次加载页面时还原表格状态
						autoWidth: false, //禁用自动调整列宽
						stripeClasses: ["odd", "even"], //为奇偶行加上样式，兼容不支持CSS伪类的场合
						processing: false, //隐藏加载提示,自行处理
						serverSide: true, //启用服务器端分页
						orderMulti: false, //多列排序
						searching: false,
						columns: [{
					      "data": null,
						}, {
					        data: "order_sn",
					        "orderable": false,
					        "targets": 1
						}, {
					        data: "pay_sn",
					        "orderable": false,
					        "targets":2,
					        "render": function(data,type,row,meta){
					        	if(data == '' || data == null){
					        		return '无';
					        	}else{
					        		return data;
					        	}
			                }
						}, {
					        data: "add_time",
					        "orderable": false,
					        "targets": 3
						}, {
					        data: "order_amount",
					        "targets": 4,
					        "orderable": false,
					        "render": function(data,type,row,meta){
					        	if(data == '' || data == null){
					        		return '0';
					        	}else{
					        		return data + '元';
					        	}
			                }
						}, {
					        data: "finnshed_time",
					        "orderable": false,
					        "targets": 5,
					        "render": function(data,type,row,meta){
					        	if(data == '' || data == null){
					        		return '无';
					        	}else{
					        		return data;
					        	}
			                }
						}, {
					        data: "buyer_name",
					        "orderable": false,
					        "targets": 6,
					        "render": function(data,type,row,meta){
					        	if(data == '' || data == null){
					        		return '无';
					        	}else{
					        		return data;
					        	}
					        }
						}, {
					        data: "order_state",
					        "orderable": false,
					        "targets": 7,
					        "render": function(data,type,row,meta){
					        	if(data == 10){
									var order_state = '待付款';		
								}else if(data == 20){
									var order_state = '已付款';	
								}else if(data == 30){
									var order_state = '已发货';		
								}else if(data == 40){
									var order_state = '已收货';		
								}else if(data == 50){
									var order_state = '已取消';		
								}
								return order_state;
							}
						}, {
							data: "caozuo",
							"orderable": false,
							"targets": 13,
							"render": function(data,type,row,meta){
								var button = '';
								if(row.order_state == 10){
									button = '<button onclick="fPriceShow(' + row.order_id + ',' + row.order_amount + ')" data-toggle="modal" data-target="#modal_goods_price" type="button" class="btn btn-warning btn-sm">' + '<i class="fa fa-pencil-square"></i>' + '&nbsp;修改价格' + '</button>&nbsp;' 
												+'<button onclick="fOrderOption(' + row.order_id + ')" data-toggle="modal" data-target="#modal_order_cancel" type="button" class="btn btn-danger btn-sm">' + '<i class="fa fa-trash-o"></i>' + '&nbsp;取消订单' + '</button>&nbsp;';							
								}else if(row.order_state == 20){
									button = '<button  data-toggle="modal" data-target="#modal_order_send"  onclick="fFormOrderId(' + row.order_id + ')" type="button" class="btn btn-warning btn-sm">' + '<i class="fa fa-truck"></i>' + '&nbsp;设置发货' + '</button>&nbsp;';
								}
								var button2 = '<a href="../appAdminOrder/detail?order_id='+ row.order_id +'"><button type="button" class="btn btn-primary btn-sm">' + '<i class="fa fa-eye"></i>' + '&nbsp;订单详情' + '</button></a>';
								return button + button2;
							}
						}],
					ajax: function(data, callback, settings) {
						//封装请求参数
						var page = (data.start / data.length) + 1; //当前页码（不使用）
						var limit = data.length; //页面显示记录条数，在页面显示每页显示多少项的时候
						var start = data.start; //开始的记录序号
						$.ajax({
							url: basePath + "appAdminOrder/listLimitData",
							type: "POST",
							cache: false, //禁用缓存
							data: {page:page,limit:limit,start:start,order_state:${order_state}}, //传入组装的参数
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
			//数据统计
			function fMeter(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminOrder/meter",
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							//仪表盘
							document.getElementById("dom_total").innerHTML = ret['total'];
							document.getElementById("dom_daifu").innerHTML = ret['daifu'];
							document.getElementById("dom_daifa").innerHTML = ret['daifa'];
							document.getElementById("dom_daishou").innerHTML = ret['daishou'];
							document.getElementById("dom_yishou").innerHTML = ret['yishou'];
							document.getElementById("dom_quxiao").innerHTML = ret['quxiao'];
						}
					}
				});
			}
			//商品详情
			function fPriceShow(param,param2){
				document.getElementById('dom_order_id').value = param;
				document.getElementById('dom_order_amount').value = param2;
			}
			//商品价格修改
			function fGoodsPriceModify(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminOrder/update",
					data:$("#Form_goods_price").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							alert(obj.resMsg);
						}else{
							$("#modal_goods_price").modal("hide");
							table.draw();
						}
					}
				});
				return false;
			}
			//订单取消
			function fOrderOption(param){
				if(param == true){
					var temp = document.getElementsByName("a");
					for(var i=0;i<temp.length;i++){
				    	if(temp[i].checked){
							var cancel_reason = temp[i].value;    
						}
					}
					$.ajax({
						type : "post",
						async : false,
						url : basePath + "appAdminOrder/orderCancel",
						data : {
							order_id : _order_id,
							order_state:50,
							cancel_reason:cancel_reason
						},
						success : function(data) {
							var obj = eval('(' + data + ')');
							if (obj.res == 0) {
								fuError();
							} else {
								$("#modal_order_cancel").modal("hide");
								fuCloseLayer();
								table.draw();
							}
						}
					});
				}else{
					_order_id = param;
				}
			}
			//order_id打印发货表单
			function fFormOrderId(param){
				fPerson();
				document.getElementById("order_id").value = param;
			}
			//发货
			function fOrderSend(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminOrder/OrderSend",
					data : $("#Form_order_send").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							fuCloseLayer();
							$("#modal_order_send").modal("hide");
							table.draw();
						}
					}
				});
				return false;
			}
			//配送人调取
			function fPerson(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appPerson/list",
					success : function(data) {
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							alert(obj.resMsg);
						}else{
							document.getElementById("dom_personId").innerHTML = '<option value="">--请选择--</option>';
							for(var i=0;i<obj.obj.length;i++){
								document.getElementById("dom_personId").innerHTML += '<option value="'+ obj.obj[i]['personId'] +'">'+ obj.obj[i]['name'] +'</option>';
							}
						}
					}
				});
			}
		</script>
	</body>
</html>