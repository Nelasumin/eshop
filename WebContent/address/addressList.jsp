<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="addressFormModal.jsp" %>
<%@include file="../header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
				<%@include file="../usercenter/userCenterLeftNav.jsp" %>
		</div>
		<div class="col-md-10" id="addrDetails">
			<div><button class="btn btn-primary" type="submit" onclick="handleAddressForm()">添加收货地址</button></div>		
			<c:if test="${!empty addrs }">
			<table class="table table-condensed table-hover" id="addressTable" name="addressTable">
			<thead>
					<tr>
						<th>#</th><th>省-市-区</th><th>街道</th><th>收件人</th><th>电话</th><th>默认地址</th><th>操作</th>
					</tr>
			</thead>
			<tbody>
				<c:forEach items="${addrs}" var="a" varStatus="vs">
				<tr>
					 <td>${vs.count }</td>
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
					 	<a href="${pageContext.request.contextPath}/address/delAddress.action?addrId=${a.addrId}" onclick="return confirm('确定要删除这个收货地址吗？')">删除</a>	| 
					 	<a href="#" onclick="setDefault(${a.addrId},'${pageContext.request.contextPath}',event)">设为默认地址</a>				
					 </td>
				</tr>
				</c:forEach>
				
			</tbody>
			</table>
			</c:if>		
			<c:if test="${empty addrs}">
			<h3>您目前没有收货地址，您可以到个人中心<a href="${pageContext.request.contextPath}/address/getMyAddress.action">管理您的收货地址</a></h3>
		</c:if> 
		</div>
	</div>
</div>


<%@include file="../footer.jsp" %>
</body>
</html>