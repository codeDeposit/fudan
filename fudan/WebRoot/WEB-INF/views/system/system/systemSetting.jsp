<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0"/>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<%@ include file="../common/styleUrl.jsp" %> 
		<%@include file="../common/css.jsp" %>
		<style>
			html, body {
				min-height:500px !important;
				font-family:Arial,'微软雅黑','黑体',sans-serif;
			}
		</style>
	</head>
	<body id='indexBody'>
		<div class="main-container" id="main-container">
			<div class="main-container-inner">
				<div class="sidebar" id="sidebar">
					<ul class="nav nav-list" id="menu_li_id" >
						
					</ul>
					<div class="sidebar-collapse" id="sidebar-collapse" style="display:block !important">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
				</div>
				<!-- 主要界面 右边 -->
				<div class="main-content" id="maincontent" >
					<div class="page-content" style="background-color: #f3f3f4 !important;">
						<div class="tab-control" style="margin-top:-44px;">
							<div  class="tab simple">
								<form>
									<input class="prev" type="button" />
									<input class="next" type="button" />
									<input class="find" type="button" />
								</form>
								<ul class="tabul">
									
								</ul>
							</div>
							<!-- 标签查找 -->
							<div class="tab-find hidden ">
								<form>
									<input class="text" type="text" />
								</form>
								<ul></ul>
							</div>
							<!-- 主体 -->
							<div class="main"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/dialog.jsp" %>
		<%@include file="../common/js.jsp" %>
		<script src="${jypath}/pc/plugins/tabs/js/tab-control.min.js"></script>
		<script>
			$(function () {
				getMenu("1","y");
			});
			//获取菜单
			function getMenu(layer,ref){
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appAdminLogin/getMenu",
					data:{
						layer:layer,
						ref:ref
					},
					success:function(data){
						var obj = eval('('+ data +')');
						document.getElementById('menu_li_id').innerHTML = obj.obj; 
					}
				}); 
			}
			//打开菜单
			function openMenu(type,id,parentId,menuName,resUrl){
				if('1'!=type || "noset"==resUrl){
					return;
				}else if('/'==resUrl.substring(0,1)){
					TabControlAppend(id,menuName,jypath+resUrl+"?menu="+id);
				}else {
					TabControlAppend(id,menuName,resUrl);	
				}
				
			}
		</script>
	</body>
</html>