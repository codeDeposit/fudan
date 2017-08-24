<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- #dialog-confirm -->
<div id="jyConfirm" class="hide">
	<div class="center">
		<h4><i class="icon-hand-right blue bigger-120"></i> <span id="jyConfirmStr"></span></h4>
	</div>
</div>
<div id="jyInfo" class="hide">
	<div class="center">
		<h4><i class="icon-info-sign blue bigger-120"></i> <span id="jyInfoStr"></span></h4>
	</div>
</div>
<div id="jyError" class="hide">
	<div class="center">
		<h4><i class="icon-warning-sign red bigger-120"></i> <span id="jyErrorStr"></span></h4>
	</div>
</div>
<div id="jyLoading" class="hide">
	<div class="center">
		<h4><img alt="loading" src="<c:url value="/static/images/system/loading.gif"/>"><span id="jyLoadingStr"></span></h4>
	</div>
</div>
<div id="uploadTemplate" class="hide">
	<div id="tips" style="display:inline-block;width:70%;height:100%;">
		<p>未选择文件</p>
	</div>
	<div style="display:inline-block;width:25%;height:100%;">
		<form id="uptem" onsubmit="return bindClick('template');">
			<input id="template" type="file" name="fileAttach" required="required" style="display:none;">
			<button type="button" class="btn btn-info btn-sm" onclick="bindClick('template');">选择模板</button>
		</form>
	</div>
</div>