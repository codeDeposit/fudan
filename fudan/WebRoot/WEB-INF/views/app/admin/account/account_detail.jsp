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
		<link href="${jypath}/app/css/plugins/summernote/summernote.css" rel="stylesheet">
		<link href="${jypath}/app/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
		<%@ include file="../../common/css.jsp" %>
		<%@ include file="../../common/js.jsp" %> <!-- SUMMERNOTE -->
		<script src="${jypath}/app/js/plugins/summernote/summernote.min.js"></script>
		<script src="${jypath}/app/js/plugins/summernote/summernote-zh-CN.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body style='height:2000px !important;'>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>用户详情</h2>
				<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
					<li>
						<a href="index.html">主页</a>
					</li>
					<li>
						<a>用户管理</a>
					</li>
					<li>
						<strong>用户详情</strong>
					</li>
				</ol>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="panel blank-panel">
				<div class="panel-heading">
					<div class="panel-options">
						<ul class="nav nav-tabs">
							<li>
								<a data-toggle="tab" href="tabs_panels.html#tab-4"><i class="fa fa-list-alt"></i></a>
							</li>
							<li class="">
								<a data-toggle="tab" href="tabs_panels.html#tab-5"><i class="fa fa-child"></i></a>
							</li>
							<li class="">
								<a data-toggle="tab" href="tabs_panels.html#tab-6"><i class="fa fa-calendar-o"></i></a>
							</li>
							<li class="">
								<a data-toggle="tab" href="tabs_panels.html#tab-7"><i class="fa fa-medkit"></i></a>
							</li>
							<li class="">
								<a data-toggle="tab" href="tabs_panels.html#tab-8"><i class="fa fa-files-o"></i></a>
							</li>
							<li class="">
								<a data-toggle="tab" href="tabs_panels.html#tab-9"><i class="fa fa-files-o"></i></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="panel-body">
					<div class="tab-content">
						<div id="tab-4" class="tab-pane active">
							<strong>电子病例</strong>
							<p>
								测试代码
							</p>
						</div>
						<div id="tab-5" class="tab-pane">
							<strong>体检报告</strong>
							<p>
								测试代码
							</p>
						</div>
						<div id="tab-6" class="tab-pane">
							<strong>报告单</strong>
							<p>
								测试代码
							</p>
						</div>
						<div id="tab-7" class="tab-pane">
							<strong>处方</strong>
							<p>
								测试代码
							</p>
						</div>
						<div id="tab-8" class="tab-pane">
							<strong>档案列表</strong>
							<p>
								测试代码
							</p>
						</div>
						<div id="tab-9" class="tab-pane">
							<strong>用户积分</strong>
							<p>
								测试代码
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function() {
				parent.scrollTo(0,0);
				$('.dataTables-example').dataTable();
				/* Init DataTables */
				var oTable = $('#editable').dataTable();
				/* Apply the jEditable handlers to the table */
				oTable.$('td').editable('../example_ajax.php', {
					"callback" : function(sValue, y) {
						var aPos = oTable.fnGetPosition(this);
						oTable.fnUpdate(sValue, aPos[0], aPos[1]);
					},
					"submitdata" : function(value, settings) {
						return {
							"row_id" : this.parentNode.getAttribute('id'),
							"column" : oTable.fnGetPosition(this)[2]
						};
					},
					"width" : "90%",
					"height" : "100%"
				});
			});
		</script>
	</body>
</html>