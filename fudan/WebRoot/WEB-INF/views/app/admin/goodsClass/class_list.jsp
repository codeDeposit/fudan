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
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>类别列表</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	药品商城
                    </li>
                    <li>
                        <strong>类别列表</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-title">
        	<div class="col-lg-2"> 
            	<span class="label label-info" style="color:#fff;">类别总数：<span id="dom_total">0</span></span>
          	</div>
			<div class="col-lg-2">
            	<span class="label label-info" style="color:#fff;">一级类别：<span id="dom_one">0</span></span>
          	</div>
          	<div class="col-lg-2">
            	<span class="label label-info" style="color:#fff;">二级类别：<span id="dom_two">0</span></span>
          	</div>
          	<div class="col-lg-2">
            	<span class="label label-info" style="color:#fff;">三级类别：<span id="dom_three">0</span></span>
          	</div>
          	<!-- <div class="col-lg-1">
           		<span class="label label-info">显示类别：<span id="dom_show_num">0</span>
          	</div>
          	<div class="col-lg-1">
           		<span class="label label-danger">关闭类别：<span id="dom_close_num">0</span></span>
          	</div> -->
	    </div>	
        <div class="ibox-content">
			<div class="col-sm-4">
				<form id="form_class_search" onsubmit="return fSearch()">
					<div class="input-group col-sm-12">
						<input type="text" id="gc_name" name="gc_name" class="form-control" placeholder="分类名称" required>
						<input type="hidden" id="gc_parent_id" name="gc_parent_id" value="-1" class="form-control" >
						<span class="input-group-btn">
							<button type="submit" class="btn btn-primary">
								搜索
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-sm-8">
				<div class="col-lg-12" style="text-align:right;">
					<a href="../appAdminGoods/classIndex">
						<button class="btn btn-primary" type="submit">
							<i class="fa fa-plus"></i>&nbsp;类别添加
						</button>
					</a>
				</div>
			</div>
		</div>
		<div class="ibox-content">
			<table class="table table-striped table-bordered table-hover dataTables-example">
				<thead>
					<tr>
						<th style="width:300px;">分类名称</th>
						<!-- <th>是否显示</th> -->
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="dTable">
					
				</tbody>
			</table>
		</div>
		
		<div class="modal fade" id="modal_class_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		        	<span aria-hidden="true">&times;</span>
	        	</button>
		        <h4 class="modal-title" id="myModalLabel">类别修改</h4>
		      </div>
		      <div class="modal-body">
			       <form class="form-horizontal aForm" role="form" id="Form_class_update" onsubmit="return fClassUpdate()">
			       		<input type="hidden" name="gc_id" id="modal_gc_id" value="">
			       		<input type="hidden" name="gc_show" id="gc_show" value="">
						<div class="form-group">
							<label class="col-sm-2 control-label">分类名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="modal_gc_name" name="gc_name" maxlength="255" placeholder="分类名称" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">类型名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="modal_type_name" name="type_name" maxlength="255" placeholder="类型名称" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">分类描述</label>
							<div class="col-sm-10">
					            <textarea class="form-control" id="modal_gc_description" name="gc_description" maxlength="255" placeholder="分类描述" required></textarea>
					       </div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">关键词</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="modal_gc_keywords" name="gc_keywords" maxlength="255" placeholder="关键词" required>
							</div>
						</div> 
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" id="classSave" class="btn btn-primary">
								保存
							</button>
						</div>
					</form>
				</div>
		    </div>
		  </div>
		</div>
		<script>
			$(document).ready(function(){
				parent.scrollTo(0,0);
				fList();	
			});
			function fList(){
				var show_prints = '';	
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classList",
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj.list;
						if(ret.length == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																			+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																		  +'</tr>';
						}else{
							document.getElementById('dom_total').innerHTML = obj.obj.size;
							document.getElementById('dom_one').innerHTML = obj.obj.one;
							document.getElementById('dom_two').innerHTML = obj.obj.two;
							document.getElementById('dom_three').innerHTML = obj.obj.three;
							/* document.getElementById('dom_show_num').innerHTML = obj.obj.size;
							document.getElementById('dom_close_num').innerHTML = obj.obj.noSize; */
							for(var i=0;i<ret.length;i++){
								if(ret[i]['class2'].length != 0){//二级分类
									var class2Str = "";
									for(var j=0;j<ret[i]['class2'].length;j++){
										if(ret[i]['class2'][j]['class3'].length != 0){//三级分类
											var class3Str = "";
											for(var g=0;g<ret[i]['class2'][j]['class3'].length;g++){
												if(ret[i]['class2'][j]['class3'][g]['gc_show'] == 1){
													var classShow3Str = '<button class="btn btn-primary btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['class2'][j]['class3'][g]['gc_id'] +','+ ret[i]['class2'][j]['class3'][g]['gc_show'] +')">'
																			+'<i class="fa fa-check"></i><span class="bold">开启</span>'
																		+'</button>';
												}else{
													var classShow3Str = '<button class="btn btn-danger btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['class2'][j]['class3'][g]['gc_id'] +','+ ret[i]['class2'][j]['class3'][g]['gc_show'] +')">'
																			+'<i class="fa fa-times"></i><span class="bold">关闭</span>'
																		+'</button>';
												}						
										 		class3Str += '<tr class="class'+ (i+1) + (j+1) + (g+1) +'" name="classThree'+ (i+1) + (j+1) +'" style="display:none">'
													+'<td style="text-align:left !important;padding-left:8%;">'
														+'<i class="fa fa-circle-o"></i>&nbsp;&nbsp;'+ ret[i]['class2'][j]['class3'][g]['gc_name'] 
													+'</td>'
													/* +'<td>'
														+ classShow3Str
													+'</td>' */
													+'<td class="center">'+ ret[i]['class2'][j]['class3'][g]['createDate'] +'</td>'
													+'<td class="center">'
														+'<a href="javascript:void(0)">'
															+'<button type="button" class="btn btn-success btn-sm" onclick="fClassDetail('+ ret[i]['class2'][j]['class3'][g]['gc_id'] +',1)">'
																+'<i class="fa fa-eye"></i>'
																+'&nbsp;查看'
															+'</button>'
														+'</a>&nbsp;&nbsp;'
														+'<a href="javascript:void(0)">'
															+'<button type="button" class="btn btn-primary btn-sm" onclick="fClassDetail('+ ret[i]['class2'][j]['class3'][g]['gc_id'] +',2)">'
																+'<i class="fa fa-edit"></i>'
																+'&nbsp;编辑'
															+'</button>'
														+'</a>&nbsp;&nbsp;'
														+'<button onclick="fDelete('+ ret[i]['class2'][j]['class3'][g]['gc_id'] +',\'goodsClass\')" type="button" class="btn btn-danger btn-sm">'
															+'<i class="fa fa-trash-o"></i>'
															+'&nbsp;删除'
														+'</button>'
													+'</td>'
												+'</tr>';
											}
										}else{
											var class3Str = '';
										}	
										if(ret[i]['class2'][j]['gc_show'] == 2){
											var classShow2Str = '<button class="btn btn-primary btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['class2'][j]['gc_id'] +','+ ret[i]['class2'][j]['gc_show'] +')">'
																	+'<i class="fa fa-check"></i><span class="bold">开启</span>'
																+'</button>';
										}else{
											var classShow2Str = '<button class="btn btn-danger btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['class2'][j]['gc_id'] +','+ ret[i]['class2'][j]['gc_show'] +')">'
																	+'<i class="fa fa-times"></i><span class="bold">关闭</span>'
																+'</button>';
										}	
										class2Str += '<tr class="class'+ (i+1) +'" name="child'+ (i+1) +'" style="display:none">'
																+'<td style="text-align:left !important;padding-left:6%;">'
																	+'<a href="javascript:void(0)" style="color:#D9B300 !important;" onclick="fOpenClass('+ (j+1) +','+ (i+1) +')"><i class="fa fa-caret-right"></i>&nbsp;&nbsp;'+ ret[i]['class2'][j]['gc_name'] + '<span>(' + ret[i]['class2'][j]['class3'].length +')</span></a>'
																+'</td>'
																/* +'<td class="center">'
																	+ classShow2Str
																+'</td>' */
																+'<td class="center">'+ ret[i]['class2'][j]['createDate'] +'</td>'
																+'<td class="center">'
																	+'<a href="javascript:void(0)">'
																		+'<button type="button" class="btn btn-success btn-sm" onclick="fClassDetail('+ ret[i]['class2'][j]['gc_id'] +',1)">'
																			+'<i class="fa fa-eye"></i>'
																			+'&nbsp;查看'
																		+'</button>'
																	+'</a>&nbsp;&nbsp;'
																	+'<a href="javascript:void(0)">'
																		+'<button type="button" class="btn btn-primary btn-sm" onclick="fClassDetail('+ ret[i]['class2'][j]['gc_id'] +',2)">'
																			+'<i class="fa fa-edit"></i>'
																			+'&nbsp;编辑'
																		+'</button>'
																	+'</a>&nbsp;&nbsp;'
																	+'<button onclick="fDelete('+ ret[i]['class2'][j]['gc_id'] +',\'goodsClass\')" type="button" class="btn btn-danger btn-sm">'
																		+'<i class="fa fa-trash-o"></i>'
																		+'&nbsp;删除'
																	+'</button>'
																+'</td>'
															+'</tr>' + class3Str;
											}
								}else{
									var class2Str = '';
								}
								if(ret[i]['gc_show'] == 2){
									var classShowStr = '<button class="btn btn-primary btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['gc_id'] +','+ ret[i]['gc_show'] +')">'
															+'<i class="fa fa-check"></i><span class="bold">开启</span>'
														+'</button>';
								}else{
									var classShowStr = '<button class="btn btn-danger btn-outline btn-sm" type="button" onclick="fClassShow('+ ret[i]['gc_id'] +','+ ret[i]['gc_show'] +')">'
															+'<i class="fa fa-times"></i><span class="bold">关闭</span>'
														+'</button>';
								}	
								show_prints +='<tr class="gradeX">'
									+'<td style="text-align:left !important;padding-left:4%;">'
										+'<a href="javascript:void(0)" onclick="fOpenClass('+ (i+1) +',0)"><i class="fa fa-square"></i>&nbsp;&nbsp;'+ ret[i]['gc_name'] + '<span>(' + ret[i]['class2'].length +')</span></a>'
									+'</td>'
									/* +'<td class="center">'
										+ classShowStr
									+'</td>' */
									+'<td class="center">'+ ret[i]['createDate'] +'</td>'
									+'<td class="center">'
										+'<a href="javascript:void(0)">'
											+'<button type="button" class="btn btn-success btn-sm" onclick="fClassDetail('+ ret[i]['gc_id'] +',1)">'
												+'<i class="fa fa-eye"></i>'
												+'&nbsp;查看'
											+'</button>'
										+'</a>&nbsp;&nbsp;'
										+'<a href="javascript:void(0)">'
											+'<button type="button" class="btn btn-primary btn-sm" onclick="fClassDetail('+ ret[i]['gc_id'] +',2)">'
												+'<i class="fa fa-edit"></i>'
												+'&nbsp;编辑'
											+'</button>'
										+'</a>&nbsp;&nbsp;'
										+'<button onclick="fDelete('+ ret[i]['gc_id'] +',\'goodsClass\','+ ret[i]['gc_parent_id'] +')" type="button" class="btn btn-danger btn-sm">'
											+'<i class="fa fa-trash-o"></i>'
											+'&nbsp;删除'
										+'</button>'
									+'</td>'
								 +'</tr>' + class2Str;
							}
							$('#dTable').html(show_prints);
						}
					}
				});
			}
			function fOpenClass(param,param2){
				if(param2 == 0){
					//关闭所有子分类	
					fOpenChildClass(param);		
					$('.class' + param).toggle(300);	
				}else{
					//得到三级分类的个数
					var number = document.getElementsByName('classThree' + param2 + param).length;
					for(var i=1;i<(number+1);i++){
						$('.class'+ param2 + param + i).toggle(300);
					}
				}
			}
			function fOpenChildClass(param){//关闭所有子分类
				//得到二级分类的个数
				var number = document.getElementsByName('child' + param).length;
				for(var i=1;i<(number+1);i++){
					var number2 = document.getElementsByName('classThree'+ param + i).length;
					for(var j=1;j<(number2+1);j++){
						$('.class'+ param + i + j).hide(300);
					}
				}
			}
			function fClassShow(param,param2){
				//是否显示开启
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classShow",
					data:{gc_id:param,gc_show:param2},
					success : function(data) {
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							fList();
						}
					}
				});
			}
			function fDelete(param1,param2,param3) {
				if(param3 == 0){
					fuConfirm(param1,param2,'此分类下的所有分类将被删除！');
				}else{
					fuConfirm(param1,param2);
				}
			} 
			function fDelete2(param1,param2){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classDelete",
					data:{gc_id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
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
				if(param2 == 'goodsClass'){
					fDelete2(param1);
				}
			}
			function fClassDetail(param1,param2){
				if(param2 == 1){
					document.getElementById('classSave').style.display = 'none';
				}else{
					document.getElementById('classSave').style.display = 'inline';
				}
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classDetail",
					data:{gc_id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							document.getElementById('modal_gc_id').value = ret['gc_id'];
							document.getElementById('modal_gc_name').value = ret['gc_name'];
							document.getElementById('modal_type_name').value = ret['type_name'];
							document.getElementById('modal_gc_keywords').value = ret['gc_keywords'];
							document.getElementById('modal_gc_description').value = ret['gc_description'];
							document.getElementById('gc_show').value = ret['gc_show'];
							$("#modal_class_detail").modal("show");
						}
					}
				});
			}
			function fClassUpdate(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classUpdate",
					data:$("#Form_class_update").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError();
						}else{
							$("#modal_class_detail").modal("hide");
							fList();
						}
					}
				});
				return false;
			}
			function fSearch(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appAdminGoods/classSearch",
					data:$("#form_class_search").serialize(),
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;
						if(obj.res == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																			+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																		  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								document.getElementById('dTable').innerHTML ='<tr class="gradeX">'
										+'<td style="text-align:left !important;padding-left:4%;">'
											+'<a href="javascript:void(0)"<i class="fa fa-square"></i>&nbsp;&nbsp;'+ ret[i]['gc_name'] +'</a>'
										+'</td>'
										/* +'<td class="center">'
											+ classShowStr
										+'</td>' */
										+'<td class="center">'+ ret[i]['createDate'] +'</td>'
										+'<td class="center">'
											+'<a href="javascript:void(0)">'
												+'<button type="button" class="btn btn-success btn-sm" onclick="fClassDetail('+ ret[i]['gc_id'] +',1)">'
													+'<i class="fa fa-eye"></i>'
													+'&nbsp;查看'
												+'</button>'
											+'</a>&nbsp;&nbsp;'
											+'<a href="javascript:void(0)">'
												+'<button type="button" class="btn btn-primary btn-sm" onclick="fClassDetail('+ ret[i]['gc_id'] +',2)">'
													+'<i class="fa fa-edit"></i>'
													+'&nbsp;编辑'
												+'</button>'
											+'</a>&nbsp;&nbsp;'
											+'<button onclick="fDelete('+ ret[i]['gc_id'] +',\'goodsClass\')" type="button" class="btn btn-danger btn-sm">'
												+'<i class="fa fa-trash-o"></i>'
												+'&nbsp;删除'
											+'</button>'
										+'</td>'
									 +'</tr>';
							}
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>