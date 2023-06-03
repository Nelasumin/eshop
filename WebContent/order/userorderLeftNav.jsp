<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="list-group" >
   	<ul class="nav nav-pills nav-stacked"  id="left_order">
   		<li ${param.status==null?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders.action">全部订单</a></li>
		<li ${param.status==0?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders.action?status=1">待付款订单</a></li>
		<li ${param.status==5?"class='active'":"" }><a href="${pageContext.request.contextPath}/order/getMyOrders.action?status=2">交易成功订单</a></li>
   	</ul>				
</div>