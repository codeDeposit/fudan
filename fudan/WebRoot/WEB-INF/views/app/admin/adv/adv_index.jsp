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
	    <style type="text/css">
			input{vertical-align:middle; margin:0; padding:0}
			.btn-sm{margin-top:22px !important;}
		</style>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>广告添加</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	广告管理
                    </li>
                    <li>
                        <strong>广告添加</strong>
                    </li>
                </ol>
            </div>
        </div>
        
        <div class="ibox-content">
			<div class="text-right" style="margin:10px">
        		<small style="float:left;letter-spacing:2px;color:#3498db">广告图片大小636*357像素,广告数量默认为3个,并且不少于3个</small>
				<button type="button" class="btn btn-primary" onclick="fAdd()">
	               	<i class="fa fa-plus"></i>&nbsp;添加
	            </button>
			</div>
			<div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>图片</th>
                                    <th style="width:300px;">上传</th>
                                    <th>位置</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="dom_table">
                                 
                            </tbody>
                        </table>
						
                    </div>
                </div>
            </div>
			
		</div>
		<script>
			$(document).ready(function () {
				parent.scrollTo(0,0);
			  	fList();
		    });
		    function fList(){
		    	document.getElementById("dom_table").innerHTML = '';
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminAdv/list",
					/* data:{order_state:${order_state}}, */
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							if (ret.length == 0) {
								document.getElementById('dom_table').innerHTML = '<tr>' + '<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>' + '</tr>';
							} else {
								for (var i = 0; i < ret.length; i++) {
									if(ret[i]['slide_sort'] == 1){
										var sortStr = '<a href="javascript:void(0)" title="下移" onclick="fDown('+ ret[i]['adv_id'] +','+ ret[i]['slide_sort'] +')"><i class="fa fa-long-arrow-down"></i></a>&nbsp;&nbsp;';
									}else if(ret[i]['slide_sort'] == ret.length ){
										var sortStr = '<a href="javascript:void(0)" title="上移" onclick="fUp('+ ret[i]['adv_id'] +','+ ret[i]['slide_sort'] +')"><i class="fa fa-long-arrow-up"></i></a>&nbsp;&nbsp;';
									}else{
										var sortStr = '<a href="javascript:void(0)" title="下移" onclick="fDown('+ ret[i]['adv_id'] +','+ ret[i]['slide_sort'] +')"><i class="fa fa-long-arrow-down"></i></a>&nbsp;&nbsp;'
													 +'<a href="javascript:void(0)" title="上移" onclick="fUp('+ ret[i]['adv_id'] +','+ ret[i]['slide_sort'] +')"><i class="fa fa-long-arrow-up"></i></a>&nbsp;&nbsp;';
									}
									if(ret[i]['state'] == 1){
										var button = '<button onclick="fUpdate('+ ret[i]['adv_id'] +',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-eye-slash"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var button = '<button onclick="fUpdate('+ ret[i]['adv_id'] +',1)" type="button" class="btn btn-primary btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									document.getElementById("dom_table").innerHTML += '<tr>'
					                                	+'<td name="dom_adv"><div style="margin-top:22px;">'+ ret[i]['slide_sort'] +'</div></td>'
					                                	+'<td>'
					                                		+'<img src="'+ ret[i]['img'] +'" width="120px">'
					                                	+'</td>'
					                                    +'<td>'
					                                    	+'<div style="position:relative;width:300px;top:22px;">'
							                                	+'<input type="text" id="textfield'+ ret[i]['adv_id'] +'" style="height:22px; border:1px solid #cdcdcd; width:180px;" />&nbsp;'
																+'<input type="button" value="图片上传" style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/>'
																+'<input type="file" name="file" id="fileField'+ ret[i]['adv_id'] +'" style="cursor:pointer;position:absolute;top:0px;left:38px;filter:alpha(opacity:0);opacity: 0;" onchange="fUrlShow('+ ret[i]['adv_id'] +')" />'
															+'</div>'
														+'</td>'
					                                    +'<td>'
														+'<div style="margin-top:22px;">'
															+ sortStr
														+'</div>'
														+'</td>'
					                                    +'<td>'
															+ button						                                    	
															+'<button onclick="fRemove('+ ret[i]['adv_id'] +')" type="button" class="btn btn-danger btn-sm">'
																+'<i class="fa fa-trash-o"></i>&nbsp;删除'
															+'</button>&nbsp;'
															+'<button onclick="fUpdateImg('+ ret[i]['adv_id'] +')" type="button" class="btn btn-success btn-sm">'
																+'<i class="fa fa-edit"></i>&nbsp;更新'
															+'</button>'
														+'</td>'
					                                +'</tr>';
								}
							}
						}
					}
				});	 
		    }
		    function fUrlShow(param){
		    	document.getElementById("textfield" + param).value = document.getElementById("fileField" + param).value;
		    }
		    function fAdd(){
		    	var _adv_num = document.getElementsByName('dom_adv').length;
		    	if(_adv_num == 0){
		    		document.getElementById('dom_table').innerHTML = '';
		    	}
		     	document.getElementById("dom_table").innerHTML += '<tr id="dom_adv_tr'+ (_adv_num+1) +'">'
                                	+'<td name="dom_adv"><div style="margin-top:22px;">'+ (_adv_num+1) +'</div></td>'
                                	+'<td><div style="margin-top:22px;">无</div>'
                                	+'</td>'
                                    +'<td>'
                                    	+'<div style="position:relative;width:300px;top:22px;">'
		                                	+'<input type="text" id="textfield'+ (_adv_num+1) +'" style="height:22px; border:1px solid #cdcdcd; width:180px;" />&nbsp;'
											+'<input type="button" value="图片上传" style="background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;"/>'
											+'<input type="file" name="file" id="fileField'+ (_adv_num+1) +'" style="cursor:pointer;position:absolute;top:0px;left:38px;filter:alpha(opacity:0);opacity: 0;" onchange="fUrlShow('+ (_adv_num+1) +')" />'
										+'</div>'
									+'</td>'
                                    +'<td>'
										+'<div style="margin-top:22px;"><a href="javascript:void(0)"><i class="fa fa-long-arrow-up"></i></a>&nbsp;&nbsp;'
										+'<a href="javascript:void(0)"><i class="fa fa-long-arrow-down"></i></a>'
									+'</div></td>'
                                    +'<td>'
										+'<button onclick="fRemoveDom('+ (_adv_num+1) +')" type="button" class="btn btn-danger btn-sm">'
											+'<i class="fa fa-trash-o"></i>&nbsp;删除'
										+'</button>&nbsp;'
										+'<button onclick="fSave('+ (_adv_num+1) +')" type="button" class="btn btn-success btn-sm">'
											+'<i class="fa fa-save"></i>&nbsp;保存'
										+'</button>'
									+'</td>'
                                +'</tr>';
		     }
		     function fRemove(param){
		     	var _adv_num = document.getElementsByName('dom_adv').length;
		     	if(_adv_num <= 3){
		     		fuError('广告数量不能低于3个');
		     	}else{
			     	$.ajax({
						type : "post",
						async : false,
						url : basePath + "appAdminAdv/delete",
						data:{adv_id:param},
						success : function(data) {
							var obj = eval('(' + data + ')');
							var ret = obj.obj;
							if (obj.res == 0) {
								fuError();
							} else {
								fList();
							}
						}
					});
				}
		     }
		     function fRemoveDom(param){
		     	document.getElementById('dom_adv_tr'+param).innerHTML = '';
		     	fList();
		     }
		     function fUp(param,param2){
		     	var sort = param2 - 1;
		     	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminAdv/up",
					data:{adv_id:param,slide_sort:sort},
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
						}
					}
				});
		     }
		     function fDown(param,param2){
		     	var sort = param2 + 1;
		     	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminAdv/down",
					data:{adv_id:param,slide_sort:sort},
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
						}
					}
				});
		     }
		     function fUpdate(param,param2){
		     	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminAdv/update",
					data:{adv_id:param,state:param2},
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
						}
					}
				});
		     }
		     function fSave(param){
		     	var arrId = "fileField" + param;
		     	var pd = document.getElementById(arrId).value;
		     	if(pd == '' || pd == undefined){
		     		fuError('请上传 图片');
		     	}else{
			     	$.ajaxFileUpload({
						type:"post",
						async:false,
						url:"${jypath}/appAdminAdv/add",
						ecureuri:false,
				    	fileElementId:arrId,
						dataType:"JSON",
						data:{
							state:1
						},
						success:function(data){
							var obj = eval('('+ data +')');
							if(obj.res == 0){
								fuError();
							}else{
								fList();
							}
						}
					});
				}
		    }
		    function fUpdateImg(param){
		     	var arrId = "fileField" + param;
		     	var pd = document.getElementById(arrId).value;
		     	if(pd == '' || pd == undefined){
		     		fuError('请上传 图片');
		     	}else{
			     	$.ajaxFileUpload({
						type:"post",
						async:false,
						url:"${jypath}/appAdminAdv/updateImg",
						ecureuri:false,
				    	fileElementId:arrId,
						dataType:"JSON",
						data:{
							adv_id:param
						},
						success:function(data){
							var obj = eval('('+ data +')');
							if(obj.res == 0){
								fuError();
							}else{
								fList();
							}
						}
					});
				}
		    }
		</script>
	</body>
</html>