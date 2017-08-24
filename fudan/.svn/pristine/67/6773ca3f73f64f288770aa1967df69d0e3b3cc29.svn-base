<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html lang="en">
<head>
<%@include file="../../../common/includeBaseSet.jsp"%>
<%@include file="../../../common/includeSystemSet.jsp"%>
<style type="text/css">
	.havHead {
		background: #efefef;
	}
	.navBox {
		width: 880px;
		margin: 0 auto;
		padding-top: 20px;
	}
	td {
		padding: 8px;
	}
	.col-first {
		width: 70px;
	}
	.col-aft {
		width: 130px;
	}
	.td-put {
		width: 520px;
		height: 28px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	.td-content {
		height: 150px;
		border-radius: 8px;
		border: 1px solid #ccc;
	}
	a {
		text-decoration: none;
	}
	a:hover {
		text-decoration: none;
	}
	a:focus {
		text-decoration: none;
	}
	li {
		list-style: none;
	}
	ul {
		padding: 0;
		margin: 0;
	}
	.leftList {
		width: 160px;
		height: 283px;
		background-color: #efefef;
		border-radius: 5px;
		overflow: auto;
	}
	.firstLevel li {
		cursor: pointer;
	}
	.secondLevel {
		display: none;
	}
	.thirdLevel {
		display: none;
	}
	.fIndent {
		padding-left: 8px;
	}
	.sIndent {
		padding-left: 24px;
	}
	.tIndent {
		padding-left: 40px;
	}
	.rightContent {
		width: 370px;
		height: 283px;
		border-radius: 8px;
		background-color: ;
		position: relative;
		overflow: hidden;
	}
	.rightContent .table {
		margin-bottom: 5px;
		height: 234px;
	}
	.tBody {
		display: block;
		height: 196px;
		overflow: auto;
	}
	.rightContent thead tr {
		display: block;
	}
	.wiD {
		width: 36px;
	}
	.seQuence {
		width: 45px;
	}
	.wiDl {
		width: 280px;
	}
	.close {
		margin: 5px;
	}
	.aHover {
		display: block;
		width: 100%;
		height: 28px;
		line-height: 28px;
		border-bottom: 1px solid #fff;
		border-radius: 5px;
	}
	.aHover:hover {
		background-color: #ccc;
	}
	.aHover.active {
		background-color: #999;
		color: #fff;
	}
	.pageNum {
		width: 100%;
		height: 40px;
		position: absolute;
		bottom: 0;
		left: 0;
		padding-top: 5px;
		background-color: #efefef;
	}
	#pageNum {
		width: 335px;
		margin: 0 auto;
	}
	.modal-content {
		border-radius: 6px;
		overflow: hidden;
	}
	.pagination {
		margin: 5px 0;
	}
	.headBg {
		background: #79BD7D;
		padding: 5px 8px 0 8px;
		color: ;
	}
