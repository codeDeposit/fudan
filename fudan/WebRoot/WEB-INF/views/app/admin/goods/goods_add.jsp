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
		<link rel="stylesheet" href="${jypath}/app/css/plugins/webuploader/webuploader.css">
		<link rel="stylesheet" href="${jypath}/app/css/file/style.css">
		<link href="${jypath}/app/css/plugins/switchery/switchery.css" rel="stylesheet">
		<link href="${jypath}/app/css/plugins/steps/jquery.steps.css" rel="stylesheet">
		<script src="${jypath}/app/js/plugins/webuploader/webuploader.min.js"></script>
		<script src="${jypath}/app/js/file/upload.js"></script>
		<script src="${jypath}/app/js/plugins/switchery/switchery.js"></script>
		<style>
			.demo {
				min-width: 360px;
				margin: 30px auto;
				padding: 10px 20px
			}
			.demo h3 {
				line-height: 40px;
				font-weight: bold;
			}
			.file-item {
				float: left;
				position: relative;
				width: 110px;
				height: 110px;
				margin: 0 20px 20px 0;
				padding: 4px;
			}
			.file-item .info {
				overflow: hidden;
			}
			.uploader-list {
				width: 100%;
				overflow: hidden;
			}
			.col-sm-4 .help-block {
				color: #F86B4F
			}
			.col-sm-6 .help-block {
				color: #F86B4F
			}
		</style>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
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
						<li role="tab" class="first current" aria-disabled="false" aria-selected="true">
							<a id="wizard-t-0" href="#wizard-h-0" aria-controls="wizard-p-0"><span class="current-info audible">当前步骤： </span><span class="number">1.</span> 商品基本信息</a>
						</li>
						<li role="tab" class="disabled" aria-disabled="true">
							<a id="wizard-t-1" href="#wizard-h-1" aria-controls="wizard-p-1"><span class="number">2.</span> 图文详情、说明书</a>
						</li>
						<li role="tab" class="disabled last" aria-disabled="true">
							<a id="wizard-t-2" href="#wizard-h-2" aria-controls="wizard-p-2"><span class="number">3.</span> 添加成功</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="hr-line-dashed"></div>
			<form id="Form_goods" class="form-horizontal" onsubmit="return fSubmit()">
				<input type="hidden" name="storage_state" id="storage_state" value="2">
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品名称</label>
					<div class="col-sm-6">
						<input type="text" name="goods_name" id="goods_name" class="form-control" placeholder="商品名称" maxlength="100" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">商品货号</label>
					<div class="col-sm-6">
						<input type="text" name="goods_number" id="goods_number" class="form-control" placeholder="商品货号" maxlength="50" >
						<span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span>
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
					<div class="col-sm-4">
						<select class="form-control m-b" name="goods_address" id="goods_address" required>
							<option value="-1">请选择</option>
						</select>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">商品品牌</label>
					<div class="col-sm-4">
						<select class="form-control m-b" name="brand_id" id="brand_id" ></select>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>药品单位</label>
					<div class="col-sm-4">
						<select class="form-control m-b" name="unit" id="unit" required>
							<option value="-1">请选择</option>
						</select>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">剂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label>
					<div class="col-sm-4">
						<select class="form-control m-b" name="pill" id="pill">
							<option value="-1">请选择</option>
						</select>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">条&nbsp;&nbsp;形&nbsp;&nbsp;码</label>
					<div class="col-sm-6">
						<input type="text" name="bar_code" id="bar_code" class="form-control" placeholder="条形码" maxlength="50" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品描述</label>
					<div class="col-sm-6">
						<input type="text" name="goods_desc" id="goods_desc" class="form-control" placeholder="商品描述" maxlength="50" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>商品价格</label>
					<div class="col-sm-4">
						<input type="text" name="goods_price" id="goods_price" class="form-control" placeholder="0.0" maxlength="10" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">开启促销</label>
					<div class="col-sm-1">
						<input type="checkbox" class="js-switch_3" id="dom_goods_promotion"/>
					</div>
				</div>
				<div style="display:none;margin-left:100px;" id="GoodsActivityBox">
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label" style="color:#D9B300"><span style="color:red;">*</span>促&nbsp;&nbsp;销&nbsp;&nbsp;价</label>
						<div class="col-sm-2">
							<input type="hidden" name="goods_promotion" id="goods_promotion" value="0">
							<input type="number" name="goods_promotion_price" id="goods_promotion_price" class="form-control" placeholder="0.0" value="0" maxlength="10"  required>
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label" style="color:#D9B300">促销日期</label>
						<div class="col-sm-3">
							<input type="date" name="goods_promotion_begin" id="goods_promotion_begin" class="form-control" >
						</div>
						<div class="col-sm-3">
							<input type="date" name="goods_promotion_end" id="goods_promotion_end" class="form-control" >
						</div>
					</div>
					<div class="form-group col-sm-12">
						<label class="col-sm-2 control-label" style="color:#D9B300">促销描述</label>
						<div class="col-sm-6">
							<input type="text" name="goods_promotion_desc" id="goods_promotion_desc" class="form-control" placeholder="促销描述" maxlength="200" >
						</div>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">消费积分数</label>
					<div class="col-sm-4">
						<input type="number" name="goods_jifen" id="goods_jifen" class="form-control" placeholder="0" value="0" maxlength="10" >
						<span class="help-block m-b-none">购买该商品时,赠送消费积分数.</span>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品规格</label>
					<div class="col-sm-6">
						<input type="text" name="goods_norms" id="goods_norms" class="form-control" placeholder="产品规格" maxlength="200" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品图片</label>
					<div class="col-sm-8">
						<div class="demo">
							<div id="uploader">
								<div class="queueList">
									<div id="dndArea" class="placeholder">
										<div id="filePicker"></div>
										<p>
											或将照片拖到这里，单次最多可选5张
										</p>
									</div>
								</div>
								<div class="statusBar" style="display:none;">
									<div class="progress">
										<span class="text">0%</span>
										<span class="percentage"></span>
									</div><div class="info"></div>
									<div class="btns">
										<div id="filePicker2"></div>
										<div class="uploadBtn" onclick="fUploadMark()">
											开始上传
										</div>
									</div>
								</div>
							</div>
							<span class="help-block m-b-none" style="margin-left:4%;color:#F86B4F;letter-spacing:2px;">上传280*280的jpg格式图片.</span>
						</div>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>批准文号</label>
					<div class="col-sm-6">
						<input type="text" name="approve" id="approve" class="form-control" placeholder="批准文号" maxlength="30" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>产品库存</label>
					<div class="col-sm-6">
						<input type="text" name="goods_storage" id="goods_storage" class="form-control" placeholder="0" maxlength="10" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" required>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label"><span style="color:red;">*</span>库存报警</label>
					<div class="col-sm-6">
						<input type="text" name="goods_storage_alarm" id="goods_storage_alarm" class="form-control" placeholder="0" maxlength="10" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" required>
						<span class="help-block m-b-none">当产品库存小于最低值时,进行提示.</span>
					</div>
				</div>
				<div class="form-group col-sm-12">
					<label class="col-sm-2 control-label">一小时购药</label>
					<div class="col-sm-6">
						<label class="checkbox-inline">
							<input type="checkbox" id="goods_hour" name="goods_hour" value="2" >
							<span class="help-block m-b-none" style="color:#676a6c;">是否开启一小时购药.</span> </label>
					</div>
				</div>
				<div class="col-sm-10" style="text-align:right;margin-bottom:120px;">
					<button class="btn btn-primary" type="submit">
						下一步
					</button>
				</div>
			</form>
		</div>
	</body>
	<script>
		var _pd = 0;
		//是否已上传图片
		var _click = 0;
		//促销开启判断
		$(document).ready(function() {
			parent.scrollTo(0,0);
			//类别调取
			fGetClass(0, 1);
			//品牌调取
			fGetBrand();
			//厂家调取
			fFactoryList();
			//剂型调取
			fPillList();
			//药品单位
			fUnitList();
		});
		function fUnitList(){
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
						if (ret.length == 0) {
							document.getElementById('unit').innerHTML = '<option value="">请选择</option>';
						} else {
							for (var i = 0; i < ret.length; i++) {
								document.getElementById("unit").innerHTML += '<option value="' + ret[i]['id'] + '">' + ret[i]['name'] + '</option>';
							}
						}
					}
				}
			});	 
		}
		function fPillList(){
			$.ajax({
				type : "post",
				async : false,
				url : basePath + "appAdminGoods/pillList",
				success : function(data) {
					var obj = eval('(' + data + ')');
					var ret = obj.obj;
					if (obj.res == 0) {
						fuError();
					} else {
						if (ret.length == 0) {
							document.getElementById('pill').innerHTML = '<option value="">请选择</option>';
						} else {
							for (var i = 0; i < ret.length; i++) {
								document.getElementById("pill").innerHTML += '<option value="' + ret[i]['id'] + '">' + ret[i]['name'] + '</option>';
							}
						}
					}
				}
			});	 
		}
		function fGetClass(param, param2) {
			if (param != 0) {
				var item_select = document.getElementById("gc_id_" + param);
				var item_value = item_select.options[item_select.selectedIndex].value;
				param = item_value;
			} else {
				param = 0;
			}
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
	</script>
</html>