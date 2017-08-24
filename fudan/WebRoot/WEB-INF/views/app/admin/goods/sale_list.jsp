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
                <h2>商品出库</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	销售管理
                    </li>
                    <li>
                    	线下支付
                    </li>
                    <li>
                        <strong>商品出库</strong>
                    </li>
                </ol>
            </div>
        </div>
      	<div class="row">
        	<div class="col-lg-12">
        		<div class="ibox float-e-margins">
		       		<div class="ibox-content">
	                      <form class="form-inline">
							  <div class="form-group">
							    <label for="exampleInputEmail3">商品名称/货号/条形码</label>
							    <input type="text" style="width:400px" class="form-control" id="exampleInputEmail3" placeholder="Email">
							  </div>
							  &nbsp;&nbsp;
							  <button type="submit" class="btn btn-default">搜索</button>
						 </form>
	                </div>
				</div>
	        </div>
	    </div>  
		<div class="col-lg-12">
			<table class="table table-striped table-bordered table-hover dataTables-example">
				<thead>
					<tr>
						<th>序号</th>
						<th>货号</th>
						<th>名称</th>
						<th>单位</th>
						<th>规格</th>
						<th>条码</th>
						<th>数量</th>
						<th>单价</th>
						<th>金额</th>
					</tr>
				</thead>
				<tbody id="dom_table">
					<tr><td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td></tr>
				</tbody>
			</table>
		</div> 
		<div class="col-lg-12">
			<div class="col-lg-6">
				合计金额：0.0
			</div>
			<div class="col-lg-6">
				合计数量：0
			</div>
		</div>
		<script>
			$(document).ready(function() {
				parent.scrollTo(0,0);
// 		 		fList();
			});
			function fTable(){
				$('.dataTables-example').dataTable();
			}
			function fList(){
		    	document.getElementById("dom_table").innerHTML = '';
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/factorList",
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							document.getElementById('dom_total').innerHTML = ret.length;
							if (ret.length == 0) {
								document.getElementById('dom_table').innerHTML = '<tr>' + '<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>' + '</tr>';
							} else {
								for (var i = 0; i < ret.length; i++) {
									document.getElementById("dom_table").innerHTML += '<tr>'
					                                	+'<td>'+ (i+1) +'</td>'
					                                    +'<td>'
														+ ret[i]['name']
														+'</td>'
					                                    +'<td>'
														+ ret[i]['descs']
														+'</td>'
														+'<td>'
														+ '<button onclick="fDetail(' + ret[i]['id'] + ',1)" data-toggle="modal" data-target="#Modal_factory_detail" type="button" class="btn btn-primary btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;查看'
														+'</button>&nbsp;'
														+ '<button onclick="fDetail(' + ret[i]['id'] + ',2)" data-toggle="modal" data-target="#Modal_factory_detail" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-edit"></i>&nbsp;编辑'
														+'</button>&nbsp;'
														+ '<button onclick="fDelete(' + ret[i]['id'] + ',\'factory\')" type="button" class="btn btn-danger btn-sm">'
														+'<i class="fa fa-trash-o"></i>&nbsp;删除'
														+'</button>&nbsp;'
														+'</td>'
					                                	+'</tr>';
								}
								fTable();
							}
						}
					}
				});	 
		    }
		    function fDelete(param1, param2) {
				fuConfirm(param1,param2);
			}
			function fuSure(param1,param2){
				if(param2 == 'factory'){
					fDelete2(param1);
				}
			}
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/factorDelete",
					data:{id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fuClose();
							fList();
						}
					}
				});
			}
			function fAdd(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/factorAdd",
					data:$("#Form_factory").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_factory").modal("hide");
							document.getElementById("Form_factory").reset();
							fTable();
						}
					}
				});
				return false;
			}
			function fDetail(param,param2){
				if(param2 == 1){
					document.getElementById("dom_factory_update").style.display = 'none';
				}else{
					document.getElementById("dom_factory_update").style.display = 'inline';
				}
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/factorDetail",
					data:{id:param},
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							document.getElementById("dom_id").value = ret['id'];
							document.getElementById("dom_name").value = ret['name'];
							document.getElementById("dom_descs").value = ret['descs'];
						}
					}
				});
			}
			function fUpdate(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/factorUpdate",
					data:$("#Form_factory_detail").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_factory_detail").modal("hide");
							fTable();
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>