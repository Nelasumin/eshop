
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Detail</title>
<script>
function handleOrder(orderId,status,msg,e){
	if(confirm(msg)){
		var os=$("#orderStatus");
		
		$.post(getContextPath()+"/order/handleOrderStatus",{orderId:orderId,status:status},function(result){
			if(checkLogin(result)){
				if(result.handle=="success"){
					if(status==1){
						os.html("订单提交，等待付款");
					}
					else if(status==2){
						os.html("交易成功");
					}
					$(e.target).attr("disabled","disabled");
					$(e.target).siblings("[id!=back]").attr("disabled","disabled");
					$("#msgTitle").html("操作成功");
					$("#msgBody").html("订单操作成功");
					$("#msgModal").modal();	
				}else if(result.handle=="failure"){
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("抱歉，目前的订单状态无法进行此操作");
					$("#msgModal").modal();
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("操作订单失败");
					$("#msgModal").modal();
				}
			}
		});
	}
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container-fluid">
	<div class="row">
	<c:if test="${!empty orderDetail}">
		<div class="col-md-10 col-md-offset-1">
		<h3>订单信息</h3>
		<table class="table table-condensed table-hover">
			<tbody>
				<tr>
					<td>订单编号：${fn:escapeXml(orderDetail.orderCode)}</td>
					<td>创建时间：<fmt:formatDate value="${orderDetail.orderDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<td>
						订单状态：<span id="orderStatus">
							   
							 <c:if test="${orderDetail.orderStatus==1}">
								等待付款						
							</c:if>
							<c:if test="${orderDetail.orderStatus==3}">
								订单取消，交易关闭							
							</c:if>
							<c:if test="${orderDetail.orderStatus==2}">
								交易成功
							</c:if>
							  </span>
					</td>
					<td>送货地址：${fn:escapeXml(orderDetail.orderAddress)}</td>
				</tr>
			</tbody>
			</table>
		
		</div>
		<div class="col-md-10 col-md-offset-1">
			<div class="panel panel-info">
			<div class="panel-heading">商品列表</div>
			<div class="panel-body">	
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalAmount" value="0"/>
					<c:set var="postalfee" value="${paramValues.goodsPostalfee[0]}"/>
					<c:forEach items="${orderDetail.odetails}" var="o" varStatus="vs">

					<tr ${vs.count%2==0?'class=\"info\"':''}>
						<td>
							${vs.count}
						</td>
						<td>
							<img src="${pageContext.request.contextPath}${fn:escapeXml(o.odetailPic)}" width="30" height="30">
						</td>
						<td>
							${fn:escapeXml(o.odetailName)}&nbsp;&nbsp;
							${fn:escapeXml(o.odetailSize)}&nbsp;&nbsp;${fn:escapeXml(o.odetailColor)}
						</td>
						<td>
							单价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${o.odetailPrice}
						</td>
						<td>
							${o.odetailNum}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
							${o.odetailNum*o.odetailPrice}
						</td>
						<c:set var="totalAmount" value="${totalAmount+o.odetailNum*o.odetailPrice}"/>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div></div>
			<table class="table table-condensed">
				<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${orderDetail.orderPostalfee}</td></tr>
				<tr><td class="text-right">订单总金额（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+orderDetail.orderPostalfee}</td></tr>
			</table>
			<div class="col-md-12 text-right">
			<c:if test="${orderDetail.orderStatus==1}">
				<button class="btn btn-primary" type="button" onclick="handleOrder(${orderDetail.orderId},9,'确定要取消这个订单吗？',event);">取消订单</button>
				<button class="btn btn-primary" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/order/toPay?orderId=${orderDetail.orderId}'">去付款</button>
			</c:if>
			<button class="btn btn-primary" id="back" type="button" onclick="javascript:location.href=''">返回订单列表</button>
			</div>			 
		</div>
	</c:if>
	</div>
</div>
<%@include file="../footer.jsp" %>
</body>
</html>