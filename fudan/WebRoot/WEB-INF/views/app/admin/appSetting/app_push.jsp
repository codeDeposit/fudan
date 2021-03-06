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
                <h2>消息推送</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                        app设置
                    </li>
                    <li>
                        <strong>消息推送</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-title">
			<h5>推送概览</h5>
        </div>
        <div class="ibox-content">
        	<form method="get" class="form-horizontal">
	            <div class="form-group">
	                <label class="col-sm-2 control-label">标题</label>
	                <div class="col-sm-4">
	                    <input type="text" class="form-control">
	                </div>
	            </div>
	            <div class="hr-line-dashed"></div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label">内容</label>
	                <div class="col-sm-4">
	                    <input type="text" style="height:120px;" class="form-control">
	                </div>
	            </div>
	            <div class="hr-line-dashed"></div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label">用户id</label>
	                <div class="col-sm-4">
	                    <input type="text" class="form-control">
	                </div>
	            </div>
	            <div class="hr-line-dashed"></div>
	            <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2" style="text-align:right">
                        <button class="btn btn-primary" type="submit">发送</button>
                    </div>
                </div>
			</form>
        </div>
        <div class="ibox-title">
			<h5>推送记录</h5>
        </div>
        <div class="ibox-content">
	        <table class="table table-striped table-bordered table-hover dataTables-example">
                 <thead>
                     <tr>
                         <th>序号</th>
                         <th>手机号</th>
                         <th>意见内容</th>
                         <th>日期</th>
                         <th>操作</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr class="gradeX">
                         <td>1</td>
                         <td>120xxxx0082</td>
                         <td>掌上医苑越做越好</td>
                         <td class="center">2017-02-22</td>
                         <td class="center" data-toggle="modal" data-target="#myModal6">回复</td>
                     </tr>
                 </tbody>
             </table>
			
			<div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog"  aria-hidden="true">
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
										<input type="text" style="height:92px;width:122%" name="goods_name" id="goods_name" class="form-control" placeholder="意见回复" maxlength="200" required>
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
				fTable();
			 });
			 function fTable(){
				$('.dataTables-example').dataTable();
			}
		</script>
	</body>
</html>