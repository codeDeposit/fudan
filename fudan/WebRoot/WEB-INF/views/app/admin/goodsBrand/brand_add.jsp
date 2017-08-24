<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="../../common/styleUrl.jsp"%>
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
                <h2>品牌添加</h2>
                <ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
                    <li>
                        <a href="index.html">主页</a>
                    </li>
                    <li>
                        <a>药品商城</a>
                    </li>
                    <li>
                        <strong>品牌添加</strong>
                    </li>
                </ol>
            </div>
        </div>
        <div class="ibox-content">
	        <form id="Form_brand" class="form-horizontal" onsubmit="return fSubmit()">
	        	<input type="hidden" name="brand_recommend" id="brand_recommend" value="1">
  				<div class="form-group col-sm-12">
	          		<label class="col-sm-2 control-label"><span style="color:red;">*</span>品牌名称 </label>
	           		<div class="col-sm-6">
		              	<input type="text" name="brand_name" id="brand_name" class="form-control" placeholder="品牌名称 " maxlength="50" required>
	              	</div>
   			  	</div>
			   	<div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">品牌图片</label>
	           		<div class="col-sm-6">
		              	<input type="file" name="file" id="file" class="form-control" placeholder="品牌图片" maxlength="50" >
	              	</div>
			   	</div>
			   	<div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">是否显示</label>
	           		<div class="col-sm-6">
	           			<label class="checkbox-inline">
		              		<input type="checkbox" id="brand_apply" name="brand_apply" checked value="1">
		              		<span class="help-block m-b-none">默认显示</span>
		              	</label>
	              	</div>
			   	</div>
			   	<div class="form-group col-sm-12">
	           		<label class="col-sm-2 control-label">是否推荐</label>
	           		<div class="col-sm-6">
	           			<label class="checkbox-inline">
		              		<input type="checkbox" id="brand_recommend" name="brand_recommend" value="1">
		              		<span class="help-block m-b-none">默认不推荐</span>
		              	</label>
	              	</div>
			   	</div>
			   	<input type="hidden" name="brand_class" id="brand_class">
	           	<div class="form-group">
	              <div class="col-sm-12 col-sm-offset-6">
	                  <button class="btn btn-primary" type="submit">确定</button>
	                  <a href="../appAdminGoods/brandListPage" style="color:#676a6c">
	                  	<button class="btn btn-white" id="form_reset" type="button">返回</button>
	                  </a>
	              </div>
	   	  		</div>
		   </form>
		</div>
	</body>
	<script>
		$(document).ready(function(){
			parent.scrollTo(0,0);
		});
		function fSubmit(){
			$.ajaxFileUpload({
				type:"post",
				async:false,
				url:"${jypath}/appAdminGoods/brandAdd?" + $("#Form_brand").serialize(),
				ecureuri:false,
		    	fileElementId:'file',
				dataType:"JSON",
				success:function(data){
					var obj = eval('('+ data +')');
					if(obj.res == 0){
						fuError();
					}else{
						fuShowSuccess();
						setTimeout("window.location.href = '../appAdminGoods/brandListPage';",1000);
					}
				}
			});
			return false;		
		}
	</script>
</html>