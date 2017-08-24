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
                <h2>意见反馈</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                        app设置
                    </li>
                    <li>
                        <strong>意见反馈</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-title">
			<h5>反馈列表</h5>
        </div>
        <div class="ibox-content">
	        
	        <table class="table table-striped table-bordered table-hover dataTables-example">
                 <thead>
                     <tr>
                         <th>序号</th>
                         <th>手机号</th>
                         <th>意见内容</th>
                         <th>日期</th>
                         <th>回复内容</th>
                         <th>操作</th>
                     </tr>
                 </thead>
                 <tbody id="dom_table">
                     
                 </tbody>
             </table>
			
			<div class="modal inmodal fade" id="Modal_advise" tabindex="-1" role="dialog"  aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">回复</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal aForm" role="form" id="Form_suggest" onsubmit="return fSubmit()">
								<div class="form-group col-sm-12">
									<div class="col-sm-12">
										<input type="hidden" name="id" id="dom_id">
										<input type="hidden" name="mobile" id="dom_mobile">
										<input type="hidden" name="state" id="dom_state" value="2">
										<input type="text" style="height:92px;width:122%" name="reply" id="msg" class="form-control" placeholder="意见回复" maxlength="255" required>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-white" data-dismiss="modal">
								关闭
							</button>
							<button type="submit" class="btn btn-primary" form="Form_suggest">
								保存
							</button>
						</div>
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
					url : basePath + "appAdminSetting/suggestList",
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
									if(ret[i]['state'] == 1){
										var caozuo = '<button data-toggle="modal" data-target="#Modal_advise"  onclick="fValue('+ ret[i]['id'] +','+ ret[i]['mobile'] +','+ ret[i]['state'] +')" type="button" class="btn btn-warning btn-sm">'
														+'回复'
													+'</button>&nbsp;';
									}else{
										var caozuo = '<span>'
														+'已回复'
													+'</span>&nbsp;';
									}
									document.getElementById("dom_table").innerHTML += '<tr>'
					                                	+'<td>'+ ret[i]['id'] +'</td>'
					                                    +'<td>'
														+ ret[i]['mobile']
														+'</td>'
					                                    +'<td>'
														+ ret[i]['msg']
														+'</td>'
														+'<td>'
														+ ret[i]['addTime']
														+'</td>'
														+'<td>'
														+ ret[i]['reply']
														+'</td>'
														+'<td>'
														+ caozuo
														+'</td>'
					                                +'</tr>';
								}
							}
							fTable();
						}
					}
				});	 
		    }
		    function fValue(param,param2,param3){
		    	document.getElementById('dom_id').value = param;
		    	document.getElementById('dom_mobile').value = param2;
		    }
		    function fSubmit(){
		     	$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminSetting/suggestReply",
					data:$("#Form_suggest").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fList();
							$("#Modal_advise").modal("hide");
						}
					}
				});
				return false;
	     }
		</script>
	</body>
</html>