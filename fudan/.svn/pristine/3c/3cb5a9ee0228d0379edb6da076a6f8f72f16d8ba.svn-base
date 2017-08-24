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
                <h2>管理员列表</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	用户管理
                    </li>
                    <li>
                        <strong>管理员列表</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
			        <div class="ibox-title">
			          	<div class="col-lg-12" style="text-align:right;margin-top:-20px;">
							<button data-toggle="modal" data-target="#Modal_admin"  class="btn btn-primary" type="button"><i class="fa fa-plus"></i>&nbsp;添加人员</button>
			           	</div>
				    </div>	
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th style="width:60px;">名称</th>
									<th>登陆次数</th>
									<th>登录时间</th>	
									<th>角色</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="dTable">
											 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="Modal_admin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">人员添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_admin" onsubmit="return fAdd()">
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名 </label>
								<div class="col-sm-6">
									<input type="text" id="admin_name" name="admin_name" class="form-control" placeholder="管理员名称" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
								<div class="col-sm-6">
									<input type="password" name="admin_password" id="admin_password" class="form-control" placeholder="管理员密码" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">权限组</label>
								<div class="col-sm-6">
									<select class="form-control m-b" name="admin_gid" id="admin_gid_add" required>
										<option value="">请选择</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									关闭
								</button>
								<button type="submit" id="classSave" class="btn btn-primary">
									保存
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="Modal_admin_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">人员修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_admin_detail" onsubmit="return fUpdate()">
							<input type="hidden" name="admin_id" id="admin_id_upadte" value="0">
							<div class="form-group">
								<label class="col-sm-2 control-label">用户名 </label>
								<div class="col-sm-6">
									<input type="text" id="admin_name_upadte" name="admin_name" class="form-control" placeholder="管理员名称" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;码</label>
								<div class="col-sm-6">
									<input type="password" name="admin_password" id="admin_password_upadte" class="form-control" placeholder="管理员密码" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">权限组</label>
								<div class="col-sm-6">
									<select class="form-control m-b" name="admin_gid" id="admin_gid_update" required>
										<option value="">请选择</option>
									</select>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									关闭
								</button>
								<button type="submit" id="classSave" class="btn btn-primary">
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
				fGroup();					
				fList();
			});
			function fGroup(){
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appAdminAccount/roleList",
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(ret.length == 0){
							document.getElementById('admin_gid_add').innerHTML = '<option value="">无</option>';
							document.getElementById('admin_gid_update').innerHTML = '<option value="">无</option>';
						}else{
							for(var i=0;i<ret.length;i++){
								document.getElementById('admin_gid_add').innerHTML += '<option value="'+ ret[i]['id'] +'">'+ ret[i]['name'] +'</option>';
								document.getElementById('admin_gid_update').innerHTML += '<option value="'+ ret[i]['id'] +'">'+ ret[i]['name'] +'</option>';
							}
						}
					}
				});	
			}
			function fTable(){
				$('.dataTables-example').dataTable();
			}
			function fList(){
				document.getElementById('dTable').innerHTML = '';
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appAdminAccount/adminList",
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(ret.length == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																	 	+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																	  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								document.getElementById('dTable').innerHTML += '<tr class="gradeX">'
													+'<td>'+ (i+1) +'</td>'
													+'<td class="center">'+ ret[i]['admin_name'] +'</td>'
													+'<td class="center">'+ ret[i]['admin_login_num'] +'</td>'
													+'<td class="center">'+ ret[i]['admin_login_time'] +'</td>'
													+'<td class="center">'+ ret[i]['role_name'] +'</td>'
													+'<td class="center">'
														+'<a href="javascript:void(0)">'
															+'<button type="button" onclick="fDetail('+ ret[i]['admin_id'] +')" class="btn btn-primary btn-sm">'
																+'<i class="fa fa-edit"></i>'
																+'&nbsp;编辑'
															+'</button>'
														+'</a>&nbsp;'
														+'<button onclick="fDelete('+ ret[i]['admin_id'] +',\'admin\')" type="button" class="btn btn-danger btn-sm">'
															+'<i class="fa fa-trash-o"></i>'
															+'&nbsp;删除'
														+'</button>'
													+'</td>'
												+'</tr>';
							}	
						}	
					}
				});
				fTable();
			}
			function fDelete(param1,param2) {
				fuConfirm(param1,param2);
			} 
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminAccount/adminDelete",
					data:{admin_id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						console.log(obj);
						if(obj.res == 0){
							fuError();
						}else{
							fuCloseLayer();
							fuClose();
							fList();
						}
					}
				});
			}
			function fuSure(param1,param2){
				if(param2 == 'admin'){
					fDelete2(param1);
				}
			}
			function fDetail(param1){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminAccount/adminDetail",
					data:{admin_id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							document.getElementById('admin_name_upadte').value = ret['admin_name'];
							document.getElementById('admin_password_upadte').value = ret['admin_password'];
							document.getElementById('admin_id_upadte').value = ret['admin_id'];
							$("#Modal_admin_detail").modal("show");
						}
					}
				});
			}
			function fUpdate(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminAccount/adminUpdate",
					data:$("#Form_admin_detail").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							$("#Modal_admin_detail").modal("hide");
							fList();
						}
					}
				});
				return false;
			}
			function fAdd(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminAccount/adminAdd",
					data:$("#Form_admin").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							$("#Modal_admin").modal("hide");
							document.getElementById("Form_admin").reset();
							fList();
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>