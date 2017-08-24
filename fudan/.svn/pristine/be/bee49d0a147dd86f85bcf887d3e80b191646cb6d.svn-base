<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../common/toast.jsp"%>
<link rel="stylesheet" href="${jypath}/pc/css/common/select.css">
<div class="modal fade" id="Modal_emplayee_listxx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:100%;margin:0 auto;">
	<div class="modal-dialog" >
		<div class="modal-content" style="background:#F4F4F4;width:80%;margin:0 auto;">
			<div class="modal-header headBg" style="background:#1ab394">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					×
				</button>
				<h4 class="modal-title text-center" id="myModalLabel" style="color:#fff">部门职务人员列表</h4>
			</div>
			<div class="modal-body">
				<div class="list" style="height:380px;width:100%;overflow:auto">
					<ul class="yiji" id="yiji" style="height:380px;width:100%;overflow:auto">
						<li style="width:100%;overflow:auto">
							<a href="javascript:void(0)" class="inactive"><i class="icon-sitemap"></i>&nbsp;--&nbsp;选择部门人员</a>
							<ul style="display: none" id="EmployeeList">
							
								<!-- <li>
									<a href="javascript:void(0)" class="inactive active"><i class="glyphicon glyphicon-object-align-horizontal"></i>&nbsp;--&nbsp;销售部</a>
									<ul>
										<li>
											<a href="javascript:void(0)" class="inactive active"><i class="icon-group"></i>&nbsp;--&nbsp;客户代表</a>
											<ul>
												<li><a href="javascript:void(0)" id="a1" onclick="employeeBackground(1)"><i class="icon-user"></i>&nbsp;--&nbsp;销售1</a></li>
												<li><a href="javascript:void(0)" id="a2">销售2</a></li>
												<li><a href="javascript:void(0)" id="a3">销售3</a></li>
												<li><a href="javascript:void(0)" id="a4">销售4</a></li>
											</ul>
										</li>
									</ul>
								</li> -->
								
							</ul>
						</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" data-dismiss="modal">
						确定
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	window.onload = function(){
		getOrgEmployee();
		$('.inactive').click(function(){
			if($(this).siblings('ul').css('display')=='none'){
				$(this).parent('li').siblings('li').removeClass('inactives');
				$(this).addClass('inactives');
				$(this).siblings('ul').slideDown(100).children('li');
				if($(this).parents('li').siblings('li').children('ul').css('display')=='block'){
					$(this).parents('li').siblings('li').children('ul').parent('li').children('a').removeClass('inactives');
					$(this).parents('li').siblings('li').children('ul').slideUp(100);
				}
			}else{
				//控制自身变成+号
				$(this).removeClass('inactives');
				//控制自身菜单下子菜单隐藏
				$(this).siblings('ul').slideUp(100);
				//控制自身子菜单变成+号
				$(this).siblings('ul').children('li').children('ul').parent('li').children('a').addClass('inactives');
				//控制自身菜单下子菜单隐藏
				$(this).siblings('ul').children('li').children('ul').slideUp(100);
				//控制同级菜单只保持一个是展开的（-号显示）
				$(this).siblings('ul').children('li').children('a').removeClass('inactives');
			}
		})
	}
	function getOrgEmployee(){
		document.getElementById('EmployeeList').innerHTML =  "";
		$.ajax({
			type:"post",
			async:false,
			url:"${jypath}/backstage/org/position/getOrgEmployee",
			success:function(data){
				var obj = eval('('+ data +')');
				if(obj.res == 0){
					$("#warning").html(obj.resMsg);
				}else{
					var data = obj.obj;
					for(var i=0;i<data.length;i++){
						var positionList = data[i]['positionList'];
						var positionListHtml = '';
						for(var j=0;j<positionList.length;j++){
							var accountList = positionList[j]['accountList'];
							var accountListHtml = '';
							for(var g=0;g<accountList.length;g++){
								accountListHtml += '<li class="lkj"><a href="javascript:void(0)" id="emplayee'+ accountList[g]['id'] +'" onclick="employeeBackground(\''+ accountList[g]['id'] +'\',\''+ accountList[g]['name'] +'\')"><i class="icon-user" style="color:#8f8f94">&nbsp;--</i>&nbsp;'+ accountList[g]['name'] +'</a></li>';
							}
							//是否有职员
							var accountHtml = '';
							if(accountList.length == 0){
								accountHtml = '<a href="javascript:void(0)"><i class="icon-group" style="color:#8f8f94">&nbsp;--</i>&nbsp'+ positionList[j]['name'] +'&nbsp;&nbsp;<span>('+ accountList.length +'人)</span></a>';
							}else{
								accountHtml = '<a href="javascript:void(0)" class="inactive active"><i class="icon-group">&nbsp;--</i>&nbsp'+ positionList[j]['name'] +'&nbsp;&nbsp;<span>('+ accountList.length +'人)</span></a>';
							}
							positionListHtml += '<li>'
													+ accountHtml
													+ '<ul>'
														+ accountListHtml
													+ '</ul>'
												+'</li>';
						}
						var positionHtml = "";
						//是否有职位
						if(positionList.length == 0){
							positionHtml = '<a href="javascript:void(0)"><i class="glyphicon glyphicon-object-align-horizontal">&nbsp;--</i>&nbsp;'+ data[i]['orgName'] +'&nbsp;&nbsp;<span>(职务：'+ positionList.length +'个)</span></a>';
						}else{
							positionHtml = '<a href="javascript:void(0)" class="inactive active"><i class="glyphicon glyphicon-object-align-horizontal" style="color:#8f8f94">&nbsp;--</i>&nbsp;'+ data[i]['orgName'] +'&nbsp;&nbsp;<span>(职务：'+ positionList.length +'个)</span></a>';
						}
						document.getElementById('EmployeeList').innerHTML += '<li>'
																				+ positionHtml
																				+ '<ul>'
																					+ positionListHtml
																				+ '</ul>'
																			  +'</li> ';
					}
				}
			}
		}); 
	}
	function employeeBackground(param,param2){
		$("li a").css("background-color","#F4F4F4")
        var colors = document.getElementById("emplayee" + param);
        colors.style.backgroundColor = "#fff";
        fEmployeePrint(param2);
    }
</script>