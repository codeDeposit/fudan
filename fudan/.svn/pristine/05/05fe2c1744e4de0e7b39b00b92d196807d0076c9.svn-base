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
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>人员列表</h2>
					<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
						<li>
							<a href="../appAdminLogin/statistics">主页</a>
						</li>
						<li>
							订单管理
						</li>
						<li>
							<strong>人员列表</strong>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<div class="col-lg-1">
							<span class="label label-info" style="color:#fff;">人员总数：<span id="dom_total">0</span></span>
						</div>
						<div class="col-lg-11" style="text-align:right;margin-top:-20px;">
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#modal_person_add" >
								<i class="fa fa-plus"></i>&nbsp;人员添加
							</button>
						</div>
					</div>
					<div class="ibox-content">
						<table id="example" class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>编号</th>
									<th>照片</th>
									<th>姓名</th>
									<th>性别 </th>
									<th>手机号</th>
									<th>地址</th>
									<th>年龄</th>
									<th>配送次数</th>
									<th>注册时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="dom_table"></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal inmodal fade" id="modal_person_add" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-ml">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">配送人添加</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_person_add" onsubmit="return fSubmit()">
							<input type="hidden" name="picture" id="picture_add1">
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>姓名</label>
								<div class="col-sm-10">
									<input type="text" id="name" name="name" placeholder="姓名" class="form-control" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">照片</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${jypath }/pc/image/user/user.png" id="dImage1" style="width:13%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:14%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl" id="FileInput1" onchange="javascript:setImagePreview(1);"  style="filter:alpha(opacity:1);opacity:0;width:124px;height:113px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									</br>
									</br>
									<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片,200*200px,大小不超过4M</small></p>
									</br>
									<button type="button" id="buttonUpload1" class="btn btn-info btn-sm" onclick="fUpload(1)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess1" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>年龄</label>
								<div class="col-sm-10">
									<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="age" name="age" class="form-control" placeholder="年龄" maxlength="3" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>手机</label>
								<div class="col-sm-10">
									<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="phone" name="phone" class="form-control" placeholder="手机" maxlength="11" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<div class="col-sm-10">
										<div class="radio">
	                                        <label>
	                                           <input type="radio" name="sex" value="男" checked>男
	                                    	</label>
	                                    </div>
	                                    <div class="radio">
	                                    	<label>
	                                    		<input type="radio" name="sex" value="女" >女
	                                    	</label>
	                                    </div>
									</div>	
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">地址</label>
								<div class="col-sm-10">
									<input type="text" name="address" id="address" class="form-control" placeholder="地址" >
								</div>
							</div>
						</form>
                    </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="submit" class="btn btn-primary" form="Form_person_add">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal inmodal fade" id="modal_person_edit" tabindex="-1" role="dialog"  aria-hidden="true">
			<div class="modal-dialog modal-ml">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">修改</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal aForm" role="form" id="Form_person_edit" onsubmit="return fUpdate()">
							<input type="hidden" id="personId_edit" name="personId">
							<input type="hidden" id="picture_add2" name="picture">
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>姓名</label>
								<div class="col-sm-10">
									<input type="text" id="name_edit" name="name" placeholder="姓名" class="form-control" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">照片</label>
								<div class="col-sm-10">
									<div style="position:relative;display: inline;">
										<img src="${jypath }/pc/image/user/user.png" id="dImage2" style="width:30%;background-color:#dfdfdf" class="img-thumbnail">
										<img src="${jypath }/pc/image/setting/add.png" style="width:14%;margin:4%;margin-left:16%;cursor:pointer" class="img-rounded">
										<input type="file" name="picUrl" id="FileInput2" onchange="javascript:setImagePreview(2);"  style="filter:alpha(opacity:1);opacity:0;width:124px;height:113px;position:absolute;top:-47px;right:16%;cursor:pointer">
									</div>
									</br>
									</br>
									<p class="text-warning"><small>支持png,jpg,jpeg,ico格式图片,200*200px,大小不超过4M</small></p>
									</br>
									<button type="button" id="buttonUpload2" class="btn btn-info btn-sm" onclick="fUpload(2)" disabled="false" style="margin:0 auto;">图片上传</button>
									<button type="button" id="buttonSuccess2" class="btn btn-success btn-sm" disabled="false" style="display:none;margin:0 auto;">上传完成</button>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>年龄</label>
								<div class="col-sm-10">
									<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="age_edit" name="age" class="form-control" placeholder="年龄" maxlength="3" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label"><span style="color:red;">*</span>手机</label>
								<div class="col-sm-10">
									<input type="text" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" id="phone_edit" name="phone" class="form-control" placeholder="手机" maxlength="11" required>
								</div>
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-10">
									<div class="radio">
                                        <label>
                                           <input type="radio" name="sex" id="sex_edit1" value="男">男
                                    	</label>
                                    </div>
                                    <div class="radio">
                                    	<label>
                                    		<input type="radio" name="sex" id="sex_edit2" value="女" >女
                                    	</label>
                                    </div>
								</div>	
							</div>
							<div class="form-group col-sm-12">
								<label class="col-sm-2 control-label">地址</label>
								<div class="col-sm-10">
									<input type="text" name="address" id="address_edit" class="form-control" placeholder="地址" >
								</div>
							</div>
						</form>
                    </div>
					<div class="modal-footer">
						<button type="button" class="btn btn-white" data-dismiss="modal">
							关闭
						</button>
						<button type="submit" class="btn btn-primary" form="Form_person_edit">
							保存
						</button>
					</div>
				</div>
			</div>
		</div>
		<script>
			var _imgSrc = '';
			$(document).ready(function() {
				   parent.scrollTo(0,0);
					//初始化表格
				   table = $("#example").DataTable({
						pageLength:10, //首次加载的数据条数
						stateSave: false, //状态保存，再次加载页面时还原表格状态
						autoWidth: false, //禁用自动调整列宽
						stripeClasses: ["odd", "even"], //为奇偶行加上样式，兼容不支持CSS伪类的场合
						processing: false, //隐藏加载提示,自行处理
						serverSide: true, //启用服务器端分页
						orderMulti: false, //多列排序
						searching: false,
						columns: [{
					      "data": null,
						}, {
					        data: "picture",
					        "orderable": false,
					        "targets": 1,
					        "render": function(data,type,row,meta){
								return '<img src="'+ data +'" width="80px">';
							}
						}, {
					        data: "name",
					        "orderable": false,
					        "targets":2,
						}, {
					        data: "sex",
					        "orderable": false,
					        "targets": 3
						}, {
					        data: "phone",
					        "targets": 4,
					        "orderable": false,
						}, {
					        data: "address",
					        "orderable": false,
					        "targets": 5,
						}, {
					        data: "age",
					        "orderable": false,
					        "targets": 6,
						}, {
					        data: "num",
					        "orderable": false,
					        "targets": 7,
						}, {
					        data: "addtime",
					        "orderable": false,
					        "targets": 8,
						}, {
							data: "caozuo",
							"orderable": false,
							"targets": 9,
							"render": function(data,type,row,meta){
								var button= '<button type="button" data-toggle="modal" data-target="#modal_person_edit" onclick="fEdit('+ row.personId +')" class="btn btn-primary btn-sm">' + '<i class="fa fa-edit"></i>' + '&nbsp;编辑' + '</button>'
									+'&nbsp;<button type="button" onclick="fDelete('+ row.personId +',\'person\')" class="btn btn-danger btn-sm">' + '<i class="fa fa-remove"></i>' + '&nbsp;删除' + '</button>';
								return button;
							}
						}],
					ajax: function(data, callback, settings) {
						//封装请求参数
						var page = (data.start / data.length) + 1; //当前页码（不使用）
						var limit = data.length; //页面显示记录条数，在页面显示每页显示多少项的时候
						var start = data.start; //开始的记录序号
						$.ajax({
							url: basePath + "appPerson/listLimitData",
							type: "POST",
							cache: false, //禁用缓存
							data: {page:page,limit:limit,start:start}, //传入组装的参数
							dataType: "json",
							beforeSend: function(request) {
								request.setRequestHeader("token", localStorage.token);
							},
							success: function(result) {
								document.getElementById("dom_total").innerHTML = result.obj.total;
								// 封装返回数据
								var returnData = {};
								returnData.draw = data.draw; //这里直接自行返回了draw计数器,应该由后台返回
								returnData.recordsTotal = result.obj.total; //页数（所有数据总数）
								returnData.recordsFiltered = result.obj.total; //后台不实现过滤功能，每次查询均视作全部结果
								returnData.data = result.obj.data;//返回的数据列表
								//调用DataTables提供的callback方法，代表数据已封装完成并传回DataTables进行渲染，此时的数据需确保正确无误，异常判断应在执行此回调前自行处理完毕
								callback(returnData);
							}
						});
					},
				});
				//序号增加
				table.on('order.dt search.dt',function(){  
			        table.column(0,{  
			            search: 'applied',  
			            order: 'applied'  
			        }).nodes().each(function(cell,i){  
			            i = i + 1;  
			            var page = table.page.info();  
			            var pageno = page.page;  
			            var length = page.length;  
			            var columnIndex = (i+pageno*length);  
			            cell.innerHTML = columnIndex;  
			        });  
			    }).draw();  
			});
			function fSubmit(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appPerson/add",
					data :$("#Form_person_add").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							$("#modal_person_add").modal("hide");
							fuCloseLayer();
							table.draw();
							document.getElementById("Form_person_add").reset();
							document.getElementById("Form_doctor").reset();
							document.getElementById("dImage").src = "${jypath }/pc/image/user/user.png";
							document.getElementById('buttonUpload').disabled = true;
							document.getElementById("buttonSuccess").style.display = "none";//隐藏完成按钮
							document.getElementById("buttonUpload").style.display = "block";//隐藏完成按钮
						}
					}
				});
				return false;
			}
			function fEdit(param){
				document.getElementById("personId_edit").value = param;
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appPerson/list",
					data :{personId:param},
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							document.getElementById("name_edit").value = obj.obj[0]['name'];
							document.getElementById("age_edit").value = obj.obj[0]['age'];
							document.getElementById("phone_edit").value = obj.obj[0]['phone'];
							document.getElementById("address_edit").value = obj.obj[0]['address'];
							if(obj.obj[0]['sex'] == '男'){
								document.getElementById("sex_edit1").checked = true;
							}else{
								document.getElementById("sex_edit2").checked = true;
							}
							document.getElementById("dImage2").src = obj.obj[0]['picture'];
						}
					}
				});
			}	
			function fUpdate(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appPerson/update",
					data :$("#Form_person_edit").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							$("#modal_person_edit").modal("hide");
							fuCloseLayer();
							table.draw();
						}
					}
				});
				return false;
			}
			function setImagePreview(param){//下面用于图片上传预览功能
				var docObj = document.getElementById("FileInput" + param);
				var imgObjPreview = document.getElementById("dImage" + param);
				var ldot = docObj.value.lastIndexOf(".");
		        var type = docObj.value.substring(ldot + 1);
				if(docObj.value.length > 1 && docObj.value) {     
					if(type == "JPG" || type == "jpg" || type == "jpeg" || type == "JPEG" || type == "ico" || type == "ICO" || type == "png" || type == "PNG") {
						if(docObj.size > 4194304){//文件大小判断
							alert("图片大小不能超过4M");
							docObj.outerHTML = input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
							document.getElementById('FileInput' + param).value = "";
						}else{
							$('#buttonUpload' + param).removeAttr("disabled"); //上传按钮启用
							document.getElementById("buttonUpload" + param).style.display = "inline";//上传按钮显示
							$('#buttonSuccess' + param).attr('disabled',"true");//完成按钮禁用
							document.getElementById("buttonSuccess" + param).style.display = "none";//隐藏完成按钮
							if(docObj.files &&docObj.files[0])
							{
								//火狐下，直接设img属性
								/* imgObjPreview.style.display = 'block'; */
								imgObjPreview.style.width = '80px';
								imgObjPreview.style.height = '80px';
								//imgObjPreview.src = docObj.files[0].getAsDataURL();
								//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
								imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
							}
							else
							{
								//IE下，使用滤镜
								docObj.select();
								var imgSrc = document.selection.createRange().text;
								var localImagId = document.getElementById("dImage");
								//必须设置初始大小
								localImagId.style.width = "80px";
								localImagId.style.height = "80px";
								//图片异常的捕捉，防止用户修改后缀来伪造图片
								try{
									localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
									localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
								}
								catch(e)
								{
									alert("您上传的图片格式不正确，请重新选择!");
									return false;
								}
								document.selection.empty();
							}
						}
					}else{
						alert("您上传的图片格式不正确，请重新选择!");
						docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
						document.getElementById('FileInput' + param).value = "";
					}
				}else{
					docObj.outerHTML=input.outerHTML.replace(/(value=\").+\"/i,"$1\"");
					document.getElementById('FileInput' + param).value = "";
				}	
				return true;
			}
			function fUpload(param){//图片上传
				fuLoading();
				document.getElementById("buttonUpload" + param).style.display = "none";//上传按钮隐藏
				$('#buttonUpload' + param).attr('disabled',"true");//上传按钮禁用
				$.ajaxFileUpload({
					type:"post",
					async:false,
					url:"${jypath}/appPerson/updateImg",
					ecureuri:false,
			    	fileElementId: "FileInput"+param,
					dataType:"JSON",
					success:function(data){
						var obj = eval('('+ data +')');
						if(obj.res == 0){
							fuError(obj.resMsg);
						}else{
							_imgSrc = obj.obj;
							document.getElementById('picture_add' + param).value = obj.obj;
							document.getElementById("buttonSuccess" + param).style.display = "block";//显示完成按钮
							fuShowSuccess();
						}
						fuCloseLayer();
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
					url : basePath + "appPerson/delete",
					data :{personId:param1},
					success : function(data) {
						var obj = eval('(' + data + ')');
						if (obj.res == 0) {
							fuError();
						} else {
							fuCloseLayer();
							fuClose();
							table.draw();
						}
					}
				});
			}
			function fuSure(param1,param2){
				if(param2 == 'person'){
					fDelete2(param1);
				}
			}
		</script>
	</body>
</html>