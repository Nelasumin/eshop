<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateRadio(formId,raName,alt) {
	var val=$("form[id='"+formId+"'] input:radio[name='"+raName+"']").is(":checked");
	if(val==false){
    	alert("未选择收货地址！");
    	return false;
    }else{
        return true;
    }	
}
</script>
</head>
<body>
<%@include file="../header.jsp" %>

<div class="container-fluid">
	<div class="row">
	<form action="${pageContext.request.contextPath}/order/addOrder.action" id="addressForm" method="post" onsubmit="return validateRadio('addressForm','address','请选择收货地址');">
		<div class="col-md-10 col-md-offset-1" id="confirmaddrDetails">
		<c:if test="${sessionScope['_LOGIN_USER_']==null}">
		<h3>您未登录，请先登录！</h3>
	
		</c:if>
		<c:if test="${!empty addrs}">
		<h3>确认收货地址</h3>
		<table class="table table-condensed table-hover" id="conaddressTable">
			<tbody id="addressTableBody">				
				<c:forEach items="${addrs}" var="a" varStatus="vs">		
				<tr>
					<td class="radiocheck">
						<div class="radio">
						  <label>
						    <input type="radio" name="address" value="${fn:escapeXml(a.addrProvince)} ${fn:escapeXml(a.addrCity)} ${fn:escapeXml(a.addrArea)} ${fn:escapeXml(a.addrContent)} (${fn:escapeXml(a.addrReceiver)}收) ${fn:escapeXml(a.addrTel)}" ${a.addrIsdefault==1?'checked=checked':'' }>
						   
						  </label>
						</div>						
					</td>
					 <td>
					 	<span id="addrPro${vs.count}">${fn:escapeXml(a.addrProvince)}省 </span>
					 	<span id="addrCit${vs.count}">${fn:escapeXml(a.addrCity)}</span> 
					 	<span id="addrAre${vs.count}"> ${fn:escapeXml(a.addrArea)}</span>
					 </td>
					 <td>
					 	<span id="addrCon${vs.count}">${fn:escapeXml(a.addrContent)}</span></td>
					 <td><span id="addrRec${vs.count}">${fn:escapeXml(a.addrReceiver)}</span></td>
					 <td> 
					 	<span id="addrTe${vs.count}">${fn:escapeXml(a.addrTel)} </span>
					 </td>
					 <td class="isDefault">${a.addrIsdefault==1?'默认地址':'' }</td>
					 <td>
					 	<a href="#" onclick="handleAddressForm(${a.addrId},'${pageContext.request.contextPath}',${vs.count })">修改</a> | 
					 	<!--<a href="${pageContext.request.contextPath}/address/delAddress.action?addrId=${a.addrId}" onclick="return confirm('确定要删除这个收货地址吗？')">删除</a>	|   -->
					 	<a href="#" onclick="setDefault(${a.addrId},'${pageContext.request.contextPath}',event)">设为默认地址</a>				
					 </td>
				</tr>
				
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-primary" type="button" onclick="handleAddressForm()">添加收货地址</button>
		</c:if>
		<c:if test="${sessionScope['_LOGIN_USER_']!=null}">
		<c:if test="${empty addrs}">
			<h3>您目前没有收货地址，请先 <button class="btn btn-primary" type="button" onclick="handleAddressForm()">添加收货地址</button></h3>
			可以到个人中心<a href="${pageContext.request.contextPath}/address/getMyAddress.action">管理您的收货地址</a>
		</c:if>
</c:if>
		</div>
		<div class="col-md-10 col-md-offset-1">
			<h3>确认订单信息</h3>
			
			<table class="table table-hover table-condensed">
				<thead>
					<tr>
						<th>#</th><th>商品图片</th><th>商品名称</th><th>商品单价</th><th>数量</th><th>小计</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="totalAmount" value="0"/>
					<c:set var="postalfee" value="${goodslist[0].goodsPostalfee}"/>
					<c:forEach items="${goodslist}" var="g" varStatus="vs">

					<tr ${vs.count%2==0?'class=\"info\"':''}>
						<td>
							${vs.count}
						</td>
						<td>
							<img src="${pageContext.request.contextPath}${g.goodsPic}" width="30" height="30">
						</td>
						<td>
							${fn:escapeXml(g.goodsName)}&nbsp;&nbsp;
						</td>
						<td>
							原价<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${g.goodsPrice}&nbsp;&nbsp;
							现售<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${g.goodsDiscount}
						</td>
						<td>
							${g.goodsSales}
						</td>
						<td>
							<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
							${g.goodsSales*g.goodsDiscount}
						</td>
						<c:set var="totalAmount" value="${totalAmount+g.goodsSales*g.goodsDiscount}"/>
						<c:set var="postalfee" value="${postalfee>g.goodsPostalfee?g.goodsPostalfee:postalfee}"/>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="table table-condensed">
				<tr><td class="text-right">运费：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${postalfee}</td></tr>
				<tr><td class="text-right">合计（含运费）：<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>${totalAmount+postalfee}</td></tr>
			</table>
			<div ></div>
			<div class="col-md-12 text-right"><button id="submitOrder" class="btn btn-primary" type="submit" ${empty addrs?"disabled='disabled'":"" } >提交订单</button></div>				 
		</div>
		<input type="hidden" name="orderPostalfee" value="${postalfee}"/>
	</form>	
	</div>
</div>
<%@include file="../address/addressFormModal.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>