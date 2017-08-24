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
	<body style='background-color:#fff'>
		<div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>药品有效期</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="../appAdminLogin/statistics">主页</a>
                    </li>
                    <li>
                    	基础信息
                    </li>
                    <li>
                        <strong>药品有效期</strong>
                    </li>
                </ol>
            </div>
        </div>
		<div class="row  border-bottom white-bg dashboard-header">
			<div class="col-lg-12">
				<div class="ibox float-e-margins">
					<div class="ibox-content">
						<form class="form-horizontal aForm" role="form" id="Form_term" onsubmit="return fUpdate()">
							<input type="hidden" name="id" id="id" value="1">
							<div class="form-group">
				                <label class="col-sm-2 control-label">效期</label>
				                <div class="col-sm-3">
				                	<div class="input-group m-b">
                                        <input style="text-align: right;" type="text" class="form-control" value="${number }" name="number" id="number" required> 
                                        <span class="input-group-addon">天</span>
                                    </div>
                                    <span class="help-block m-b-none">商品离过期时间在有效期内进行提示</span>
				                </div>
				            </div>
							<div class="hr-line-dashed"></div>
				            <div class="form-group">
			                    <div class="col-sm-4 col-sm-offset-2" style="text-align:right">
			                        <button class="btn btn-primary" type="submit">保存</button>
			                    </div>
			                </div>
						</form>
					</div>
				</div>
			</div>
		</div> 
		<script>
			$(document).ready(function() {
				parent.scrollTo(0,0);
			});
			function fUpdate(){
				$.ajax({
					type : "post",
					async : false,
					url : basePath + "appAdminGoods/termUpdate",
					data:$("#Form_term").serialize(),
					success : function(data) {
						var obj = eval('(' + data + ')');
						var ret = obj.obj;
						if (obj.res == 0) {
							fuError();
						} else {
							fuSuccess();
						}
					}
				});
				return false;
			}
		</script>
	</body>
</html>