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
	<body style='background-color:#fff'>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>入库记录</h2>
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
                        <strong>入库记录</strong>
                    </li>
                </ol>
            </div>
        </div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="col-lg-1">
							<span class="label label-info" style="color:#fff;">入库商品：<span id="storage_in">0</span></span>
						</div>
						<div class="col-lg-1">
							<span class="label label-danger" style="color:#fff;">未入库商品：<span id="storage_out">0</span></span>
						</div>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>入库时间</th>
									<th>库存单号</th>
									<th>商品数量</th>
									<th>商品总价</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="dom_table">
							 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				parent.scrollTo(0,0);
		 		fList();
			});
			function fTable(){
				$('.dataTables-example').dataTable();
			}
			function fList(){
		    	document.getElementById("dom_table").innerHTML = '';
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/storageList",
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							if (ret.length == 0) {
								document.getElementById('dom_table').innerHTML = '<tr>' + '<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>' + '</tr>';
							} else {
								for (var i = 0; i < ret.length; i++) {
									document.getElementById("dom_table").innerHTML += '<tr>'
					                                	+'<td>'+ (i+1) +'</td>'
					                                    +'<td style="color:#D9B300">'
														+ ret[i]['create_date']
														+'</td>'
					                                    +'<td style="color:#888;font-weight:bold;">'
														+ ret[i]['numbers']
														+'</td>'
														+'<td style="color:#D9B300;font-weight:bold;">'
														+ ret[i]['counts']
														+'</td>'
														+'<td style="color:#ff6364;font-weight:bold;">'
														+ ret[i]['total_price']
														+'元</td>'
														+'<td>'
														+ '<a href="../appAdminGoods/storageLogDetailPage?id='+ ret[i]['id'] +'"><button type="button" class="btn btn-primary btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;查看'
														+'</button></a>&nbsp;'
														+'</td>'
					                                	+'</tr>';
								}
								fMeter();
								fTable();
							}
						}
					}
				});	 
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
		</script>
	</body>
</html>