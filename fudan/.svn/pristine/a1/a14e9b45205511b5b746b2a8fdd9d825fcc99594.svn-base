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
		<script src="${jypath}/pc/js/file/ajaxfileupload.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>版本号</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	app设置
                    </li>
                    <li>
                        <strong>版本号</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-title">
       		<h5>版本添加</h5>
        </div>
        <div class="ibox-content">
	        <form id="Form_version" class="form-horizontal" onsubmit="return fSubmit()">
	          	<div class="form-group col-sm-12">
	          		<input type="hidden" name="state" value="1">
	             	<label class="col-sm-2 control-label"><span style="color:red;">*</span>版本号</label>
	              	<div class="input-group col-sm-3">
	              		<span class="input-group-addon">&nbsp;v&nbsp;</span>
                        <input type="text" class="form-control" id="version" name="version" placeholder="版本号" required>
                        <span class="input-group-btn"> 
                        	<button type="button" class="btn btn-primary" id="dom_version_choice"><i class="fa fa-list"></i>&nbsp;版本选择</button>
                       	</span>
                    </div>
                    <div class="input-group col-sm-6" style="text-align:center;">
                        <span class="help-block m-b-none">版本格式: &nbsp;v&nbsp;0.0.1</span>
                    </div>
	           	</div>
	           	<div class="form-group col-sm-12" id="dom_version_select" style="display:none;">
	             	<label class="col-sm-3 control-label">版本</label>
	              	<div class="col-sm-2">
	                  	<select class="form-control m-b" name="versionSelect" id="versionSelect" onchange="fVsersionListChoice()">
	                      <option value="">请选择</option>
	                  	</select>
	              	</div>
	           	</div>
			   	<div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label"><span style="color:red;">*</span>APP上传</label>
	           		<div class="input-group  col-sm-3">
		              	<input type="file" name="file" id="appPack" class="form-control" placeholder="app安装包" maxlength="50" required>
	              	</div>
			   	</div>
			   	<div class="form-group col-sm-12">
	          		<label class="col-sm-2 control-label">更新备注 </label>
	           		<div class="input-group  col-sm-3">
		              	<input type="text" style="height:60px;" name="msg" id="msg" class="form-control" placeholder="app更新信息展示（0/255） " maxlength="255" >
	              	</div>
   			  	</div>
	           	<div class="form-group col-sm-9" style="text-align:right;">
	               	<button class="btn btn-primary" type="submit">更新</button>
	                <button class="btn btn-white" id="form_reset" type="reset">重置</button>
	   	  		</div>
		   </form>
		</div>
		<div class="hr-line-dashed"></div>
		<div class="ibox-title">
       		<h5>版本更新记录<!-- <small>分类，查找</small> --></h5>
        </div>
		<div class="ibox-content">
			<table class="table table-striped table-bordered table-hover dataTables-example">
				<thead>
					<tr>
						<th>编号</th>
						<th>版本号</th>
						<th>下载地址</th>
						<th>时间</th>
						<th>更新备注</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dTable">
								 
				</tbody>
			</table>
		</div>
		<script>
			 //app版本号
			$('#dom_version_choice').click(function(){
				$('#dom_version_select').toggle(500);
			});
			$(document).ready(function() {
				parent.scrollTo(0,0);
				fList();
			});
			function fTable(){
				$('.dataTables-example').dataTable();
			}
			function fVsersionListChoice(){
				var item_select = document.getElementById("versionSelect");
  				var item_value = item_select.options[item_select.selectedIndex].value;
  				document.getElementById("version").value = item_value;
			}
			function fSubmit(){
				$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appAdminSetting/versionAdd?"+$("#Form_version").serialize(),
					ecureuri:false,
			    	fileElementId:"appPack",
					dataType:"JSON",
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fuSuccess();
							fList();
							document.getElementById("Form_version").reset();
						}
					}
				});
				return false;
			}
			function fList(){
				document.getElementById('dTable').innerHTML = '';
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appAdminSetting/versionList",
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						document.getElementById("versionSelect").innerHTML = '<option value="">请选择</option>';
						if(ret.length == 0){
							document.getElementById("versionSelect").innerHTML = '<option value="">暂无可用版本</option>';
							document.getElementById('dTable').innerHTML = '<tr>'
																		 	+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																		  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								//版本号list打印
								document.getElementById("versionSelect").innerHTML += '<option value="'+ ret[i]['version'] +'">'+ ret[i]['version'] +'</option>';
								if (ret[i]['state'] == 1) {
									var buttonStr = '<button onclick="fUpdate(' + ret[i]['id'] + ',2)" class="btn btn-warning btn-outline btn-sm" type="button"><i class="fa fa-close"></i>&nbsp;禁用</button>';
								} else {
									var buttonStr = '<button onclick="fUpdate(' + ret[i]['id'] + ',1)" class="btn btn-primary btn-outline btn-sm" type="button"><i class="fa fa-eye"></i>&nbsp;启用</button>';
								}
								document.getElementById('dTable').innerHTML += '<tr class="gradeX">'
													+'<td>'+ (i+1) +'</td>'
													+'<td>'+ ret[i]['version'] +'</td>'
													+'<td>'
													+'<a href="'+ ret[i]['appPack'] +'"><img src="${jypath}/app/img/download.png" width="30px"></a>'
													+'</td>'
													+'<td class="center">'+ ret[i]['updateTime'] +'</td>'
													+'<td class="center">'+ ret[i]['msg'] +'</td>'
													+'<td class="center">'
													+ buttonStr
													+'&nbsp;<button onclick="fDelete('+ ret[i]['id'] +',\'version\')" type="button" class="btn btn-danger btn-outline btn-sm">'
														+'<i class="fa fa-trash-o"></i>'
														+'&nbsp;删除'
													+'</button>'
												+'</td>'
											+'</tr>';
							}	
							fTable();
						}	
					}
				});
			}
			function fDelete(param1,param2) {
				fuConfirm(param1,param2);
			} 
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminSetting/versionDelete",
					data:{id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						console.log(obj);
						if(obj.res == 0){
							fuError();
						}else{
							fuCloseLayer();
							fuClose();
							fList();
						}
					}
				});
			}
			function fuSure(param1,param2){
				if(param2 == 'version'){
					fDelete2(param1);
				}
			}
			function fUpdate(param,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminSetting/versionUpdate",
					data:{id:param,state:param2},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							fList();
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>