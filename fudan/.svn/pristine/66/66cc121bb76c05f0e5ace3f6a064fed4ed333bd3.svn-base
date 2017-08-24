<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if(session.getAttribute("webSiteName") == null){ %>
	<title>${webSite.webTitleWord }</title>
<% }else{ %>
	<title><%=session.getAttribute("webSiteName") %></title>
<% } %>
<% if(session.getAttribute("logo") == null){ %>
 	<link rel='icon' href='${jypath }/pc/image/logo/fudan.ico' type='image/x-ico' />
<% }else{ %>
	<link rel='icon' href="<%=imgUrl %>image/webSite/<%=session.getAttribute("logo") %>" type='image/x-ico' >
<% } %>
 
