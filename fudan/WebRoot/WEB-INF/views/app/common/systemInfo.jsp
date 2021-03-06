<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="styleUrl.jsp" %>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<%@ include file="css.jsp" %>
		<%@ include file="js.jsp" %>
		<script src="${jypath}/app/js/file/ajaxfileupload.js"></script>
		<style>
			html,body{
				font-family:Arial,'微软雅黑','黑体',sans-serif !important;
				min-height:500px !important;
			}
		</style>
	</head>
	<%@ include file="toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>信息修改</h2>
            </div>
        </div>
        <div class="ibox-content">
        	<div class="col-lg-8">
				<ul class="nav nav-tabs" role="tablist" id="myTab">
						<li role="presentation" class="active">
							<a href="#home" role="tab" data-toggle="tab">头像设置</a>
						</li>
						<li role="presentation">
							<a href="#profile" role="tab" data-toggle="tab">个人资料</a>
						</li>
						<li role="presentation">
							<a href="#messages" role="tab" data-toggle="tab">密码管理</a>
						</li>
					</ul>
					<div class="tab-content">
						<!-- tab1 -->
						<div role="tabpanel" class="tab-pane active" id="home" style="padding:10px;text-align:center;position:relative;">
							</br>
							</br>
							<c:if test="${admin.admin_avator == '' || admin.admin_avator == null}">
								<img src="${jypath }/pc/image/user/user.png" id="dImage" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
							</c:if>
							<c:if test="${admin.admin_avator != '' && admin.admin_avator != null}">
								<img src="<%=imgUrl%>image/admin/${admin.admin_id}/${admin.admin_avator}" id="dImage" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
							</c:if>
							<div style="position:relative;display: inline;">
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
						<!-- tab2 -->
						<div role="tabpanel" class="tab-pane" id="profile" style="padding:10px;">
							<form id="systemInfoForm1" class="form-horizontal" >
								<input type="hidden" id="admin_id" name="admin_id" value="${admin.admin_id }">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-1 control-label">登&nbsp;录&nbsp;名</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="loginName" value="${admin.admin_name }" readonly="readonly" placeholder="登录名">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">用&nbsp;户&nbsp;名</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="name" name="name" value="${admin.name }" minlength="1" maxlength="20" placeholder="用户名修改">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">用户角色</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="roleId" value="${admin.role_name }" readonly="readonly" placeholder="用户角色">
									</div>
								</div>
<%-- 								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">登录IP</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="loginIP" value="${account.loginIP }" readonly="readonly" placeholder="登录IP">
									</div>
								</div>
 --%>								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">登录时间</label>
									<div class="col-sm-11">
										<input type="text" class="form-control" id="admin_login_time" value="${admin.admin_login_time }" readonly="readonly" placeholder="登录时间">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">
										关闭
									</button>
									<button type="button" class="btn btn-primary" onclick="fSave()">
										保存
									</button>
								</div>
							</form>
						</div>
						<!-- tab3 -->
						<div role="tabpanel" class="tab-pane" id="messages" style="padding:10px;">
							<form id="systemInfoForm2" class="form-horizontal" role="form" onsubmit="return fSavePwd()">
								<input type="hidden" name="admin_id" value="${admin.admin_id }">
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
									<div class="col-sm-11">
										<input type="password" class="form-control" id="pwd0" name="admin_password" maxlength="30" placeholder="输入新密码" required>
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-1 control-label">确认密码</label>
									<div class="col-sm-11">
										<input type="password" class="form-control" id="pwd1" maxlength="30" placeholder="再次输入密码" required>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">
										关闭
									</button>
									<button type="submit" class="btn btn-primary">
										保存
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				$("#fSettingInfo").modal("show");
			}); 
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
								imgObjPreview.style.width = '146px';
								imgObjPreview.style.height = '140px';
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
								localImagId.style.width = "146px";
								localImagId.style.height = "140px";
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
					url:"${jypath}/appAdminLogin/adminAvatorModify",
					ecureuri:false,
			    	fileElementId: "FileInput",
					dataType:"JSON",
					data:{admin_id:${admin.admin_id}},
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							alert(obj.resMsg);
						}else{
							document.getElementById("buttonSuccess").style.display = "block";//显示完成按钮
							fuShowSuccess();
							fuCloseLayer();
						}
					}
				});
			}
			function fSave(){
				fuLoading();
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appAdminLogin/adminUpdate",
					data: $("#systemInfoForm1").serialize(),
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							alert(obj.resMsg);
						}else{
							fuShowSuccess();
							fuCloseLayer();
						}
					}
				}); 
			}
			function fSavePwd(){
				fuLoading();
				var lPwd0 = document.getElementById('pwd0').value;
				var lPwd1 = document.getElementById('pwd1').value;
				if(lPwd0 != lPwd1){
					fuError('两次输入的密码不相同!');
					fuCloseLayer();
				}else{
					$.ajax({
						type:"post",
						async:false,
						url:"${jypath}/appAdminLogin/adminUpdate",	
						data: $("#systemInfoForm2").serialize(),
						success:function(data){
							var obj = eval('('+ data +')');
							if(obj.res == 0){
								fuError(obj.resMsg);
							}else{
								fuShowSuccess();
							}
							fuCloseLayer();
						}
					}); 
				}
				return false;
			}
		</script>
	</body>
</html>