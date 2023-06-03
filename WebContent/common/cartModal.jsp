<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function showCart(baseurl,goodslist){
		//alert(goodslist);
		$("#cartModal").modal('show');
		$("#cartTitle").html("我的购物车");
		if(goodslist==null){
			$("#cart_msg").hide();
			$("#cartBody").html("<h3>目前购物车为空，快去购物吧</h3>");
		}else{
			$("#cart_tab").show();
		}
	}
	function closeMsg(){
		window.location.reload();
	}
</script>

<div class="modal fade" id="cartModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel" >
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
					×
				</button>
				<h4 class="modal-title" id="cartTitle">
					我的购物车
				</h4>
			</div>
			<form class="form-inline" role="form" action="${pageContext.request.contextPath}/goods/buyGoods.action" method="post">
				<div class="modal-body" id="cartBody">
					<div id="cart_msg" style="display:none"></div>
					<c:if test="${sessionScope.goodslist!=null}">
						<table class="table table-striped" id="cart_tab">
							<thead>
							<tr>
								<th>#</th>
								<th>商品图片</th>
								<th>商品名称</th>
								<th>商品单价</th>
								<th>数量</th>
								<th>小计</th>
								<th>操作</th>
							</tr>
							</thead>
							<tbody id="cart_tbody">
							<c:set var="totalAmount" value="0"></c:set>
							<c:forEach items="${sessionScope.goodslist}" var="s" varStatus="vs">
							
								<tr>
								 <c:set var="num" value="${vs.index+1}"></c:set>
								 <c:set var="totalprice" value="${s.goodsDiscount*s.goodsSales }"></c:set>
								 <c:set var="totalAmount" value="${totalAmount+totalprice }"></c:set>
									<td>${vs.index+1}</td>
									<td><img src="/eshop/${s.goodsPic}" width=50px height=50px></td>
									<td>${s.goodsName}</td>
									<td>${s.goodsDiscount}</td>
									<td><input type="number" id="num${vs.index}" name="num${vs.index}" value="${s.goodsSales}" size="5" onblur="changeCart(${vs.index},'${pageContext.request.contextPath}')" /></td>
									<td><span id="totalprice${vs.index}" >${totalprice}</span></td>
									<td>
									<a href="#" onclick="delCart(${vs.index},'${pageContext.request.contextPath}')">删除</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<a href='#' onclick="clearCart('${pageContext.request.contextPath}')">清空购物车</a>
						<div class='text-right'>已选${num}件商品&nbsp;&nbsp;合计（不含运费）
						<span class='glyphicon glyphicon-yen' aria-hidden='true' id="totalAmount">${totalAmount }</span></div>
					</c:if>

				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="submit" id="ok">确认下单</button>
					<button class="btn btn-default" type="button" data-dismiss="modal" onclick="closeMsg()">关闭窗口</button>
				</div>
			</form>
		</div>

	</div>
</div>

 
