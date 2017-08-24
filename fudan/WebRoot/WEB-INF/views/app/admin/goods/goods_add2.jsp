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
		<link rel="stylesheet" href="${jypath}/app/css/plugins/webuploader/webuploader.css"> 
		<link rel="stylesheet" href="${jypath}/app/css/file/style.css"> 
		<link href="${jypath}/app/css/plugins/steps/jquery.steps.css" rel="stylesheet">
		<script src="${jypath}/app/js/plugins/webuploader/webuploader.min.js"></script>
		<script src="${jypath}/app/js/file/upload2.js"></script>
		<script src="${jypath}/pc/js/file/ajaxfileupload.js"></script>
		<style>
			.demo{min-width:360px;margin:30px auto;padding:10px 20px}
			.demo h3{line-height:40px; font-weight: bold;}
			.file-item{float: left; position: relative; width: 110px;height: 110px; margin: 0 20px 20px 0; padding: 4px;}
			.file-item .info{overflow: hidden;}
			.uploader-list{width: 100%; overflow: hidden;}
		</style>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body id="dom_body">
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
				<h2>商品添加</h2>
				<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
					<li>
						<a href="../appAdminLogin/statistics">主页</a>
					</li>
					<li>
						药品商城
					</li>
					<li>
						<strong>商品添加</strong>
					</li>
				</ol>
			</div>
        </div>
	    <div class="ibox-content">
	    	<div id="wizard" role="application" class="wizard clearfix">
				<div class="steps clearfix">
					<ul role="tablist">
						<li role="tab" class="disabled" aria-disabled="true" aria-selected="true">
							<a id="wizard-t-0" href="#wizard-h-0" aria-controls="wizard-p-0"><span class="number">1.</span> 商品基本信息</a>
						</li>
						<li role="tab" class="first current" aria-disabled="false">
							<a id="wizard-t-1" href="#wizard-h-1" aria-controls="wizard-p-1"><span class="number">2.</span> 图文详情、说明书</a>
						</li>
						<li role="tab" class="disabled last" aria-disabled="true">
							<a id="wizard-t-2" href="#wizard-h-2" aria-controls="wizard-p-2"><span class="number">3.</span> 添加成功</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="hr-line-dashed"></div>
	    	<div class="form-group col-sm-12">
	    		<label class="col-sm-2 control-label"><span style="color:red;">*</span>说明书</label>
	    		<div class="col-sm-10">
					<img src="${jypath }/app/img/shuomingshu.png" id="dImage" style="background-color:#dfdfdf;">
					<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片，大小不超过4M,宽度为800像素</small></p>
					<input type="file" name="imgDesc" id="imgDesc" onchange="javascript:setImagePreview();" style="cursor:pointer">
				 </div>
            </div>
	    	<div class="form-group col-sm-12">
                <label class="col-sm-2 control-label"><span style="color:red;">*</span>图文详情</label>
                <div class="col-sm-8">
	                <div class="demo">
			            <div id="uploader">
			                <div class="queueList">
			                    <div id="dndArea" class="placeholder">
			                        <div id="filePicker"></div>
			                        <p>或将照片拖到这里，单次最多可选20张</p>
			                    </div>
			                </div>
			                <div class="statusBar" style="display:none;">
			                    <div class="progress">
			                        <span class="text">0%</span>
			                        <span class="percentage"></span>
			                    </div><div class="info"></div>
			                    <div class="btns">
			                        <div id="filePicker2"></div><div class="uploadBtn" onclick="fUploadMark()">开始上传</div>
			                    </div>
			                </div>
			            </div>
			            <span class="help-block m-b-none" style="margin-left:4%;color:#F86B4F;letter-spacing:2px;">上传宽为800px的jpg格式图片.</span>
			        </div>
              	</div>
	    	</div>
               <div class="col-sm-10" style="text-align:right;margin-bottom:120px;">
				 <button class="btn btn-primary" onclick="fSubmit()">下一步</button>
			</div>
	    </div>
	</body>
	<script>
		var _pd = 0;//是否已上传图片
		var _size = true;//图片大小判断
		var _type = true;//图片类型判断
		$(document).ready(function() {
			parent.scrollTo(0,0);
		});
		function fUploadMark(){
			_pd = 1;
		}
		function fSubmit(){
			if(_pd == 0){
				fuError('请上传产品图片');
			}else if(_size == 4){
				fuError('图片大小不能超过4M');
			}else{
				var ids = ['imgDesc'];
				$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminGoods/addImgDesc?goods_id=" + ${mark},
					ecureuri:false,
			    	fileElementId:ids,
					dataType:"JSON",
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fSuccess();
						}
					}
				});
		   }
		}
		function fSuccess(){
			parent.scrollTo(0,0);
			document.getElementById('dom_body').innerHTML = '<div class="row wrapper border-bottom white-bg page-heading">'
													           +'<div class="col-lg-10">'
																	+'<h2>商品添加</h2>'
																	+'<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">'
																		+'<li>'
																			+'<a href="../appAdminLogin/statistics">主页</a>'
																		+'</li>'
																		+'<li>'
																			+'药品商城'
																		+'</li>'
																		+'<li>'
																			+'<strong>商品添加</strong>'
																		+'</li>'
																	+'</ol>'
																+'</div>'
													        +'</div>'
														    +'<div class="ibox-content">'
														    	+'<div id="wizard" role="application" class="wizard clearfix">'
																	+'<div class="steps clearfix">'
																		+'<ul role="tablist">'
																			+'<li role="tab" class="disabled" aria-disabled="false" aria-selected="true">'
																				+'<a id="wizard-t-0" href="#wizard-h-0" aria-controls="wizard-p-0"><span class="number">1.</span> 商品基本信息</a>'
																			+'</li>'
																			+'<li role="tab" class="disabled" aria-disabled="true">'
																				+'<a id="wizard-t-1" href="#wizard-h-1" aria-controls="wizard-p-1"><span class="number">2.</span> 图文详情、说明书</a>'
																			+'</li>'
																			+'<li role="tab" class="first current" aria-disabled="true">'
																				+'<a id="wizard-t-2" href="#wizard-h-2" aria-controls="wizard-p-2"><span class="number">3.</span> 添加成功</a>'
																			+'</li>'
																		+'</ul>'
																	+'</div>'
																+'</div>'
														        +'<div style="width:16%;margin:0 auto;height:30px;color:#fff;line-height:30px;border-radius:37px;text-align:center;font-size:16px;margin-bottom:200px;margin-top:160px;background-color:#1ab394">'
														        	+'<i class="fa fa-check"></i>&nbsp;操作成功'
														        +'</div>'
														   	+'</div>';
							   setTimeout('window.location.href = "../appAdminGoods/list";',1000);
		}
		function setImagePreview(){//下面用于图片上传预览功能
			var docObj = document.getElementById("imgDesc");
			var imgObjPreview = document.getElementById("dImage");
			var ldot = docObj.value.lastIndexOf(".");
	        var type = docObj.value.substring(ldot + 1);
			if(docObj.value.length > 1 && docObj.value) {     
				if(type == "JPG" || type == "jpg" || type == "jpeg" || type == "JPEG" || type == "ico" || type == "ICO" || type == "png" || type == "PNG") {
					if(docObj.size > 4194304){//文件大小判断
						_size = false;
						alert("图片大小不能超过4M");
						docObj.outerHTML = input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
						document.getElementById('imgDesc').value = "";
					}else{
						_size = true;
						if(docObj.files &&docObj.files[0])
						{
							//火狐下，直接设img属性
						    imgObjPreview.style.width = '146px';
							imgObjPreview.style.height = '140px';
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
					_type = false;
					alert("您上传的图片格式不正确，请重新选择!");
					docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
					document.getElementById('imgDesc').value = "";
				}
			}else{
				docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
				document.getElementById('imgDesc').value = "";
			}	
			return true;
		}
	</script>
</html>