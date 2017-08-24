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
                <h2>药品单位</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	基础信息
                    </li>
                    <li>
                        <strong>药品单位</strong>
                    </li>
                </ol>
            </div>
        </div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="col-lg-1">
							<span class="label label-info" style="color:#fff;">药品单位总数：<span id="dom_total">0</span></span>
						</div>
						<div class="col-lg-11" style="text-align:right;margin-top:-20px;">
							<button data-toggle="modal" data-target="#Modal_unit" class="btn btn-primary" type="button">
								<i class="fa fa-plus"></i>&nbsp;单位添加
							</button> 
						</div>
					</div>
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>序号</th>
									<th>单位名称</th>
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
		<div class="modal fade" id="Modal_unit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">药品单位添加</h4>
		      </div>
		      <div class="modal-body">
			       <form class="form-horizontal aForm" role="form" id="Form_unit" onsubmit="return fAdd()">
						<div class="form-group">
							<label class="col-sm-2 control-label">单位名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name" name="name" maxlength="255" placeholder="药品单位名称" required>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" id="brandSave" class="btn btn-primary">
								保存
							</button>
						</div>
					</form>
				</div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="Modal_unit_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">药品单位详情</h4>
		      </div>
		      <div class="modal-body">
			       <form class="form-horizontal aForm" role="form" id="Form_unit_detail" onsubmit="return fUpdate()">
			       		<input type="hidden" name="id" id="dom_id">
						<div class="form-group">
							<label class="col-sm-2 control-label">单位名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="dom_name" name="name" maxlength="255" placeholder="药品单位名称" required>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" id="dom_unit_update" class="btn btn-primary">
								保存
							</button>
						</div>
					</form>
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
					url : basePath + "appAdminGoods/unitList",
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
														+ '<button onclick="fDetail(' + ret[i]['id'] + ',1)" data-toggle="modal" data-target="#Modal_unit_detail" type="button" class="btn btn-primary btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;查看'
														+'</button>&nbsp;'
														+ '<button onclick="fDetail(' + ret[i]['id'] + ',2)" data-toggle="modal" data-target="#Modal_unit_detail" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-edit"></i>&nbsp;编辑'
														+'</button>&nbsp;'
														+ '<button onclick="fDelete(' + ret[i]['id'] + ',\'unit\')" type="button" class="btn btn-danger btn-sm">'
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
				if(param2 == 'unit'){
					fDelete2(param1);
				}
			}
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/unitDelete",
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
					url : basePath + "appAdminGoods/unitAdd",
					data:$("#Form_unit").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_unit").modal("hide");
							document.getElementById("Form_unit").reset();
							fTable();
						}
					}
				});
				return false;
			}
			function fDetail(param,param2){
				if(param2 == 1){
					document.getElementById("dom_unit_update").style.display = 'none';
				}else{
					document.getElementById("dom_unit_update").style.display = 'inline';
				}
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/unitDetail",
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
					url : basePath + "appAdminGoods/unitUpdate",
					data:$("#Form_unit_detail").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_unit_detail").modal("hide");
							fTable();
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>