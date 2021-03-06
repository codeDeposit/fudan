<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<%@ include file="../common/styleUrl.jsp" %>
	<%@ include file="../common/title.jsp" %>
    <link rel="stylesheet" href="${jypath}/pc/css/bootstrap/bootstrap.min.css">
    <link href="${jypath}/pc/css/login/login.css" rel="stylesheet" type="text/css" />
    <script src="${jypath}/pc/js/jquery/jquery-2.1.1.min.js"></script>
    <script src="${jypath}/pc/js/jquery/jquery.md5.js"></script>
    <script src="${jypath}/pc/js/login/login.js"></script>
</head>
<body>
<%@ include file="../common/toast.jsp" %>
<section id="modify_box">
       <div class="modify_content" id="modify_content">
           <div class="title-logo text-center">
               <c:if test="${webSite.webTitleMark == 1}">
				<p>${webSite.webTitleWord } <br></p>
			</c:if>
			<c:if test="${webSite.webTitleMark == 2}">
				<img src="<%=imgUrl %>/image/webSite/${webSite.webTitleImg }"/>
			</c:if>
           </div>
           <div class="login-form">
               <form class="bs-example bs-example-form" role="form" onsubmit="return loginCheck()">
                   <div class="form-group">
                       <input type="text" class="form-control" id="accountNameId" name="accountName" placeholder="请输入账号" required>
                   </div>
                   <div class="form-group">
                       <input type="password" id="passwordId" class="form-control" name="password" placeholder="请输入密码" required>
                   </div>
                  <div class="form-group">
                      <div class="col-xs-offset-1">
                          <div class="checkbox">
                              <label style="color:#fff;">
                                  <input type="checkbox" value="on" >记住密码
                              </label>
                              <div class="text-right pull-right">
                                  <i class="icon-user-md"></i><a href="${jypath}/backstage/account/step1">忘记密码？</a>
                              </div> 
                          </div>
                      </div>
                  </div>
                   <div class="form-group">
                       <button type="submit" class="btn btn-success" id="loginBtn">登 陆</button>
                   </div>
                   <div class="logGif"></div>
               </form>
               <div class="link-reg">
                   <span>还没有账号？</span>&nbsp;
                   <a href="${jypath}/backstage/account/register">普通注册</a>&nbsp;
                   <c:if test="${webSite.wzcgLogin == 1}">
                    <a href="${jypath}/backstage/wzcg/expert/expert_notice">专家注册</a>&nbsp;
                    <a href="${jypath}/backstage/wzcg/supplier/supplier_notice">供应商注册</a>
                   </c:if>
               </div>
           </div>
       </div>
       <div class="wrice"></div>
       <div class="picWork"><img src="${jypath }/pc/image/login/loginBg.png"   alt=""></div>
       <div id="modify_footer" class="text-center">
          ${webSite.copyright }
       </div>
   </section>
</body>
</html>