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
		<link rel="stylesheet" href="${jypath}/app/css/plugins/webuploader/webuploader.css"> 
		<link rel="stylesheet" href="${jypath}/app/css/file/style.css"> 
		<link href="${jypath}/app/css/plugins/treeview/bootstrap-treeview.css" rel="stylesheet">
		<script src="${jypath}/app/js/jquery-2.1.1.min.js"></script>
		<script src="${jypath}/app/js/plugins/treeview/bootstrap-treeview.js"></script>
    	<script src="${jypath}/app/js/demo/treeview-demo.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>类别添加</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="index.html">主页</a>
                    </li>
                    <li>
                        <a>药品商城</a>
                    </li>
                    <li>
                        <strong>类别添加</strong>
                    </li>
                </ol>
            </div>
        </div>
        <!-- <div class="row wrapper wrapper-content animated fadeInRight">
        	<div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content" style="border-style:none;">
                        <div id="treeview11" class="test"></div>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="ibox-content">
	        <form id="Form_class" class="form-horizontal" onsubmit="return fSubmit()">
	          <div class="form-group col-sm-12">
	             <label class="col-sm-2 control-label">商品一级类别</label>
	              <div class="col-sm-6">
	                  <select class="form-control m-b" name="gc_id" id="gc_id" onchange="fClassData('gc_id2')" >
	                      <option value="0">请选择</option>
	                  </select>
	              </div>
	           </div>
	           <div class="form-group col-sm-12">
	            	<label class="col-sm-2 control-label">商品二级类别</label>
	              	<div class="col-sm-6">
		                  <select class="form-control m-b" name="gc_id2" id="gc_id2" onchange="fClassData('gc_id3')" >
		                      <option value="0">请选择</option>
		                  </select>
	              	</div>
	           </div>
	           <div class="form-group col-sm-12">
	            	<label class="col-sm-2 control-label">商品三级类别</label>
	              	<div class="col-sm-6">
		                  <select class="form-control m-b" name="gc_id3" id="gc_id3" >
		                      <option value="0">请选择</option>
		                  </select>
	              	</div>
	           </div>
	           <div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">分类名称</label>
	           		<div class="col-sm-6">
		              	<input type="text" name="gc_name" id="gc_name" class="form-control" placeholder="分类名称" maxlength="50" required>
	              		<span class="help-block m-b-none">在对应的分类下添加分类名称,不选择分类默认为一级类别.</span>
	              	</div>
			   </div>
			   <div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">类型名称</label>
	           		<div class="col-sm-6">
		              	<input type="text" name="type_name" id="type_name" class="form-control" placeholder="类型名称" maxlength="50" required>
	              	</div>
			   </div>
			   <div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">关键词</label>
	           		<div class="col-sm-6">
		              	<input type="text" name="gc_keywords" id="gc_keywords" class="form-control" placeholder="关键词" maxlength="50" required>
	              	</div>
			   </div>
			   <div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">分类描述</label>
	           		<div class="col-sm-6">
		              	<input type="text" name="gc_description" id="gc_description" class="form-control" placeholder="分类描述" maxlength="50" required>
	              	</div>
			   </div>
			   <div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">是否显示</label>
	           		<div class="col-sm-6">
	           			<label class="checkbox-inline">
		              		<input type="checkbox" id="gc_show" name="gc_show" checked value="1">
		              		<span class="help-block m-b-none">默认为显示状态.</span>
		              	</label>
	              	</div>
			   </div>
	           <div class="form-group">
	              <div class="col-sm-12 col-sm-offset-6">
	                  <button class="btn btn-primary" type="submit">确定</button>
	                  <a href="../appAdminGoods/classListPage" style="color:#676a6c"><button class="btn btn-white" type="button">返回</button></a>
	              </div>
	   	  		</div>
		   </form>
		</div>
	</body>
	<script>
		var _pd = "";
		$(document).ready(function(){
			parent.scrollTo(0,0);
			fClassData('gc_id');//一级分类调取
		});
		function fSubmit(){
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appAdminGoods/classAdd",
				data:$("#Form_class").serialize(),
				success:function(data){
					var obj = eval('('+ data +')');
					if(obj.res == 0){
						fuError();
					}else{
						fuSuccess();
						document.getElementById("gc_name").value = "";
						document.getElementById("type_name").value = "";
						document.getElementById("gc_keywords").value = "";
						document.getElementById("gc_description").value = "";
						fClassData(_pd);
					}
				}
			}); 
			return false;		
		}
		function fClassData(param){//类别调取
			_pd = param;
			var id = 0;
			if(param == 'gc_id2'){
				var item_select = document.getElementById('gc_id');
				id = item_select.options[item_select.selectedIndex].value;
				if(id == 0){
					id = -1;
				}
			}else if(param == 'gc_id3'){
				var item_select = document.getElementById('gc_id2');
				id = item_select.options[item_select.selectedIndex].value;
				if(id == 0){
					id = -1;
				}
			}
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appAdminGoods/classData",
				data:{gc_parent_id:id},
				success:function(data){
					var data = eval('('+ data +')');
					if(data.res == 0){
						fuError();
					}else{
						var html = '';
						if(data.obj.length == 0){
							html = '<option value="0">请选择</option>';
						}else{
							var show = '<option value="0">请选择</option>';
							for(var i=0;i<data.obj.length;i++){
								html += '<option value="'+ data.obj[i]['gc_id'] +'">'+ data.obj[i]['gc_name'] +'</option>';
							}
						}
						document.getElementById(param).innerHTML = show + html;
					}
				}
			});
		}
	</script>
</html>