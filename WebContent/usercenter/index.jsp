<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			<%@include file="userCenterLeftNav.jsp" %>
		</div>
		<div class="col-md-10">
		    <c:if test="${msg==null }">
			欢迎来到个人中心，您可以修改个人信息、密码和管理收货地址!<br>
			</c:if>
			<c:if test="${msg!=null }">
			<p style="color:red" id="uinfo">${msg }</p>
			</c:if>
		</div>
	</div>
</div>
<%@include file="../common/cartModal.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>