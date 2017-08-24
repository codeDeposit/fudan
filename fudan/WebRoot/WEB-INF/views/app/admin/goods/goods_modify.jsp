<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="../../common/styleUrl.jsp" %>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<%@ include file="../../common/css.jsp" %>
		<%@ include file="../../common/js.jsp" %>
		<link rel="stylesheet" href="${jypath}/app/css/file/style.css">
		<link href="${jypath}/app/css/plugins/switchery/switchery.css" rel="stylesheet">
		<link href="${jypath}/app/css/plugins/steps/jquery.steps.css" rel="stylesheet">
		<script src="${jypath}/app/js/plugins/switchery/switchery.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>商品修改</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	药品商城
                    </li>
                    <li>
                        <strong>商品修改</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
			        <div class="ibox-title">
			          	<div class="col-lg-12" style="text-align:right;margin-top:-20px;">
							<a href="../appAdminGoods/list">
								<button data-toggle="modal" data-target="#Modal_doctor"  class="btn btn-primary" type="button">返回</button>
							</a>
			           	</div>
				    </div>	
					<div class="ibox-content">
						<form id="Form_goods" class="form-horizontal" onsubmit="return fSubmit()">
							<input type="hidden" name="goods_id" id="goods_id" value="${goods.goods_id }">
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品名称</label>
								<div class="col-sm-6">
									<input type="text" name="goods_name" id="goods_name" value="${goods.goods_name }" class="form-control" placeholder="商品名称" maxlength="100" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">商品货号</label>
								<div class="col-sm-6">
									<input type="text" name="goods_number" id="goods_number" value="${goods.goods_number }" class="form-control" placeholder="商品货号" maxlength="50" >
									<span class="help-block m-b-none text-danger">如果不输入商品货号,系统自动生成一个唯一的货号.</span>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品分类</label>
								<div class="col-sm-2">
									<select class="form-control m-b" name="gc_id_1" id="gc_id_1" onchange="fGetClass(1,2)" required>
										<option value="">请选择</option>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control m-b" name="gc_id_2" id="gc_id_2" onchange="fGetClass(2,3)" required>
										<option value="">请选择</option>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control m-b" name="gc_id_3" id="gc_id_3" >
										<option value="">请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品厂家</label>
								<div class="col-sm-6">
									<select class="form-control m-b" name="goods_address" id="goods_address" required>
										<option value="-1">请选择</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">商品品牌</label>
								<div class="col-sm-6">
									<select class="form-control m-b" name="brand_id" id="brand_id" ></select>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品描述</label>
								<div class="col-sm-6">
									<input type="text" name="goods_desc" id="goods_desc" value="${goods.goods_desc }" class="form-control" placeholder="商品描述" maxlength="50" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品价格</label>
								<div class="col-sm-4">
									<input type="text" name="goods_price" id="goods_price" value="${goods.goods_price }" class="form-control" placeholder="0.0" maxlength="10" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">消费积分数</label>
								<div class="col-sm-4">
									<input type="number" name="goods_jifen" id="goods_jifen" value="${goods.goods_jifen }" class="form-control" placeholder="0" value="0" maxlength="10" >
									<span class="help-block m-b-none text-danger">购买该商品时,赠送消费积分数.</span>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品规格</label>
								<div class="col-sm-6">
									<input type="text" name="goods_norms" id="goods_norms" value="${goods.goods_norms }" class="form-control" placeholder="产品规格" maxlength="200" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片1</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${goods.goods_image1 }" id="dImage0" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:7%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl0" id="FileInput0" onchange="javascript:setImagePreview(0);"  style="filter:alpha(opacity:1);opacity:0;width:90px;height:90px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									<button type="button" id="buttonUpload0" class="btn btn-info btn-sm" onclick="fUpload(0)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess0" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片2</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${goods.goods_image2 }" id="dImage1" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:7%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl1" id="FileInput1" onchange="javascript:setImagePreview(1);"  style="filter:alpha(opacity:1);opacity:0;width:90px;height:90px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									<button type="button" id="buttonUpload1" class="btn btn-info btn-sm" onclick="fUpload(1)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess1" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片3</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${goods.goods_image3 }" id="dImage2" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:7%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl2" id="FileInput2" onchange="javascript:setImagePreview(2);"  style="filter:alpha(opacity:1);opacity:0;width:90px;height:90px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									<button type="button" id="buttonUpload2" class="btn btn-info btn-sm" onclick="fUpload(2)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess2" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片4</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${goods.goods_image4 }" id="dImage3" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:7%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl3" id="FileInput3" onchange="javascript:setImagePreview(3);"  style="filter:alpha(opacity:1);opacity:0;width:90px;height:90px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									<button type="button" id="buttonUpload3" class="btn btn-info btn-sm" onclick="fUpload(3)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess3" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片5</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${goods.goods_image5 }" id="dImage4" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:7%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl4" id="FileInput4" onchange="javascript:setImagePreview(4);"  style="filter:alpha(opacity:1);opacity:0;width:90px;height:90px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									<button type="button" id="buttonUpload4" class="btn btn-info btn-sm" onclick="fUpload(4)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess4" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>批准文号</label>
								<div class="col-sm-6">
									<input type="text" name="approve" id="approve" value="${goods.approve }" class="form-control" placeholder="批准文号" maxlength="30" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品库存</label>
								<div class="col-sm-6">
									<input type="text" name="goods_storage" id="goods_storage" value="${goods.goods_storage }" class="form-control" placeholder="0" maxlength="10" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>库存报警</label>
								<div class="col-sm-6">
									<input type="text" name="goods_storage_alarm" id="goods_storage_alarm" value="${goods.goods_storage_alarm }" class="form-control" placeholder="0" maxlength="10" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" required>
									<span class="help-block m-b-none text-danger">当产品库存小于最低值时,进行提示.</span>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-12 col-sm-offset-6">
									<button class="btn btn-primary" type="submit">
										下一步
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		var _pd = 0;
		//是否已上传图片
		var _click = 0;
		//促销开启判断
		$(document).ready(function() {
			parent.scrollTo(0,0);
			fGetClass(0,1);
// 			alert();
			//品牌调取
			fGetBrand();
			//厂家调取
			fFactoryList();
			$("#gc_id_1 option[value='${goods.gc_id_1}'").attr("selected",true);
			fGetClass(${goods.gc_id_1},2);
			$("#gc_id_2 option[value='${goods.gc_id_2}'").attr("selected",true);
			if(${goods.gc_id_2} != ''){
				fGetClass(${goods.gc_id_2},3);
				$("#gc_id_3 option[value='${goods.gc_id_3}'").attr("selected",true);
			}
			$("#goods_address option[value='${goods.goods_address }'").attr("selected",true);
			$("#brand_id option[value='${goods.brand_id }'").attr("selected",true);
		});
		function fGetClass(param, param2) {
			document.getElementById('gc_id_' + param2).innerHTML = '<option value="">请选择</option>';
			$.ajax({
				type : "post",
				async : false,
				url : "${jypath}/appAdminGoods/classData",
				data : {
					gc_parent_id : param
				},
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						for (var i = 0; i < ret.length; i++) {
							document.getElementById('gc_id_' + param2).innerHTML += '<option value="' + ret[i]['gc_id'] + '">' + ret[i]['gc_name'] + '</option>';
						}
					}
				}
			});
		}
		function fFactoryList(){
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
						if (ret.length == 0) {
							document.getElementById('goods_address').innerHTML = '<option value="">请选择</option>';
						} else {
							for (var i = 0; i < ret.length; i++) {
								document.getElementById("goods_address").innerHTML += '<option value="' + ret[i]['id'] + '">' + ret[i]['name'] + '</option>';
							}
						}
					}
				}
			});	 
	    }
		function fSubmit() {
			if (_pd == 0) {
				fuError('请上传产品图片');
			} else {
				$.ajax({
					type : "post",
					async : false,
					url : "${jypath}/appAdminGoods/add",
					data : $("#Form_goods").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							window.location.href = "../appAdminGoods/addTwo?goods_id=" + obj.obj;
						}
					}
				});
			}
			return false;
		}
		function fUploadMark() {
			_pd = 1;
		}
		function fGetBrand() {
			document.getElementById('brand_id').innerHTML = '<option value="0">请选择</option>';
			$.ajax({
				type : "post",
				async : false,
				url : "${jypath}/appAdminGoods/brandData",
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						for (var i = 0; i < ret.length; i++) {
							document.getElementById('brand_id').innerHTML += '<option value="' + ret[i]['brand_id'] + '">' + ret[i]['brand_name'] + '</option>';
						}
					}
				}
			});
		}
		var elem_3 = document.querySelector('.js-switch_3');
		var switchery_3 = new Switchery(elem_3, {
			color : '#1AB394'
		});
		//商品促销
		$('.switchery').click(function() {
			_click += 1;
			if ((_click % 2) == 0) {
				document.getElementById('goods_promotion').value = 1;
			} else {
				document.getElementById('goods_promotion').value = 2;
			}
			$('#GoodsActivityBox').toggle(1, function() {
			});
		});
		function setImagePreview(param){//下面用于图片上传预览功能
			var docObj = document.getElementById("FileInput"+param);
			var imgObjPreview = document.getElementById("dImage"+param);
			var ldot = docObj.value.lastIndexOf(".");
	        var type = docObj.value.substring(ldot + 1);
			if(docObj.value.length > 1 && docObj.value) {     
				if(type == "JPG" || type == "jpg" || type == "jpeg" || type == "JPEG" || type == "ico" || type == "ICO" || type == "png" || type == "PNG") {
					if(docObj.size > 4194304){//文件大小判断
						alert("图片大小不能超过4M");
						docObj.outerHTML = input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
						document.getElementById('FileInput'+param).value = "";
					}else{
						$('#buttonUpload'+param).removeAttr("disabled"); //上传按钮启用
						document.getElementById("buttonUpload"+param).style.display = "inline";//上传按钮显示
						$('#buttonSuccess'+param).attr('disabled',"true");//完成按钮禁用
						document.getElementById("buttonSuccess"+param).style.display = "none";//隐藏完成按钮
						if(docObj.files &&docObj.files[0])
						{
							//火狐下，直接设img属性
							/* imgObjPreview.style.display = 'block'; */
							imgObjPreview.style.width = '120px';
							imgObjPreview.style.height = '120px';
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
							localImagId.style.width = "120px";
							localImagId.style.height = "120px";
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
</html>