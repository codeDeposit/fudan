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
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>药师列表</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	医师管理
                    </li>
                    <li>
                        <strong>药师列表</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
			        <div class="ibox-title">
			          	<div class="col-lg-12" style="text-align:right;margin-top:-20px;">
							<button data-toggle="modal" data-target="#Modal_doctor"  class="btn btn-primary" type="button"><i class="fa fa-plus"></i>&nbsp;添加药师</button>
			           	</div>
				    </div>	
					<div class="ibox-content">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>头像</th>
									<th style="width:60px;">名称</th>
									<th>手机号</th>
									<th>注册时间</th>	
									<th>专业</th>
									<th>职位</th>
									<th style="width:60px;">擅长</th>
									<th style="width:60px;">简介</th>
									<th>状态</th>
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
		<div class="modal fade" id="Modal_doctor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">药师添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_doctor" onsubmit="return fAdd()">
							<input type="hidden" id="jobState" name="jobState" value="2">
							<div class="form-group">
								<label class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 </label>
								<div class="col-sm-10">
									<input type="text" name="name" class="form-control" placeholder="药师姓名" maxlength="50" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">手机号码</label>
								<div class="col-sm-10">
									<input type="number" name="mobile" class="form-control" maxlength="11" placeholder="号码为登录账号" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
								<div class="col-sm-10">
									<input type="password" name="passWord" maxlength="255" class="form-control" placeholder="登录密码" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</label>
								<div class="col-sm-10">
									<input type="text" name="jobClass"  maxlength="244" class="form-control" placeholder="专业名称" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</label>
								<div class="col-sm-10">
									<input type="text" name="job" maxlength="255" class="form-control" placeholder="职位名称" required>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</label>
								<div class="col-sm-10">
									<textarea style="height:120px;width:100%" maxlength="1000" name="info" class="form-control" placeholder="药师简介(1000字)" required></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">擅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长</label>
								<div class="col-sm-10">
									<textarea style="height:120px;width:100%" maxlength="1000" name="infoGood" class="form-control" placeholder="擅长方面(1000字)" required></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${jypath }/pc/image/user/user.png" id="dImage" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:14%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl" id="FileInput" onchange="javascript:setImagePreview();"  style="filter:alpha(opacity:1);opacity:0;width:124px;height:113px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									</br>
									</br>
									<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片,200*200px,大小不超过4M</small></p>
									</br>
									<button type="button" id="buttonUpload" class="btn btn-info btn-sm" onclick="fUpload()" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
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
			var _pd = 0;//图片上传判断
			var _imgSrc = '';//图片路径
			
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
					url:"${jypath}/appAdminDoctor/doctorList",
					data:{jobState:2},
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(ret.length == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																	 	+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																	  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								if(ret[i]['state'] == 1){
									var stateStr = '<td class="center text-info">已通过</td>';
									var buttonStr = '';
								}else if(ret[i]['state'] == 2){
									var stateStr = '<td class="center text-danger">已拒绝</td>';
									var buttonStr = '';
								}else{
									var stateStr = '<td class="center text-success">审核中</td>';
									var buttonStr = '<button onclick="fUpdate('+ ret[i]['id'] +',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-trash-o"></i>'
														+'&nbsp;通过'
													+'</button>&nbsp;'
													+'<button onclick="fUpdate('+ ret[i]['id'] +',2)" type="button" class="btn btn-default btn-sm">'
														+'<i class="fa fa-trash-o"></i>'
														+'&nbsp;拒绝'
													+'</button>';
								}
								document.getElementById('dTable').innerHTML += '<tr class="gradeX">'
													+'<td>'+ (i+1) +'</td>'
													+'<td class="center"><img src='+ ret[i]['picture'] +' height="40px" width="40px"></td>'
													+'<td class="center">'+ ret[i]['name'] +'</td>'
													+'<td class="center">'+ ret[i]['mobile'] +'</td>'
													+'<td class="center">'+ ret[i]['addTime'] +'</td>'
													+'<td class="center">'+ ret[i]['jobClass'] +'</td>'
													+'<td class="center">'+ ret[i]['job'] +'</td>'
													+'<td class="center"><div style="width:150px;height:50px;overflow:hidden; word-break:keep-all;text-overflow: ellipsis;" title="'+ ret[i]['infoGood'] +'">'+ ret[i]['infoGood'] +'</div></td>'
													+'<td class="center"><div style="width:150px;height:50px;overflow:hidden; word-break:keep-all;text-overflow: ellipsis;" title="'+ ret[i]['info'] +'">'+ ret[i]['info'] +'</div></td>'
													+ stateStr
													+'<td class="center">'
														+'<a href="../appAdminDoctor/seniorDetailPage?'+ ret[i]['id'] +'">'
															+'<button type="button" class="btn btn-primary btn-sm">'
																+'<i class="fa fa-edit"></i>'
																+'&nbsp;编辑'
															+'</button>'
														+'</a>&nbsp;'
														+'<button onclick="fDelete('+ ret[i]['id'] +',\'doctor\')" type="button" class="btn btn-danger btn-sm">'
															+'<i class="fa fa-trash-o"></i>'
															+'&nbsp;删除'
														+'</button>&nbsp;'
														+ buttonStr
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
					url : basePath+"appAdminDoctor/doctorDelete",
					data:{id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
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
				if(param2 == 'doctor'){
					fDelete2(param1);
				}
			}
			function fUpdate(param,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminDoctor/doctorUpdate",
					data:{id:param,state:param2},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							fList();
						}
					}
				});
				return false;
			}
			function fUpdate2(param,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminDoctor/doctorUpdate",
					data:$("#Form_doctor_edit").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							$("#Modal_doctor_detail").modal("hide");
							fList();
						}
					}
				});
				return false;
			}
			function fAdd(){
				if(_pd == 1){
					$.ajax({
						type : "post",
						async : false,
						url : basePath+"appAdminDoctor/doctorAdd?picture=" + _imgSrc,
						data:$("#Form_doctor").serialize(),
						success : function(data) {
							var obj = eval('('+ data +')');
							var ret = obj.obj;	
							if(obj.res == 0){
								fuError();
							}else{
								$("#Modal_doctor").modal("hide");
								document.getElementById("Form_doctor").reset();
								document.getElementById("dImage").src = "${jypath }/pc/image/user/user.png";
								document.getElementById('buttonUpload').disabled = true;
								document.getElementById("buttonSuccess").style.display = "none";//隐藏完成按钮
								document.getElementById("buttonUpload").style.display = "block";//隐藏完成按钮
								_pd = 0;
								fList();
							}
						}
					});
				}else{
					fuError('请上传图片');
				}
				return false;
			}
			function setImagePreview(){//下面用于图片上传预览功能
				var docObj = document.getElementById("FileInput");
				var imgObjPreview = document.getElementById("dImage");
				var ldot = docObj.value.lastIndexOf(".");
		        var type = docObj.value.substring(ldot + 1);
				if(docObj.value.length > 1 && docObj.value) {     
					if(type == "JPG" || type == "jpg" || type == "jpeg" || type == "JPEG" || type == "ico" || type == "ICO" || type == "png" || type == "PNG") {
						if(docObj.size > 4194304){//文件大小判断
							alert("图片大小不能超过4M");
							docObj.outerHTML = input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
							document.getElementById('FileInput').value = "";
						}else{
							$('#buttonUpload').removeAttr("disabled"); //上传按钮启用
							document.getElementById("buttonUpload").style.display = "block";//上传按钮显示
							$('#buttonSuccess').attr('disabled',"true");//完成按钮禁用
							document.getElementById("buttonSuccess").style.display = "none";//隐藏完成按钮
							if(docObj.files &&docObj.files[0])
							{
								//火狐下，直接设img属性
								/* imgObjPreview.style.display = 'block'; */
								imgObjPreview.style.width = '80px';
								imgObjPreview.style.height = '80px';
								//imgObjPreview.src = docObj.files[0].getAsDataURL();
								//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
								imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
							}
							else
							{
								//IE下，使用滤镜
								docObj.select();
								var imgSrc = document.selection.createRange().text;
								var localImagId = document.getElementById("dImage");
								//必须设置初始大小
								localImagId.style.width = "80px";
								localImagId.style.height = "80px";
								//图片异常的捕捉，防止用户修改后缀来伪造图片
								try{
									localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
									localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
								}
								catch(e)
								{
									alert("您上传的图片格式不正确，请重新选择!");
									return false;
								}
								document.selection.empty();
							}
						}
					}else{
						alert("您上传的图片格式不正确，请重新选择!");
						docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
						document.getElementById('FileInput').value = "";
					}
				}else{
					docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
					document.getElementById('FileInput').value = "";
				}	
				return true;
			}
			function fUpload(){//图片上传
				fuLoading();
				document.getElementById("buttonUpload").style.display = "none";//上传按钮隐藏
				$('#buttonUpload').attr('disabled',"true");//上传按钮禁用
				$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminDoctor/updatePicture",
					ecureuri:false,
			    	fileElementId: "FileInput",
					dataType:"JSON",
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError(obj.resMsg);
							_pd = 0;
						}else{
							_imgSrc = obj.obj;
							_pd = 1;
							document.getElementById("buttonSuccess").style.display = "block";//显示完成按钮
							fuShowSuccess();
							fuCloseLayer();
						}
					}
				});
			}
		</script>
	</body>
</html>