<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#systemSetting li a{padding:0 !important;}
#systemSetting li{height:34px;}
#systemSetting li:hover{background-color:#15bc75;border-radius: 8px;}
</style>
<nav class="navbar navbar-default" role="navigation" style="background-color:#1AB394;">
  <div class="container-fluid">
    <div class="navbar-header">
      	<div class="navbar-header" style="width:208px;margin-left: 20px;">
      		 <% if(session.getAttribute("logo") == null){ %>
      		 	网站logo
      		  <% }else{ %>
      		  	<img src="<%=imgUrl %>image/webSite/<%=session.getAttribute("logo")%>" id="systemLogo">
          	 <% } %>
	    </div>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <span data-toggle="dropdown" style="cursor:pointer;position:absolute;top:12px;right:168px;">
          	 <% if(session.getAttribute("picUrl") == null){ %>
          	 	<img src="/fudan/pc/image/user/user.png"  width="30px;" >
          	 <% }else{ %>
          	 	<img src="<%=imgUrl %>image/account/<%=session.getAttribute("loginName") %>/<%=session.getAttribute("picUrl") %>"  width="30px;" >
          	 <% } %>
          </span>
          <span data-toggle="dropdown" style="position:absolute;width:141px;right:19px;top:15px;color:#fff;float: left;">
	      	<a title="<%=session.getAttribute("name") %>" style="width:56px;color:#fff;margin-right: 8px;height:15px;overflow:hidden; word-break:keep-all;text-overflow: ellipsis;line-height:15px;margin-top:5px;display: block;float: left;">
	      		<%=session.getAttribute("name") %>
	      	</a>
	      	<a title="<%=session.getAttribute("orgName") %>"  class="label label-success fu-padding-none fu-color" style="color:#fff;margin-left:58px;padding:0px 6px !important;border-radius: 18px; border: 1px solid #D8DADA;font-size:8px;color:#D8DADA !important;width:76px;overflow:hidden; word-break:keep-all;text-overflow: ellipsis;display: block;background:#1ab394 !important;">
	      		<%=session.getAttribute("orgName") %>
	      	</a>
          </span>
          <ul class="dropdown-menu" role="menu" style="margin-top:55px;margin-right:17px;z-index:999999999;">
            <li><a href="#" onclick="perSetting()">设置</a></li>
            <li class="divider"></li>
            <li><a href="#" onclick="fLogout()">退出</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div id="dSetting"></div><!-- 用户信息设置 -->
<script>
    function perSetting(){
       $.ajax({
           type:"post",                                 
           async:false,
           url:"${jypath}/backstage/systemInfo", 
           data:{},
           success:function(data){
               $('#dSetting').html(data);
           }
       }); 
    }
	function fLogout(){
		 window.location.href="${jypath}/system_logout";	
	}
</script>