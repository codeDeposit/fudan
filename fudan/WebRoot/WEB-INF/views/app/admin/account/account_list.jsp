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
                <h2>用户列表</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	用户管理
                    </li>
                    <li>
                        <strong>用户列表</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
			        <div class="ibox-title">
						<div class="col-lg-1">
			            	<span class="label label-info" style="color:#fff;" >用户总数：<span id="dom_total">0</span></span>
			          	</div>
			          	<div class="col-lg-1">
			           		<span class="label label-info">本周新增：0</span>
			          	</div>
			          	<div class="col-lg-10" style="text-align:right;margin-top:-20px;">
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#modal_account_add"><i class="fa fa-plus"></i>&nbsp;添加用户</button>
			           	</div>
				    </div>	
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th style="width:60px;">用户名</th>
									<th>头像</th>
									<th style="width:60px;">真实姓名</th>
									<th>身份证号</th>
									<th>邮箱</th>
									<th>手机号</th>
									<th>登陆次数</th>
									<th>注册时间</th>
									<th>等级</th>
									<th>积分</th>
									<th>紧急联络人</th>
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
		
		<div class="modal fade" id="modal_account_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">用户添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_account_add" onsubmit="return fSubmit()">
							<div class="form-group">
								<label class="col-sm-2 control-label">手机号 </label>
								<div class="col-sm-6">
									<input type="text" name="mobile" id="mobile" class="form-control" placeholder="手机号" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">登录密码</label>
								<div class="col-sm-6">
									<input type="password" name="password" id="password" class="form-control" placeholder="登录密码" minlength="6" required>
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
		
		<div class="modal fade" id="modal_account_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">用户修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_account_update" onsubmit="return fUpdate()">
							<input type="hidden" name="id" id="id" value="0">
							<div class="form-group">
								<label class="col-sm-2 control-label">手机号 </label>
								<div class="col-sm-6">
									<input type="text" readonly="true" id="mobile" class="form-control" placeholder="手机号" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密码重置</label>
								<div class="col-sm-6">
									<input type="password" name="password" id="password" onchange="fCheckPassWord()" class="form-control" placeholder="密码重置" minlength="6" required>
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
				fList();
			});
			function fTable(){
				$('.dataTables-example').dataTable();
			}
			function fList(){
				document.getElementById('dTable').innerHTML = '';
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appMember/list",
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(ret.length == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																		 	+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																		  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								document.getElementById("dom_total").innerHTML = ret.length;
								//用户头像
								var memberAvatar = "";
								if(ret[i]['avatar'] == null){
									memberAvatar = '<a class="fancybox" target="_blank" href="${jypath}/app/img/user.png" title="'+ ret[i]['avatar'] +'">'
                              							+'<img style="width:30px;height:30px;" alt="image" src="${jypath}/app/img/user.png" />'
					                                +'</a>';
								}else{
									memberAvatar = '<a class="fancybox" target="_blank" href="${jypath}/app/img/user.png" title="'+ ret[i]['avatar'] +'">'
														+'<img style="width:30px;height:30px;" alt="image" src="${jypath}/app/img/user.png" />'
					                                +'</a>';
								}
								var emailStr = "";
								if(ret[i]['email'] == null){
									emailStr = "无";
								}else{
									emailStr = ret[i]['email'];
								}
								var trueNameStr = "";
								if(ret[i]['true_name'] == null){
									trueNameStr = "无";
								}else{
									trueNameStr = ret[i]['true_name'];
								}
								var nameStr = "";
								if(ret[i]['name'] == null){
									nameStr = "无";
								}else{
									nameStr = ret[i]['name'];
								}
								var contactStr = "";
								if(ret[i]['contact'] == null){
									contactStr = "无";
								}else{
									contactStr = ret[i]['contact'];
								}
								document.getElementById('dTable').innerHTML += '<tr class="gradeX">'
													+'<td>'+ (i+1) +'</td>'
													+'<td><a href="../appAdminAccount/detail">'+ nameStr +'</a></td>'
													+'<td>'
													+ memberAvatar
													+'</td>'
													+'<td class="center">'+ trueNameStr +'</td>'
													+'<td class="center">'+ ret[i]['card'] +'</td>'
													+'<td class="center">'+ emailStr +'</td>'
													+'<td class="center">'+ ret[i]['mobile'] +'</td>'
													+'<td class="center">'+ ret[i]['login_num'] +'</td>'
													+'<td class="center">'+ ret[i]['time'] +'</td>'
													+'<td class="center">'+ ret[i]['level_id'] +'</td>'
													+'<td class="center">'+ ret[i]['points'] +'</td>'
													+'<td class="center">'+ contactStr +'</td>'
													+'<td class="center">'
														+'<a href="javascript:void(0)">'
															+'<button type="button" onclick="fDetail('+ ret[i]['id'] +',2)" class="btn btn-primary btn-sm">'
																+'<i class="fa fa-edit"></i>'
																+'&nbsp;编辑'
															+'</button>'
														+'</a>&nbsp;'
														+'<button onclick="fDelete('+ ret[i]['id'] +',\'account\')" type="button" class="btn btn-danger btn-sm">'
															+'<i class="fa fa-trash-o"></i>'
															+'&nbsp;删除'
														+'</button>'
													+'</td>'
												+'</tr>';
							}
							fTable();	
						}	
					}
				});
			}
			function fDelete(param1,param2) {
				fuConfirm(param1,param2);
			} 
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appMember/delete",
					data:{id:param1},
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
				if(param2 == 'account'){
					fDelete2(param1);
				}
			}
			function fDetail(param1,param2){
				if(param2 == 1){
					document.getElementById('classSave').style.display = 'none';
				}else{
					document.getElementById('classSave').style.display = 'inline';
				}
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appMember/detail",
					data:{id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							document.getElementById('id').value = ret['id'];
							document.getElementById('mobile').value = ret['mobile'];
							$("#modal_account_detail").modal("show");
						}
					}
				});
			}
			function fUpdate(){
				if(fCheckPassWord() == true){
					$.ajax({
						type : "post",
						async : false,
						url : basePath+"appMember/update",
						data:$("#Form_account_update").serialize(),
						success : function(data) {
							var obj = eval('('+ data +')');
							var ret = obj.obj;	
							if(obj.res == 0){
								fuError();
							}else{
								$("#modal_account_detail").modal("hide");
								fList();
							}
						}
					});
					return false;
				}
			}
			function fPwdCheck() {//必须为字母加数字且长度不小于8位
				var str = document.getElementById('password').value;
				if (str == null || str.length < 6) {
					return false;
				}
				var reg1 = new RegExp(/^[0-9A-Za-z]+$/);
				if (!reg1.test(str)) {
					return false;
				}
				var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
				if (reg.test(str)) {
					return true;
				} else {
					return false;
				}
			}
			//密码检查
			function fCheckPassWord() {
				var pd = fPwdCheck();
				if (pd == false) {
					alert('请输入6 - 20位字母、数字');
					return false;
				} else {
					return true;
				}
			}
			function fSubmit(){
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appMember/add?",
					data:$("#Form_account").serialize(),
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fList();
							$("#modal_account_add").modal("hide");
						}
					}
				});
				return false;		
			}
		</script>
	</body>
</html>