</style>
</head>
<body>
	<div class="page-content">
		<%@include file="../../../common/dialog.jsp"%>
		<div class="page-header">
			<h1>
				请假申请表 <small> <i class="icon-double-angle-right"></i>如果是调休,一天按照8小时计算</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form id='leaveFrom' class="form-horizontal" method="POST"
					onsubmit="return false;">
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"><font color="red">*</font>部门</label>
						<div class="col-sm-3">
							<input type="text" name="org" jyValidate="required" readonly="readonly" value="${org.name}">
						</div>
						<label class="col-sm-1 control-label no-padding-right"><font color="red">*</font>申请人</label>
						<div class="col-sm-3">
							<input type="text" name="name" jyValidate="required" readonly="readonly" value="${account.name}">
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"><font color="red">*</font>请假类型</label>
						<div class="col-sm-3" id="selectLeaveType">
							<select name="type" class="chosen-select isSelect85"></select>
						</div>
						<label class="col-sm-1 control-label no-padding-right">选择流程</label>
						<div class="col-sm-3">
							<select id="processdef" name="key"></select>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"><font
							color="red">*</font>开始时间</label>
						<div class="col-sm-3">
							<input name="beginTime" value="" jyValidate="required,datetime" class="date-picker" type="text" placeholder="请假开始时间">
						</div>
						<label class="col-sm-1 control-label no-padding-right"><font
							color="red">*</font>结束时间</label>
						<div class="col-sm-3">
							<input name="endTime" value="" jyValidate="required,datetime" class="date-picker" type="text" placeholder="请假结束时间">
						</div>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right"><font color="red">*</font>审批人</label>
						<span class="col-sm-3">
							<input id="empNames" type="text" jyValidate="required" readonly="readonly" maxlength="16" class="col-xs-12 col-sm-12">
							<input id="empIds" type="text" name="approver" jyValidate="required" readonly="readonly" class="col-xs-12 col-sm-12">
						</span>
						<span class="col-sm-2">
							<button type="button" class="btn btn-info" onclick="tankuang()">
								<i class="icon-ok bigger-110"></i> 选择
							</button>
						</span>
					</div>
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right">请假事由</label>
						<div class="col-sm-7">
							<textarea rows="3" cols="10" maxlength="128" style="width: 100%" name="description" multiline="true" class="FormElement ui-widget-content ui-corner-all "></textarea>
						</div>
					</div>
					<div class="space-4"></div>
					<div class="clearfix form-actions">
						<div class="col-md-offset-3 col-md-9">
							<button type="button" class="btn btn-info" onclick="submitApply()">
								<i class="icon-ok bigger-110"></i> 提交
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="test1">
		<div class="modal-body" style="height:300px;">
			<div class="leftList pull-left">
				<ul class="firstLevel">
					<li><span class="secondT aHover fIndent">
						<i class="glyphicon ftof glyphicon-plus"></i>&nbsp; 职位列表</span>
						<ul id="positions" class="secondLevel">
							<!-- 职位列表打印在此处 -->
						</ul></li>
				</ul>
			</div>
			<div class="rightContent pull-right">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th style="width:36px;" class="text-center wiD">
								<input type="checkbox" id="checkAll" onclick='chooseAll()'>
							</th>
							<th style="width:60px;" class="text-center seQuence">序号</th>
							<th class="wiDl">姓名</th>
						</tr>
					</thead>
					<tbody id="employeetable" class="tBody">
						<!-- 审批人列表打印在此处 -->
						<!--
							<tr>
								<td class="text-center wiD"><input type="checkbox"></td>
								<td class="text-center seQuence">${index.count}</td>
								<td id="${org.id}" class="wiDl">${org.name}</td>
							</tr>
						-->							
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="${jypath}/static/js/system/workflow/online/apply.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#test1").dialog({
				title : "审批人选择",
				autoOpen : false,
				width : "620",
				height : "auto",
				modal : true,
				buttons : {
					"确定": function() {
						var oarrayName = [];
						var iarrayId = [];
						$('#employeetable').find('input[type="checkbox"]').each(function(index, el) {
							if ($(this).is(':checked')) {
								//var abc=$(this).parent().parent().children('td').eq(2).html();
								var obj = $(this).parent().parent().children('td').eq(2);
								var objName = obj.html();
								var objId = obj.attr('id');
								oarrayName.push(objName);
								iarrayId.push(objId);
								$("#empNames").val(oarrayName);
								$("#empIds").val(iarrayId);
							}
						});
						$(this).dialog("close");
					},
					"取消": function() {
						$(this).dialog("close");
					}
				},
			});

			// 获取所有的职务，根据组织ID
			var orgId = '${org.id}';
			getAllPostion(orgId);
			
			getAllProcessDefinition();
			
			//初始化菜单
		    $('.secondT').on('click', function(event) {
	            var theLev=$(this).parent().find('.secondLevel');
	            if(theLev.css('display')=='block'){
	                theLev.slideUp('fast');
	                $(this).find('.glyphicon').removeClass('glyphicon-minus').addClass('glyphicon-plus');
	            }else{
	                $('.secondLevel').slideUp('fast');
	                theLev.slideToggle('fast');
	                $('.ftof').removeClass('glyphicon-minus').addClass('glyphicon-plus');
	                $(this).find('.glyphicon').removeClass('glyphicon-plus').addClass('glyphicon-minus');
	            }
	        });
	        $('.thirdT').on('click', function(event) {
	            var theLev=$(this).parent().find('.thirdLevel');
	            if(theLev.css('display')=='block'){
	                theLev.slideUp('fast');
	                 $(this).find('.glyphicon').removeClass('glyphicon-minus').addClass('glyphicon-plus');
	            }else{
	                $('.thirdLevel').slideUp('fast');
	                theLev.slideToggle('fast');
	                $('.tof').removeClass('glyphicon-minus').addClass('glyphicon-plus');
	                $(this).find('.glyphicon').removeClass('glyphicon-plus').addClass('glyphicon-minus');
	            }
	        });
	        $('.aHover').on('click',function(event) {
	            event.preventDefault();
	            $('.aHover').removeClass('active');
	            $(this).addClass('active');
	        });
		});

		function tankuang() {
			$("#test1").dialog("open");
		}

		// 获取所有的职务，根据组织ID
		function getAllPostion(orgId) {
			var url = jypath+"/backstage/org/position/listbyorg";
			$.ajax({
				type: "get",
				url : url,
				data: "orgId="+orgId,
				success: function(data) {
					$("#positions").html(data);
				}
			});
		}

		// 获取职务下的所有员工，根据职务id
		function getAllEmp(positionId) {
			var url = jypath+"/backstage/account//listby";
			$.ajax({
				type: "get",
				url : url,
				data: "positionId="+positionId,
				success: function(data) {
					var objs = eval("("+data+")");
					var html = "";
					if(objs == null) html += "无数据";
					else {
						var count = 1;
						for(var index in objs) {
							var obj = objs[index];
							html += "<tr>";
							html += "<td class='text-center wiD'><input type='checkbox'></td>";
							html += "<td class='text-center seQuence'>"+count+"</td>";
							html += "<td id='"+obj.id+"' class='wiDl'>"+obj.name+"</td>";
							html += "</tr>";
						}
						$("#employeetable").html(html);
					}
				}
			});
		}
		
		// 获取所有流程定义
		function getAllProcessDefinition() {
			var url = jypath+"/backstage/workflow/process/find";
			$.ajax({
				type: "get",
				url : url,
				success: function(data) {
					var obj = eval("("+data+")");
					var list = obj.obj.list;
					var html = "<option value=''>---请选择---</option>";
					if(list == null || list.length == 0) html = "<option>无数据</option>";
					else {
						for(var index in list) {
							var processDef = list[index];
							html += "<option value='"+processDef.key+"'>"+processDef.name+"</option>";
						}
						$("#processdef").html(html);
					}
				}
			});
			
		}
	</script>
</body>
</html>