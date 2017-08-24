<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="./common/styleUrl.jsp" %>
<meta charset=utf-8 />
<title>promission</title>
<style>
	body {
	  background-color: #ECECEC;
	  font-family: 'Open Sans', sans-serif;
	  font-size: 14px;
	  color: #3c3c3c;
	}
	.box p:not(:first-child) {
	  text-align: center;
	  color: #666;
	  font-family: cursive;
	  font-size: 20px;
	  text-shadow: 0 1px 0 #fff;
	  letter-spacing: 1px;
	  line-height: 2em;
	}
	.backf{
	  display: block;
	  width: 100px;height: 46px;
	  background-color: #f0f0f0;
	  text-decoration: none;color: #666;
	  margin: 0 auto;
	  font-size: 24px;line-height:46px;
	  border-radius: 4px; 
	}
	.tpic{width: 36%;height: 20%;margin:50px auto 0;border-radius:20px;position: relative;overflow: hidden;}
	.tpic:after{
	  position:absolute;
	  content:'';
	  width:100%;
	  height:100%;
	  top:0;
	  left:0;
	  border-radius:20px;
	  box-shadow:0 0 50px 10px rgba(218,218,218.9) inset;
	}
	.tpic img{max-height: 100%;max-width: 100%;height: auto;width: auto;}
</style>
</head>
<body>
  <div class="box">
  	<div class="tpic">
  		<img src="${jypath}/pc/image/error/mas.png"  alt="">
  	</div>
    <p>此处外星人出没，您无权进入(´･ω･`)</p>
    <a href="404master.html" target="_parent " class="backf">返回首页</a>
  </div>
</body>
</html>