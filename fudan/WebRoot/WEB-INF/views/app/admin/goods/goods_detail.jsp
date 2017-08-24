<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<%@ include file="../../common/styleUrl.jsp" %>
		<meta charset="utf-8">
		<title>商品详情</title>
		<meta name="viewport" content="maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width,initial-scale=1.0" />
		<meta name="format-detection" content="telephone=no,email=no,date=no,address=no">
		<link rel="stylesheet" type="text/css" href="${jypath}/mobile/css/common/aui2/aui.css" />
		<link rel="stylesheet" type="text/css" href="${jypath}/mobile/css/common/aui-slide.css" />
		<script src="${jypath}/mobile/js/jquery/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="${jypath}/mobile/js/aui2/aui-tab.js" ></script>
		<script type="text/javascript" src="${jypath}/mobile/js/swipe/swipe.js"></script>
		<style>
			html,body {
				width:60% !important;
				margin:0 auto;
				background: #ffffff;
			}
			.aui-tab-item.aui-active{
	    		color:#3ab3a5;
	    		border-bottom:2px solid #3ab3a5;
	    	}.aui-slide-node {
	    		text-align:center;
	    	}
	    	.aui-slide-node img {
				width:280px;
			}
		    .swipe {  
	            overflow: hidden;  
	            visibility: hidden;  
	            position: relative;  
	        }  
	        .swipe-wrap {  
	            overflow: hidden;  
	            position: relative;  
	        }  
	        .swipe-wrap > div {  
	            float: left;  
	            width: 100%;  
	            position: relative;  
	        }  
	        #slider {  
	            max-width: 650px;/* 设置最大的宽度 */  
	            margin: 0px auto; /* 居中对齐 */  
	        }  
	        div {  
	            margin: 0;/* 对齐，四周宽度都为0，在轮播的时候，以整张图片进行移动 */  
	        } 
	        .swipe-box img{height:300px !important;width:100%;}
	    </style>
	</head>
	<body>
		<header id="header" class="aui-bar aui-bar-nav" style="height:2.25rem;position:fixed;background:#ebeced;color:#515151;z-index:9999999;">
			<!-- <a class="aui-pull-left aui-btn" onclick="api.closeWin()"> <span class="aui-iconfont aui-icon-left" style="color:#515151"></span></a> -->
			<div class="aui-title" id="dom_goods_name">
				<!-- 商品名 -->
			</div>
			<!-- <a class="aui-pull-right aui-btn" onclick="fOpenCart()">
				<span class="aui-iconfont aui-icon-cart" style="color:#515151"></span>
				<div class="aui-badge" style="position:relative;top:0; left:0;font-size:8px;">x&nbsp;<span id="dom_cart_goods_num"></span></div>
			</a> -->
		</header>
		<div id="aui-slide" style="margin-top:60px;">
			<div id="slider" class="swipe" style="visibility:visible;">  
		        <div class="swipe-wrap" id="dom_goods_img">  
		        </div>  
		    </div>  
		</div>
		<ul class="aui-list aui-media-list">
			<li id="dom_goods_jianjie" class="aui-list-header" style="background:#F4F4F4;font-size:14px;color:#515151">
	        	<!-- 商品简介 -->
	        </li>
	        <li class="aui-list-item aui-list-item-middle">
	            <div class="aui-media-list-item-inner">
	                <div class="aui-list-item-inner">
	                    <div class="aui-list-item-text">
	                        <div class="aui-list-item-title aui-font-size-20" style="color:#ff6364;font-weight:bold;">
	                        <div id="dom_goods_name_title" style="width:100%;color:#000;font-size:14px;"><!-- 商品名称--></div>
	                        	<img src="${jypath}/mobile/image/shopping/goods/money.png" style="width:16px;display:inline"> 
	                        	<span id="dom_goods_price"><!-- 商品价格 --></span>
	                    	</div>
	                        <div class="aui-list-item-right" id="dom_goods_activity"></div>
	                    </div>
	                    <div class="aui-list-item-text" id="dom_goods_address">
	                   		<!-- 商品制造地址 -->
	                    </div>
	                </div>
	            </div>
	        </li>
		</ul>
		<div class="aui-tab" id="tab"> 
	        <div class="aui-tab-item aui-active">基本信息</div>
	        <div class="aui-tab-item"><div></div>图文详情</div>
	        <div class="aui-tab-item">说明书</div>
	    </div>
	    <div style="margin-top:6px;margin-bottom:46px;">
	    	<!-- 基本信息 -->
	    	<div id="dom_goods_basic" style="width:95%;margin:0 auto;height:150px;background:#ebeced;padding:4px;font-size:12px !important;color:#8a8a8a">
	    		<div>商品名称：<span id="dom_basic_goods_name"></span></div>
	    		<div style="width:40%;float:left;margin-top:4px;">品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：<span id="dom_basic_brand_name"></span></div><div style="width:58%;float:left;margin-top:4px;">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<span id="dom_basic_goods_norms"></span></div>
	    		<div style="width:58%;float:left;margin-top:4px;">生产厂商：<span id="dom_basic_goods_address"></span></div>
	    		<div style="margin-top:4px;float:left;width: 100%;">批准文号：	<span id="dom_basic_approve"> </span></div>
	    	</div>
	    	<!-- 图文详情 -->
	    	<div id="dom_goods_imgs" style="display:none;width:100%;">
				<!--<img style="width:100%;" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/463df965fbb9e7bb94f62dc4b2d1684d.jpg" alt="" />-->
	    	</div>
	    	<!-- 说明书  -->
	    	<div id="dom_goods_desc" style="display:none;">
	    		<!--<img style="width:100%;" src="http://a5af4823928dd948c98e.b0.upaiyun.com/apicloud/463df965fbb9e7bb94f62dc4b2d1684d.jpg" alt="" />-->
	    	</div>
	    </div>
	    <%-- <div style="height:40px;width:100%;font-size:12px;background:#F4F4F4;position:fixed;bottom:0px;z-index:9999999999999;">
	    	<span onclick="fOpenChat()" style="width:33%;margin-top:6px;float:left;text-align:center;"><img src="${jypath}/mobile/image/shopping/goods/zixun.png" width="32px"/></span>
	    	<span onclick="fGoodsCheck()" style="width:30%;margin-top:6px;height:28px;line-height:28px;border-radius:8px;color:#3ab3a5;float:left;text-align:center;border:1px solid #3ab3a5">加入购物车</span>
	    	<span onclick="fPay()" style="width:30%;margin-top:6px;height:28px;line-height:28px;border-radius:8px;color:#fff;float:left;text-align:center;background:#3ab3a5;margin-left:8px;">购	买</span>
	    </div> --%>
	</body>
	<script>
		window.onload = function(){
			parent.scrollTo(0,0);
			fGetGoods();
			setTimeout('fSlide()',1000);
		}
		function currentFun(index) {	
			console.log(index);
		}
		function fSlide(){
			var slider =  
	          Swipe(document.getElementById('slider'), {  
	            auto: 3000,  //滚动时间
	            continuous: true,  
	            callback: function(pos) {  
	                //方法回调
	            }  
	        }); 
		}
		var tab = new auiTab({
	        element:document.getElementById("tab"),
	    },function(ret){
	    	if(ret.index == 1){
	    		document.getElementById('dom_goods_basic').style.display = 'block';
	    		document.getElementById('dom_goods_imgs').style.display = 'none';
	    		document.getElementById('dom_goods_desc').style.display = 'none';
			}else if(ret.index == 2){
				document.getElementById('dom_goods_basic').style.display = 'none';
	    		document.getElementById('dom_goods_imgs').style.display = 'block';
	    		document.getElementById('dom_goods_desc').style.display = 'none';
			}else{
				document.getElementById('dom_goods_basic').style.display = 'none';
	    		document.getElementById('dom_goods_imgs').style.display = 'none';
	    		document.getElementById('dom_goods_desc').style.display = 'block';
			}
	    });
	    //得到商品信息
		function fGetGoods(){
			$.ajax({
				type:"post",
				async:false,
				url:"${jypath}/appAdminGoods/find",
				data:{
					"goods_id":${goods_id},
				},
				success:function(data){
					var obj = eval('('+ data +')');
					ret = obj;
					if(ret.res == 1){
						//分销价格
						_goods_fenxiao_price = ret.obj.goods_promotion_price;
						//商品名称
						document.getElementById('dom_goods_name').innerHTML = ret.obj.goods_name;
						document.getElementById('dom_goods_name_title').innerHTML = ret.obj.goods_name;
						_goods_name = ret.obj.goods_name;
						//商品促销
						if(ret.obj.goods_promotion == 1){
							document.getElementById('dom_goods_activity').innerHTML = '<span class="aui-label" style="background-color:#ff6364;color:#F4F4F4;border-radius: 2px;padding:6px;"> <i class="aui-iconfont aui-icon-flag" style="font-size:10px;color:#f1c40f;font-weight:bold;"></i>&nbsp;限时特价</span>';
						}
						//商品图片
						if(ret.obj.goods_image1 == (basePath + 'image/goods/')){
							var img1 = '';
						}else{
							var img1 = '<div class="swipe-box">'
											+'<img src="'+ ret.obj.goods_image1 +'"/>'
									   +'</div>';
						}
						if(ret.obj.goods_image2 == (basePath + 'image/goods/')){
							var img2 = '';
						}else{
							var img2 = '<div class="swipe-box">'
											+'<img src="'+ ret.obj.goods_image2 +'"/>'
									   +'</div>';
						}
						if(ret.obj.goods_image3 == (basePath + 'image/goods/')){
							var img3 = '';
						}else{
							var img3 = '<div class="swipe-box">'
											+'<img src="'+ ret.obj.goods_image3 +'"/>'
									   +'</div>';
						}
						if(ret.obj.goods_image4 == (basePath + 'image/goods/')){
							var img4 = '';
						}else{
							var img4 = '<div class="swipe-box">'
											+'<img src="'+ ret.obj.goods_image4 +'"/>'
									   +'</div>';
						}
						if(ret.obj.goods_image5 == (basePath + 'image/goods/')){
							var img5 = '';
						}else{
							var img5 = '<div class="swipe-box">'
											+'<img src="'+ ret.obj.goods_image5 +'"/>'
									   +'</div>';
						}
						document.getElementById('dom_goods_img').innerHTML = img1 + img2 + img3 + img4 + img5;
						//商品价格
						document.getElementById('dom_goods_price').innerHTML = ret.obj.goods_price;
						_goods_price = ret.obj.goods_price;
						//商品简介
						document.getElementById('dom_goods_jianjie').innerHTML = ret.obj.goods_desc;
						//商品厂商
						document.getElementById('dom_goods_address').innerHTML = ret.obj.goods_address;
						//基本信息
						document.getElementById('dom_basic_goods_name').innerHTML = ret.obj.goods_name;
						document.getElementById('dom_basic_brand_name').innerHTML = ret.obj.brand_name;
						document.getElementById('dom_basic_goods_norms').innerHTML = ret.obj.goods_norms;
						document.getElementById('dom_basic_goods_weight').innerHTML = ret.obj.goods_weight;
						document.getElementById('dom_basic_goods_address').innerHTML = ret.obj.goods_address;
						document.getElementById('dom_basic_approve').innerHTML = ret.obj.approve;
						document.getElementById('dom_basic_service_desc').innerHTML = ret.obj.service_desc;
						
						//图文详情
						var img_detail = ret.obj.commons['img_detail'];
						var strs = new Array();
						strs = img_detail.split(',');
						for(var i=0;i<strs.length;i++){
							document.getElementById('dom_goods_imgs').innerHTML += '<img style="width:100%;float:left" src="'+ goodsDetailImg + 'image/goods/common/' + strs[i] +'" alt="" />';
						}
						//说明书
						document.getElementById('dom_goods_desc').innerHTML += '<img style="width:100%;" src="'+ goodsDetailImg + 'image/goods/common/' + ret.obj.commons['goods_id'] + '/' + ret.obj.commons['img_desc'] +'" alt="" />';
					}else{
						alert('数据错误,请稍后重试!');
					}
				}
			});
		}
	</script>
</html>