<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="jypath" value="${pageContext.request.contextPath}"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String imgUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
%>
<script>
    var jypath = '${jypath}';
    var basePath = '<%=basePath %>';
    var goodsDetailImg = '<%=imgUrl %>';
</script>
