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
                <h2>医生详情</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	医师管理
                    </li>
                    <li>
                        <strong>医生详情</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="row">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
							<form class="form-horizontal aForm" role="form" id="Form_doctor_edit" onsubmit="return fSubmit()">
								<input type="hidden" name="id" id="id" value="${list.id }">
								<div class="form-group">
									<label class="col-sm-1 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 </label>
									<div class="col-sm-10">
										<input type="text" id="name" name="name" value="${list.name }" class="form-control" placeholder="医生姓名" maxlength="50" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">手机号码</label>
									<div class="col-sm-10">
										<input type="number" name="mobile" id="mobile" value="${list.mobile }" class="form-control" maxlength="11" placeholder="号码为登录账号" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
									<div class="col-sm-10">
										<input type="password" name="passWord" id="passWord" value="${list.passWord }" maxlength="255" class="form-control" placeholder="登录密码" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业</label>
									<div class="col-sm-10">
										<input type="text" name="jobClass" id="jobClass" value="${list.jobClass }" maxlength="244" class="form-control" placeholder="专业名称" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</label>
									<div class="col-sm-10">
										<input type="text" name="job" id="job" value="${list.job }" maxlength="255" class="form-control" placeholder="职位名称" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</label>
									<div class="col-sm-10">
										<textarea style="height:120px;width:100%" maxlength="1000" name="info" id="info" class="form-control" placeholder="医生简介(1000字)" required>${list.info }</textarea >
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">擅&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长</label>
									<div class="col-sm-10">
										<textarea style="height:120px;width:100%" maxlength="1000" name="infoGood" id="infoGood" class="form-control" placeholder="擅长方面(1000字)" required>${list.infoGood }</textarea >
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label">照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片</label>
									<div class="col-sm-10">
										<div style="position:relative;display: inline;">
											<c:if test="${list.picture == NULL}">
												<img src="${jypath }/pc/image/user/user.png" id="dImage" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
											</c:if>
											<c:if test="${list.picture != NULL}">
												<img src="${list.picture}" id="dImage" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
											</c:if>
											<img src="${jypath }/pc/image/setting/add.png" style="width:14%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
											<input type="file" name="picUrl" id="FileInput" onchange="javascript:setImagePreview();" style="filter:alpha(opacity:1);opacity:0;width:124px;height:113px;position:absolute;top:-47px;right:16%;cursor:pointer">
										</div>
										</br>
										</br>
										<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片,200*200px,大小不超过4M</small></p>
										</br>
										<button type="button" id="buttonUpload" class="btn btn-info btn-sm" onclick="fUpload()" disabled="false" style="margin:0 auto;">图片上传</button>
										<button type="button" id="buttonSuccess" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
									</div>
								</div>
								<div class="form-group border-top white-bg dashboard-header" style="margin-top:60px">
									<div class="col-sm-6 text-right">
										<a href="../appAdminDoctor/doctorPage"><button type="button" class="btn btn-w-m btn-default">返回</button></a>
									</div>
									<div class="col-sm-6 text-left">
										<button type="submit" class="btn btn-w-m btn-primary">保存</button>
									</div>
								</div>
							</form>
					</div>
				</div>
			</div>
		</div>
		<script>
			var _modify = 0;
			var _pd = 0;//图片上传判断
			var _imgSrc = '';//图片路径
			$(document).ready(function(){
				parent.scrollTo(0,0);
			})
			function fSubmit(){
				if(_modify == 0){
					$.ajax({
						type : "post",
						async : false,
						url : basePath+"appAdminDoctor/doctorUpdate?picture=" + _imgSrc,
						data:$("#Form_doctor_edit").serialize(),
						success : function(data) {
							var obj = eval('('+ data +')');
							var ret = obj.obj;	
							if(obj.res == 0){
								fuError();
							}else{
								window.location.href = '../appAdminDoctor/doctorPage';
							}
						}
					});
				}else{
					if(_pd == 1){
						$.ajax({
							type : "post",
							async : false,
							url : basePath+"appAdminDoctor/doctorUpdate?picture=" + _imgSrc,
							data:$("#Form_doctor_edit").serialize(),
							success : function(data) {
								var obj = eval('('+ data +')');
								var ret = obj.obj;	
								if(obj.res == 0){
									fuError();
								}else{
									window.location.href = '../appAdminDoctor/doctorPage';
								}
							}
						});
					}else{
						fuError('请上传图片');
					}
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
								imgObjPreview.style.width = '180px';
								imgObjPreview.style.height = '180px';
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
								localImagId.style.width = "180px";
								localImagId.style.height = "180px";
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