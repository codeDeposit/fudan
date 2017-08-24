<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@ include file="../../common/styleUrl.jsp" %>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="renderer" content="webkit">
		<%@ include file="../../common/css.jsp" %>
		<%@ include file="../../common/js.jsp" %>
		<link href="${jypath}/app/css/plugins/iCheck/custom.css" rel="stylesheet">
		<script src="${jypath}/app/js/plugins/iCheck/icheck.min.js"></script>
	</head>
	<%@ include file="../../common/toast.jsp"%>
	<body>
		<div class="row wrapper border-bottom white-bg page-heading">
			<div class="col-lg-10">
				<h2>订单详情</h2>
					<ol class="breadcrumb" style="margin-left:0px !important;margin-top:0px;">
						<li>
							<a href="index.html">主页</a>
						</li>
						<li>
							<a>订单管理</a>
						</li>
						<li>
							<strong>订单详情</strong>
						</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="row border-bottom white-bg dashboard-header">
			<div class="col-lg-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
                        <h5><i class="fa fa-file-text-o"></i>&nbsp;订单信息</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="well">
                        	<h3>
                          		收货人
                        	</h3>
                           	<span>${list.buyer_name }</span>
                         	<h3>
                          		手机
                        	</h3>
                           	<span>${list.buyer_name }</span>
                           	<h3>
                          		电话
                        	</h3>
                           	<span>${list.buyer_name }</span>
                           	<h3>
                          		地址
                        	</h3>
                           	<span>${list.buyer_name }</span>
                        </div>
					</div>
					<div class="ibox-title">
                        <h5><i class="fa fa-paper-plane"></i>&nbsp;订单状态</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="well" style="overflow: hidden;">
                        	<h3>
                          		状态
                        	</h3>
                        	<c:if test="${list.order_state == 50}">
                        		<div style="width:100%;">
                        			<div style="width:100%;height:32px;margin:0 auto;text-align:center;border-bottom:4px solid #ebeced">
	                           			<span style="width:25%;float:left;">
	                           				已取消
	                          			</span>
									</div>
									<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
										<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
											<i class="fa fa-times" style="font-size:30px;color:#ff6364;margin-top: 15px;"></i>
										</div>
									</div>
                        		</div>
                        	</c:if>
                        	<c:if test="${list.order_state != 50}">
	                           	<div style="width:100%;">
	                           		<div style="width:100%;height:32px;margin:0 auto;text-align:center;border-bottom:4px solid #ebeced">
	                           			<span style="width:25%;float:left;">
	                           				提交订单
	                          			</span>
	                           			<span style="width:25%;float:left;">
	                           				支付订单
	                        			</span>
	                           			<span style="width:25%;float:left;">
	                          				商家发货
	                        			</span>
	                           			<span style="width:25%;float:left;">
	                           				确认收货
	                          			</span>
									</div>
									<c:if test="${list.order_state == 10}">
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
									</c:if>
									<c:if test="${list.order_state == 20}">
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
									</c:if>
									<c:if test="${list.order_state == 30}">
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
									</c:if>
									<c:if test="${list.order_state == 40}">
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
										<div style="width:25%;text-align:center;float:left;margin-top:20px;height: 80px;">
											<div style="width:60px;height:60px;background:#ebeced;margin:0 auto;border-radius:100%;">
												<i class="fa fa-check-square-o" style="font-size:30px;color:#1ab394;margin-top: 15px;"></i>
											</div>
										</div>
									</c:if>
                           		</div>	
                           	</c:if>
                        </div>
					</div>
					<div class="ibox-title">
                        <h5><i class="fa fa-cny"></i>&nbsp;订单金额</h5>
                        <span style="float:right">${list.order_amount }￥</span>
                    </div>
                    <div class="ibox-content">
                        <div class="col-lg-12" style="text-align:right;">
                        	<a href="../appAdminOrder/listPage?order_state=0">
	                        	<button type="button" class="btn btn-primary">
									返回
								</button>
							</a>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		$(document).ready(function(){
			parent.scrollTo(0,0);
		});
	</script>
</html>