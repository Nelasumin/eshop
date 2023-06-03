<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include  file="../header.jsp"%>	
<%@include file="userorderLeftNav.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
		<div class="col-md-4">
		</div>
				<div class="col-md-8">
					<div class="cart py-container">
			
			<!--主内容-->
			<div style="width:100%; height:550px; ">
				<div style="margin:10px 0 160px 60px">
					<img src="../images/goods/pay.png" width="248" height="248" ">　
					<h3>恭喜您，提交订单成功！</h3>
					<p style="margin:40px 10px 0 0">● 支付方式：货到付款</p>
					<p style="margin:40px 10px 0 0">● 支付金额：￥86.00元</p>
					<p><a href="${pageContext.request.contextPath}/order/payOrder.action?orderId=${param.orderId}">支付成功</a></p>
				</div>
			</div>
		</div>		
				</div>
			</div>
		</div>
	</div>
</div>
<%@include  file="../footer.jsp"%>	
</body>
</html>