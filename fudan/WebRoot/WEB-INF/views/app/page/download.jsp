<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="../common/styleUrl.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<meta name="format-detection" content="email=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<meta name="renderer" content="webkit">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>掌上医苑</title>
<link rel='icon' href='${jypath}/app/img/icon.ico' type='image/x-ico' />
<%@ include file="../common/js.jsp" %>
<style>
	/*公共部分开始*/
	* {
		margin: 0;
		padding: 0;
		list-style: none;
	}

	*, *:after, *:before {
		box-sizing: border-box;
	}

	html {
		width: 100%;
		height: 100%;
		overflow: hidden;
		font-size: 10px;
		font-size: 62.5%;
	}

	body {
		font-size: 1.4rem;
		font-family: "Segoe UI", "Lucida Grande", Helvetica, Arial,
			"Microsoft YaHei", FreeSans, Arimo, "Droid Sans",
			"wenquanyi micro hei", "Hiragino Sans GB", "Hiragino Sans GB W3",
			FontAwesome, sans-serif;
	}

	a {
		text-decoration: none;
	}

	img {
		border: none;
	}

	.clearfix {
		zoom: 1;
	}

	.clearfix:after {
		clear: both;
		content: "";
		display: block;
		height: 0;
		overflow: hidden;
	}
	/*公共部分结束*/
	body {
		width: 100%;
		height: 100%;
		overflow: hidden;
		background: #525252;
		line-height: 1.2;
	}

	.body-bd {
		width: 100%;
		height: 100%;
		position: relative;
		top: 0;
		left: 0;
		bottom: 0;
		z-index: 99;
		padding-top: 3rem;
		background: url("http://hsknowledgebase.hsyuntai.com/qrcenter/images/bg.jpg") no-repeat;
		background-size: cover;
		overflow: auto;
	}

	.body-foot {
		position: absolute;
		left: 50%;
		margin-left: -6.5rem;
		bottom: 1rem;
		color: #696969;
		font-size: 1.4rem;
	}

	.hos-logo {
		width: 9rem;
		height: 9rem;
		margin: 0 auto;
	}

	.hos-logo img {
		width: 100%;
		height: 100%;
	}

	.hos-info {
		padding-top: 1rem;
		text-align: center;
		font-size: 1.4rem;
		color: #696969;
	}

	.hos-name {
		padding: 1rem 2rem 2rem;
		color: #4c4c4c;
		font-size: 2rem;
	}

	.hos-down {
		padding: 1rem 2rem;
		line-height: 2rem;
	}

	.hos-href {
		padding-top: 2rem;
	}

	.hos-href>a {
		margin-top: 1rem;
		display: inline-block;
		width: 16.3rem;
		height: 5.2rem;
	}

	.hos-href>a>img {
		width: 100%;
		height: 100%;
	}

	.hide-href-wrap {
		position: absolute;
		left: 0;
		top: 0;
		z-index: 1;
		width: 100%;
		height: 6rem;
	}

	.hide-href {
		position: absolute;
		top: 1rem;
		right: 1.5rem;
		width: 26rem;
		padding: .4rem 4rem 1rem 0;
		background: url("http://hsknowledgebase.hsyuntai.com/qrcenter/images/point.png") right top no-repeat;
		background-size: 16%;
		font-size: 1.6rem;
		line-height: 2rem;
		color: #fff;
	}

	.bg-wrap {
		background: #fff;
	}

	.full {
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body class="bg-wrap">
	<div id='bd_wrap' class="full">
		<div class="hide-href-wrap">
			<div class="hide-href" id="hide_href">
				点击右上角菜单<br>在浏览器中打开并安装应用
			</div>
		</div>
		<div class="body-bd" id="body_wrap">
			<div class="hos-logo" >
				<img id="dom_logo" src="" />
			</div>
			<div class="hos-info">
				<div class="hos-name" id="app_name">掌上医苑&nbsp;<span id="dom_version"></span></div>
				<div class="hos-down">
					点击下载按钮即可下载，<br> 若是微信扫描请点击微信右上角按钮，<br>
					<span id="conf_info">选择在系统自带的浏览器中打开即可</span>
				</div>
				<div class="hos-href" id="toggle_href">
					<a id="dom_ios_url" href="">
						<img id="dom_ios" src="">
					</a>
					<a id="dom_android_url" href="">
						<img id="dom_android" src="">
					</a>
				</div>
			</div>
			<div class="body-foot" id="dom_app_version"></div>
		</div>
	</div>
	<script>
		window.onload = function(){
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appDownload/version",
				data:{
					/* id:${customer.id} */
				},
				success:function(data){
					var obj = eval('('+ data +')');
					if(obj.res == 0){
						alert(obj.resMsg);
					}else{
						document.getElementById('dom_version').innerHTML = obj.obj.version;
						document.getElementById('dom_ios_url').href = obj.obj.appPack;
						document.getElementById('dom_android_url').href = obj.obj.appPack;
					}
				}
			}); 
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appDownload/urlSet",
				data:{
					/* id:${customer.id} */
				},
				success:function(data){
					var obj = eval('('+ data +')');
					if(obj.res == 0){
						alert(obj.resMsg);
					}else{
						document.getElementById('dom_logo').src = obj.obj.app_logo_img;
						document.getElementById('dom_ios').src = obj.obj.ios_img;
						document.getElementById('dom_android').src = obj.obj.android_img;
						document.getElementById('dom_app_version').innerHTML = obj.obj.copyright;
						document.title = obj.obj.app_name;
					}
				}
			}); 
		}
	</script>
	<script src="http://hsknowledgebase.hsyuntai.com/qrcenter/js/zepto.min.js"></script>
         var u = navigator.userAgent, app = navigator.appVersion;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,//火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信 （2015-01-22新增）
                ali: u.indexOf('AliApp') > -1              //阿里服务窗
            };
        }(),
        language:(navigator.browserLanguage || navigator.language).toLowerCase()
    }
    $(function(){
    	var msg = "";
    	msg = $.trim(msg);
    	if(msg){
    		alert(msg);	
    	}else{
    		$('body').removeClass('bg-wrap');
    		$('#bd_wrap').fadeIn('fast');
    		var setFlag = false;
            if (browser.versions.mobile) {//判断是否是移动设备打开。browser代码在下面
                var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
                if (browser.versions.weixin) { //在微信中打开
                    setFlag=true;
                }
                if (ua.match(/WeiBo/i) == "weibo") {//在新浪微博客户端打开
                    setFlag=true;
                }
                if (ua.match(/qq\//i)=="qq/") {//在QQ客户端打开
                    setFlag=true;
                }
                if (browser.versions.ali) { //在阿里服务窗中打开
                    setFlag=true;
                }
                if (browser.versions.ios) {//是否在IOS浏览器打开
                	var getUrl = $('#toggle_href > a').eq(0).attr('href');                	
                    $('#conf_info').text('选择“在浏览器中打开”即可');
                    $('#toggle_href > a').eq(1).remove();
                    if(!setFlag){
                    	var r=confirm("您确定要下载"+'掌上医苑'+"应用么?");
                        if (r==true)
                        {
                            location.href = getUrl;
                        }
                    }                   
                }
                if(browser.versions.android){
                	var getUrl = $('#toggle_href > a').eq(1).attr('href');
                    $('#toggle_href > a').eq(0).remove();
                    $('#conf_info').text('选择在系统自带的浏览器中打开即可');
                    if(!setFlag){
                    	var r=confirm("您确定要下载"+'掌上医苑'+"应用么?");
                        if (r==true)
                        {
                            location.href = getUrl;
                        }
                    }                      
                }
            } else {//否则就是PC浏览器打开,两个地址都显示
                $('#toggle_href').prev('.hos-down').remove();
            }

            if(setFlag){//在屏蔽环境中打开
            	
            	if (browser.versions.ali){
            		$('#hide_href').html('点击右上角菜单<br>在浏览器中打开并安装应用');
            	}
            	
            
                $('#toggle_href > a').removeAttr('href').bind('tap',function(event){
                    event.stopPropagation();
                    event.cancelBubble=true;
                    $('#body_wrap').animate({top:"6rem"},100);         
                });

                $('#body_wrap').bind('tap',function(){
                    $('#body_wrap').animate({top:"0"},100,function(){
                        $('#hide_href').hide();
                    });
                });
            }
    	}
    	    
    });
    </script>
</body>
</html>