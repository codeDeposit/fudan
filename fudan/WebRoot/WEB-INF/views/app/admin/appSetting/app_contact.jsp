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
		<%@ include file="../../common/js.jsp" %>
    	<!-- SUMMERNOTE -->
	    <script src="${jypath}/app/js/plugins/summernote/summernote.min.js"></script>
	    <script src="${jypath}/app/js/plugins/summernote/summernote-zh-CN.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>联系信息</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                        app设置
                    </li>
                    <li>
                        <strong>联系信息</strong>
                    </li>
                </ol>
            </div>
        </div>
        
        <div class="ibox-content">
        
			<div class="text-right" style="margin:10px">
				<button data-toggle="modal" data-target="#Modal_contact" type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_contact">
	                   	<i class="fa fa-edit"></i>&nbsp;修改
	            </button>
			</div>
			<div class="modal inmodal fade" id="Modal_contact" tabindex="-1" role="dialog"  aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">联系信息修改</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal aForm" role="form" id="Form_contact" onsubmit="return fSubmit()">
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">显示内容</label>
									<div class="col-sm-10">
										<input type="hidden" id="dom_id" name="id">
										<input type="text" name="msg" id="dom_msg" class="form-control" placeholder="客服页面显示内容（200字）" maxlength="200" required>
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">联系电话</label>
									<div class="col-sm-10">
										<input type="text" name="phone" id="dom_phone" class="form-control" placeholder="客服电话" maxlength="50" required>
										<!--  <span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span> -->
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">服务邮箱</label>
									<div class="col-sm-10">
										<input type="text" name="email" id="dom_email" class="form-control" placeholder="邮箱地址" maxlength="50" required>
										<!--  <span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span> -->
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">微信公众号</label>
									<div class="col-sm-10">
										<input type="text" name="weixin" id="dom_weixin" class="form-control" placeholder="微信公众号" maxlength="50" required>
										<!--  <span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span> -->
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">官网地址</label>
									<div class="col-sm-10">
										<input type="text" name="urls" id="dom_urls" class="form-control" placeholder="网站地址" maxlength="50" required>
										<!--<span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span> -->
									</div>
								</div>
								<div class="form-group col-sm-12">
									<label class="col-sm-2 control-label">公司名称</label>
									<div class="col-sm-10">
										<input type="text" name="company" id="dom_company" class="form-control" placeholder="公司名称" maxlength="50" required>
										<!--  <span class="help-block m-b-none">如果不输入商品货号,系统自动生成一个唯一的货号.</span> -->
									</div>
								</div>
							</form>
                        </div>
						<div class="modal-footer">
							<button type="button" class="btn btn-white" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" class="btn btn-primary" form="Form_contact">
								保存
							</button>
						</div>
					</div>
				</div>
			</div>
            
			<div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">

                        <table class="table">
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>内容</th>
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
			 $(document).ready(function() {
			 	parent.scrollTo(0,0);
		 		fList();
			 });
			 function fTable(){
				$('.dataTables-example').dataTable();
			 }
			 function fList(){
		    	document.getElementById("dom_table").innerHTML = '';
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminSetting/contactList",
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
									if(ret[i]['msg_state'] == 1){
										var caozuoMsg = '<button onclick="fUpdate('+ ret[i]['id'] +',\'msg\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoMsg = '<button onclick="fUpdate('+ ret[i]['id'] +',\'msg\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									if(ret[i]['phone_state'] == 1){
										var caozuoPhone = '<button onclick="fUpdate('+ ret[i]['id'] +',\'phone\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoPhone = '<button onclick="fUpdate('+ ret[i]['id'] +',\'phone\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									if(ret[i]['email_state'] == 1){
										var caozuoEmail = '<button onclick="fUpdate('+ ret[i]['id'] +',\'email\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoEmail = '<button onclick="fUpdate('+ ret[i]['id'] +',\'email\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									if(ret[i]['weixin_state'] == 1){
										var caozuoWeixin = '<button onclick="fUpdate('+ ret[i]['id'] +',\'weixin\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoWeixin = '<button onclick="fUpdate('+ ret[i]['id'] +',\'weixin\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									if(ret[i]['urls_state'] == 1){
										var caozuoUrls = '<button onclick="fUpdate('+ ret[i]['id'] +',\'urls\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoUrls = '<button onclick="fUpdate('+ ret[i]['id'] +',\'urls\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									if(ret[i]['company_state'] == 1){
										var caozuoCompany = '<button onclick="fUpdate('+ ret[i]['id'] +',\'company\',2)" type="button" class="btn btn-warning btn-sm">'
														+'<i class="fa fa-close"></i>&nbsp;关闭'
													+'</button>&nbsp;';
									}else{
										var caozuoCompany = '<button onclick="fUpdate('+ ret[i]['id'] +',\'company\',1)" type="button" class="btn btn-success btn-sm">'
														+'<i class="fa fa-eye"></i>&nbsp;显示'
													+'</button>&nbsp;';
									}
									document.getElementById("dom_id").value = ret[i]['id'];
									document.getElementById("dom_msg").value = ret[i]['msg'];
									document.getElementById("dom_phone").value = ret[i]['phone'];
									document.getElementById("dom_email").value = ret[i]['email'];
									document.getElementById("dom_weixin").value = ret[i]['weixin'];
									document.getElementById("dom_urls").value = ret[i]['urls'];
									document.getElementById("dom_company").value = ret[i]['company'];
									document.getElementById("dom_table").innerHTML += '<tr>'
                                    +'<td>显示内容</td>'
	                                    +'<td>'+ ret[i]['msg'] +'</td>'
	                                    +'<td>'
	                                    	+ caozuoMsg
										+'</td>'
	                                +'</tr>'
	                                +'<tr>'
	                                    +'<td>联系电话</td>'
	                                    +'<td>'+ ret[i]['phone'] +'</td>'
	                                    +'<td>'
											+ caozuoPhone
										+'</td>'
	                               +' </tr>'
	                                +'<tr>'
	                                    +'<td>服务邮箱</td>'
	                                    +'<td>'+ ret[i]['email'] +'</td>'
	                                    +'<td>'
	                                    	+ caozuoEmail
	                                    +'</td>'
	                                +'</tr>'
	                                +'<tr>'
	                                    +'<td>微信公众号</td>'
	                                    +'<td>'+ ret[i]['weixin'] +'</td>'
	                                    +'<td>'
	                                    	+ caozuoWeixin
	                                    +'</td>'
	                                +'</tr>'
	                                +'<tr>'
	                                    +'<td>官网地址</td>'
	                                    +'<td>'+ ret[i]['urls'] +'</td>'
	                                    +'<td>'
	                                    	+ caozuoUrls
	                                    +'</td>'
	                                +'</tr>'
	                                +'<tr>'
	                                    +'<td>公司名称</td>'
	                                    +'<td>'+ ret[i]['company'] +'</td>'
	                                    +'<td>'
	                                    	+ caozuoCompany
	                                    +'</td>'
	                                +'</tr>';
								}
							}
							fTable();
						}
					}
				});	 
		    }
		    function fUpdate(param,param2,param3){
		    	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminSetting/contactUpdate",
					data:{id:param,mark:param2,state:param3},
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
		    function fSubmit(){
		     	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminSetting/contactUpdate",
					data:$("#Form_contact").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_contact").modal("hide");
						}
					}
				});
				return false;
	     }
		</script>
	</body>
</html>