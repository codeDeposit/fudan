<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<option value="">-- 选择市 --</option>
<c:choose>
	<c:when test="${not empty city}">
		<c:forEach items="${city}" var="area" varStatus="vs">
			<option value="${area.id }">${area.name}</option>
		</c:forEach>
	</c:when>
</c:choose>
