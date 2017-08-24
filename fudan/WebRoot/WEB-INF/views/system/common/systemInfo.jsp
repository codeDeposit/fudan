<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="styleUrl.jsp" %>
<%@ include file="toast.jsp"%>
<script src="${jypath}/pc/js/file/ajaxfileupload.js"></script>
<div class="modal fade" id="fSettingInfo" style="z-index:99999999999999999">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">个人设置</h4>
			</div>
			<div class="modal-body">	
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
						<c:if test="${account.picUrl == null}">
							<img src="${jypath }/pc/image/user/user.png" id="dImage" style="width:24%;background-color:#dfdfdf" class="img-thumbnail">
						</c:if>
						<c:if test="${account.picUrl != null}">
							<img src="<%=imgUrl%>image/account/${account.loginName}/${account.picUrl}" id="dImage" style="width:24%;background-color:#dfdfdf" class="img-thumbnail">
						</c:if>
						<img src="${jypath }/pc/image/setting/add.png" style="width:14%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
						<input type="file" name="picUrl" id="FileInput" onchange="javascript:setImagePreview();"  style="filter:alpha(opacity:1);opacity:0;width:75px;height:71px;position:absolute;top:80px;right:138px;cursor:pointer">
						</br>
						</br>
						<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片，大小不超过4M</small></p>
						</br>
						<button type="button" id="buttonUpload" class="btn btn-info btn-sm" onclick="fUpload()" disabled="false" style="margin:0 auto;">图片上传</button>
						<button type="button" id="buttonSuccess" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
					</div>
					<!-- tab2 -->
					<div role="tabpanel" class="tab-pane" id="profile" style="padding:10px;">
						<form id="systemInfoForm1" class="form-horizontal" >
							<input type="hidden" id="accountId" name="accountId" value="${account.id }">
							<input type="hidden" id="isValid" name="isValid" value="${account.isValid }">
							<input type="hidden" id="roleId" name="roleId" value="${account.roleId }">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">登录名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="loginName" value="${account.loginName }" readonly="readonly" placeholder="登录名">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="name" name="name" value="${account.name }" minlength="1" maxlength="20" placeholder="用户名修改">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">电子邮箱</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="email" name="email" value="${account.email }" minlength="1" maxlength="20" placeholder="电子邮箱" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">用户角色</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="roleId" value="${account.roleName }" readonly="readonly" placeholder="用户角色">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">登录IP</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="loginIP" value="${account.loginIP }" readonly="readonly" placeholder="登录IP">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">登录时间</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="loginTime" value="${account.loginTime }" readonly="readonly" placeholder="登录时间">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									关闭
								</button>
								<button type="button" class="btn btn-success" onclick="fSave()">
									保存
								</button>
							</div>
						</form>
					</div>
					<!-- tab3 -->
					<div role="tabpanel" class="tab-pane" id="messages" style="padding:10px;">
						<form id="systemInfoForm2" class="form-horizontal" role="form" onsubmit="return fSavePwd()">
							<input type="hidden" name="accountId" value="${account.id }">
							<input type="hidden" name="isValid" value="${account.isValid }">
							<input type="hidden" name="roleId" value="${account.roleId }">
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">旧密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="pwd0" name="pwd0" maxlength="30" placeholder="输入旧密码" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">新密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="pwd1" name="password" minlength="6" maxlength="30" placeholder="输入新密码" required>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="pwd2" minlength="6" maxlength="30" placeholder="再次输入密码" required>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									关闭
								</button>
								<button type="submit" class="btn btn-success">
									保存
								</button>
							</div>
						</form>
					</div>
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
			url: "${jypath}/backstage/account/accountModify",
			ecureuri:false,
	    	fileElementId: "FileInput",
			dataType:"JSON",
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
			url:"${jypath}/backstage/account/update",
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
		var lPwd2 = document.getElementById('pwd2').value;
		if(lPwd1 != lPwd2){
			fuError('两次输入的密码不相同!');
			fuCloseLayer();
		}else{
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/backstage/account/checkOldPwd",	
				data: {
					lPwd0:lPwd0,
					lPwd1:lPwd1,
					lPwd2:lPwd2
				},
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