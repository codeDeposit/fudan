<%@ page contentType="text/html;charset=UTF-8" %>
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
<div id="auDiv" class="hide">
	<form id="auForm" method="POST" onsubmit="return false;">
		<table cellspacing="0" cellpadding="0" border="0" class="customTable">
			<tbody>
				<tr style="display: none">
					<td colspan="2" class="ui-state-error">
						<input type="hidden" name="id">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">部门：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="org" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">申请人：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="name" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">审批人：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="approver" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">请假类型：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="typeName" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">开始时间：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="beginTime" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
					<td class="CaptionTD">结束时间：</td>
					<td class="DataTD">&nbsp; 
						<input type="text" disabled="disabled" readonly role="textbox" maxlength="64" name="endTime" class="FormElement ui-widget-content ui-corner-all">
					</td>
				</tr>
				<tr class="FormData">
						<td class="CaptionTD">请假事由：</td>
						<td class="DataTD">&nbsp;
						<textarea rows="2" disabled="disabled" readonly cols="10" maxlength="100" name="description" multiline="true" class="FormElement ui-widget-content ui-corner-all isSelect147"></textarea>
						</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<div id="rejectDiv" class="hide">
<form id="rejectForm" method="POST" onsubmit="return false;">
	<table cellspacing="0" cellpadding="0" border="0" class="customTable">
		<tbody>
			<tr class="FormData">
				<td class="CaptionTD"><font color="red">*</font>驳回理由：</td>
				<td class="DataTD">&nbsp;
					<textarea rows="2"  cols="10" maxlength="100" name="rejectReason" multiline="true" class="FormElement ui-widget-content ui-corner-all isSelect147"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
<div id="adjustDiv" class="hide">
<form id="adjustForm" method="POST" onsubmit="return false;">
	<table cellspacing="0" cellpadding="0" border="0" class="customTable">
		<tbody>
			<tr class="FormData">
				<td class="CaptionTD"><font color="red">*驳回理由：</font></td>
				<td class="DataTD">&nbsp;
					<textarea rows="2" disabled="disabled" readonly cols="10" maxlength="100" name="rejectReason" multiline="true" class="FormElement ui-widget-content ui-corner-all isSelect147"></textarea>
				</td>
			</tr>
			<tr style="display: none">
				<td colspan="2" class="ui-state-error">
					<input type="hidden" name="id">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">部门：</td>
				<td class="DataTD">&nbsp; 
					<input type="text" role="textbox" disabled="disabled" readonly maxlength="64" name="org" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">申请人：</td>
				<td class="DataTD">&nbsp; 
				<input type="text" role="textbox" disabled="disabled" readonly maxlength="64" name="name" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">审批人：</td>
				<td class="DataTD">&nbsp; 
					<input type="text" role="textbox" disabled="disabled" readonly maxlength="64" name="approver" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">请假类型：</td>
				<td class="DataTD">&nbsp; 
					<input type="hidden" name="type">
					<input type="text" role="textbox" disabled="disabled" readonly="readonly" maxlength="64" name="typeName" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">开始时间：</td>
				<td class="DataTD">&nbsp; 
					<input type="text" role="textbox" disabled="disabled" readonly maxlength="64" name="beginTime" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD">结束时间：</td>
				<td class="DataTD">&nbsp; 
					<input type="text" role="textbox" disabled="disabled" readonly maxlength="64" name="endTime" class="FormElement ui-widget-content ui-corner-all">
				</td>
			</tr>
			<tr class="FormData">
				<td class="CaptionTD"><font color="red">*</font>请假事由：</td>
				<td class="DataTD">&nbsp;
					<textarea rows="2" cols="10" maxlength="100" name="description" multiline="true" class="FormElement ui-widget-content ui-corner-all isSelect147"></textarea>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>

<div id="test1" class="hide">
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

<script type="text/javascript">
		$(function() {
			// 获取所有的职务，根据组织ID
			var orgId = '${org.id}';
			getAllPostion(orgId);
			
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
			var url = jypath+"/backstage/account/listby";
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
	</script>
</body>