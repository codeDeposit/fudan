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
		<link rel="stylesheet" href="${jypath}/app/css/plugins/webuploader/webuploader.css"> 
		<link rel="stylesheet" href="${jypath}/app/css/file/style.css"> 
		<link href="${jypath}/app/css/plugins/switchery/switchery.css" rel="stylesheet">
		<link href="${jypath}/app/css/plugins/steps/jquery.steps.css" rel="stylesheet">
		<script src="${jypath}/app/js/plugins/webuploader/webuploader.min.js"></script>
		<script src="${jypath}/app/js/file/upload.js"></script>
		<script src="${jypath}/app/js/plugins/switchery/switchery.js"></script>
		<style>
			.fancybox img{width:19% !important}
		</style>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>欢迎页面</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics" target="right">主页</a>
                    </li>
                    <li>
                        app设置
                    </li>
                    <li>
                        <strong>欢迎页面</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-content">
	         <div class="row">
	         
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>APP欢迎页面</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="basic_gallery.html#">
                                        <i class="fa fa-wrench"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">

                                <a class="fancybox" href="img/p1.jpg" title="图片1">
                                    <img alt="image" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/b509a95bb4bad1caf8133a17dc2f6ed4.jpg" />
                                </a>
                                <a class="fancybox" href="img/p2.jpg" title="图片2">
                                    <img alt="image" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/6b28d5fa18be8817a498099d462efc03.jpg" />
                                </a>
                                <a class="fancybox" href="img/p3.jpg" title="图片3">
                                    <img alt="image" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/92eaffc4b0a4b2877cc53b33aae6aebe.jpg" />
                                </a>
                                <a class="fancybox" href="img/p1.jpg" title="图片4">
                                    <img alt="image" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/3c17467ab91259a9f229d6a50322853a.jpg" />
                                </a>
                                <a class="fancybox" href="img/p2.jpg" title="图片5">
                                    <img alt="image" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/92eaffc4b0a4b2877cc53b33aae6aebe.jpg" />
                                </a>
                            </div>
                        </div>
                    </div>
					
					<div class="col-sm-12">
		                <label class="col-sm-1 control-label">图片上传</label>
		                <div class="col-sm-8">
			                <div class="demo">
					            <div id="uploader">
					                <div class="queueList">
					                    <div id="dndArea" class="placeholder">
					                        <div id="filePicker"></div>
					                        <p>或将照片拖到这里，单次最多可选5张</p>
					                    </div>
					                </div>
					                <div class="statusBar" style="display:none;">
					                    <div class="progress">
					                        <span class="text">0%</span>
					                        <span class="percentage"></span>
					                    </div><div class="info"></div>
					                    <div class="btns">
					                        <div id="filePicker2"></div><div class="uploadBtn" onclick="fUploadMark()">开始上传</div>
					                    </div>
					                </div>
					            </div>
						        <span class="help-block m-b-none" style="margin-left:4%;color:#F86B4F;letter-spacing:2px;">上传1080*1920的jpg格式图片.</span>
					        </div>
		              	</div>
	              </div>
					
            </div>
		</div>
		<div style="width:100%;height:600px;"></div>
		<script>
			 //app版本号
			$('#dom_version_choice').click(function(){
				$('#dom_version_select').toggle(500);
			});
			$(document).ready(function() {
				parent.scrollTo(0,0);
				fList();
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
			function fnClickAddRow() {
				$('#editable').dataTable().fnAddData(["Custom row", "New row", "New row", "New row", "New row"]);
			}
			function fList(){
				document.getElementById('dTable').innerHTML = '';
				$.ajax({
					type:"post",
					async:false,
					url:"${jypath}/appMember/list",
					success:function(data){
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(ret.length == 0){
							document.getElementById('dTable').innerHTML = '<tr>'
																		 	+'<td colspan="100" align="center"><i class="icon-comments"></i> 没有相关数据 </td>'
																		  +'</tr>';
						}else{
							for(var i=0;i<ret.length;i++){
								document.getElementById('dTable').innerHTML += '<tr class="gradeX">'
													+'<td>'+ (i+1) +'</td>'
													+'<td>v0.0.1</td>'
													+'<td>'
													+ '<img src="${jypath}/app/img/download.png" width="30px">'
													+'</td>'
													+'<td class="center">2017-06-30</td>'
													+'<td class="center">'
														+'<a href="javascript:void(0)">'
															+'<button type="button" onclick="fDetail('+ ret[i]['id'] +',2)" class="btn btn-primary btn-sm">'
																+'<i class="fa fa-edit"></i>'
																+'&nbsp;关闭'
															+'</button>'
														+'</a>&nbsp;'
														+'<button onclick="fDelete('+ ret[i]['id'] +',\'account\')" type="button" class="btn btn-danger btn-sm">'
															+'<i class="fa fa-trash-o"></i>'
															+'&nbsp;删除'
														+'</button>'
													+'</td>'
												+'</tr>';
							}	
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
					url : basePath+"appMember/delete",
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
				if(param2 == 'account'){
					fDelete2(param1);
				}
			}
			function fDetail(param1,param2){
				if(param2 == 1){
					document.getElementById('classSave').style.display = 'none';
				}else{
					document.getElementById('classSave').style.display = 'inline';
				}
				$.ajax({
					type : "post",
					async : false,
					url : basePath+"appMember/detail",
					data:{id:param1},
					success : function(data) {
						var obj = eval('('+ data +')');
						var ret = obj.obj;	
						if(obj.res == 0){
							fuError();
						}else{
							document.getElementById('id').value = ret['id'];
							document.getElementById('mobile').value = ret['mobile'];
							$("#modal_account_detail").modal("show");
						}
					}
				});
			}
			function fUpdate(){
				if(fCheckPassWord() == true){
					$.ajax({
						type : "post",
						async : false,
						url : basePath+"appMember/update",
						data:$("#Form_account_update").serialize(),
						success : function(data) {
							var obj = eval('('+ data +')');
							var ret = obj.obj;	
							if(obj.res == 0){
								fuError();
							}else{
								$("#modal_account_detail").modal("hide");
								fList();
							}
						}
					});
					return false;
				}
			}
			function fPwdCheck() {//必须为字母加数字且长度不小于8位
				var str = document.getElementById('password').value;
				if (str == null || str.length < 6) {
					return false;
				}
				var reg1 = new RegExp(/^[0-9A-Za-z]+$/);
				if (!reg1.test(str)) {
					return false;
				}
				var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
				if (reg.test(str)) {
					return true;
				} else {
					return false;
				}
			}
			//密码检查
			function fCheckPassWord() {
				var pd = fPwdCheck();
				if (pd == false) {
					alert('请输入6 - 20位字母、数字');
					return false;
				} else {
					return true;
				}
			}
		</script>
	</body>
</html>