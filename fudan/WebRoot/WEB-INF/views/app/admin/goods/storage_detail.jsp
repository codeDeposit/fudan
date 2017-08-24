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
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>商品名称</th>
									<th>商品图片</th>
									<th>商品货号</th>
									<th>价格</th>
									<th>促销价</th>
									<th>库存</th>
									<th>类别</th>
									<th>添加时间</th>
								</tr>
							</thead>
							<tbody id="dom_table">
							 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12" style="text-align:center;">
			<a href="../appAdminGoods/storageLogIndex">
				<button class="btn btn-primary" type="button"><i class="fa fa-mail-reply"></i>&nbsp;返回</button>
			</a>
		</div>	
		<script>
			$(document).ready(function() {
				parent.scrollTo(0,0);
		 		fList();
			});
			function fList(){
		    	document.getElementById("dom_table").innerHTML = '';
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/appGoodsList",
					data:{storage_id:${storage_id}},
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
					                                	+'<td>'
														+ ret[i]['goods_name']
														+'</td>'
					                                    +'<td>'
														+'<a class="fancybox" target="_blank" href="' + ret[i]['goods_image'] + '" title="' + ret[i]['goods_image'] + '">' + '<img style="width:40px;height:40px;" alt="image" src="' + ret[i]['goods_image'] + '" /></a>'
														+'</td>'
														+'<td>'
														+ ret[i]['goods_number']
														+'</td>'
														+'<td>'
														+ ret[i]['goods_price']
														+'</td>'
														+'<td>'
														+ ret[i]['goods_promotion_price']
														+'</td>'
														+'<td>'
														+ ret[i]['goods_storage']
														+'</td>'
														+'<td>'
														+ ret[i]['gc_id']
														+'</td>'
														+'<td>'
														+ ret[i]['goods_addtime']
														+'</td>'
					                                	+'</tr>';
								}
								fTable();
							}
						}
					}
				});	 
		    }
		</script>
	</body>
</html>