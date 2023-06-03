<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>随意购商城</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/default.css">

    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" > -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" >

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script	src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <!-- <script src="${pageContext.request.contextPath}/js/common.js"></script> -->

</head>
<body>
<script type="text/javascript">
    $(function(){

        var url=window.location.pathname;
        $("#"+url).addClass('active').siblings().removeClass('active');
        alert(url);
    });
    //function selectMenu(targeturl){
    //	alert(targeturl);
    //	 $("#"+targeturl).addClass('active').siblings().removeClass('active');
    //var nowurl=window.location.pathname;
    //if(targeturl=="index"){
    //	$("#index").addClass("active");
    //}else if(targeturl=="saleGoods"){
    //	$("#saleGoods").addClass("active");
    //}else if(targeturl=="newGoods"){
    //	$("#newGoods").addClass("active");
    //}

    //}
    	
	function delCart(index,baseurl){
		if(confirm('确定要删除这个商品吗？')){
			$.post(baseurl+"/goods/deleteCart.action",{index:index},function(result){
				if(result.success){
					$('#cartModal').modal('hide');
					$("#msgTitle").html("删除成功");
					$("#msgBody").html("已将购物车中该商品删除");
					$("#msgModal").modal();
				}
			},'json');
			$("#cartBadge").html(parseInt($("#cartBadge").html())-1);
		}
	}
	function clearCart(baseurl){
		$.post(baseurl+"/goods/clearCart.action",{},function(result){
			if(result.success){
				$('#cartModal').modal('hide');
				$("#msgTitle").html("清除成功");
				$("#msgBody").html("已清空购物车");
				$("#msgModal").modal();
			}
		},'json');
		$("#cartBadge").html(0);
	}
	function changeCart(index,baseurl){
		var newnum=$("#num"+index).val();
		$.post(baseurl+"/goods/changeCart.action",{goodsSales:newnum,index:index},function(result){
			if(result.success){
				$("#totalAmount").html(result.totalAmount);
				$("#totalprice"+index).html(result.totalPrice);
			}
		},'json');
		$("#cartBadge").html(0);
	
	}
    
</script>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 ">

            <%@include file="common/loginFormModal.jsp" %>
            <%@include file="common/regFormModal.jsp" %>
            <%@include file="common/cartModal.jsp" %>
             <%@include file="common/msgModal.jsp" %>
            
            <ol class="breadcrumb text-right" id="info">
                <c:if test="${sessionScope['_LOGIN_USER_']==null}">
                    <li id="li1"><span>游客您好，欢迎来到随意购商城！</span>
                        <a href="#loginFormModal" data-toggle="modal">[登录]</a>&nbsp;<a href="#regFormModal" data-toggle="modal">[新用户注册]</a></li>
                    <li><a href="#" onclick="alert('请先登录')">购物车 <span class="badge" id="cartBadge">${fn:length(sessionScope.goodslist)}</span></a></li>
                </c:if>
                <c:if test="${sessionScope['_LOGIN_USER_']!=null}">
                    <li id="li1"><span>${sessionScope['_LOGIN_USER_'].userName } 您好，欢迎来到随意购商城！</span>
                    <li><a href="#" onclick="showCart('${pageContext.request.contextPath}','${sessionScope.goodslist}')">购物车 <span class="badge" id="cartBadge">${fn:length(sessionScope.goodslist)}</span></a></li>
                   <li><a href='${pageContext.request.contextPath}/order/getMyOrders.action'>我的订单</a></li>
                   <li><a href='${pageContext.request.contextPath}/usercenter/index.action'>个人中心</a></li>
                    <li><a href="#" onclick="logout('${pageContext.request.contextPath}')">退出登录</a></li>
                </c:if>

            </ol>
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${pageContext.request.contextPath}/index.action"><span class="logo">随意购</span> 商城</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li <c:if test="${urlKey=='index'}">class="active"</c:if>>
                            <a href="${pageContext.request.contextPath}/index.action">首页</a>
                        </li>
                        <li <c:if test="${urlKey=='saleGoods'}">class="active"</c:if>>
                            <a href="${pageContext.request.contextPath}/goods/saleGoods.action">热销商品</a>
                        </li>
                        <li <c:if test="${urlKey=='newGoods'}">class="active"</c:if>>
                            <a href="${pageContext.request.contextPath}/goods/newGoods.action">新到商品</a>
                        </li>

                        <li <c:choose><c:when test="${urlKey=='cateGoods'}">class="dropdown active"</c:when><c:otherwise>class="dropdown"</c:otherwise> </c:choose>>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">商品分类<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <c:forEach items="${catelist}" var="c" varStatus="vs">
                                    <c:forEach items="${c.childlist}" var="cl" varStatus="i">
                                        <li><a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${cl.childid}">${cl.childname}</a></li>
                                    </c:forEach>
                                    <li class="divider"></li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    
                   <div class="navbar-form navbar-left" >
                        <form class="navbar-form navbar-left form-inline " role="search" method="post" action="${pageContext.request.contextPath}/goods/searchGoods.action">
                   
                        <div class="form-group">
                            <input type="text" class="form-control" name="keyword"/>
                        </div>
                        <button  class="btn btn-default" type=submit >店内搜索</button>
                    </form>
                    </div>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">排序<strong class="caret"></strong></a>
                             <ul class="dropdown-menu">
                             <c:if test="${param.keyword!=null}">
                             		<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods.action?keyword=${fn:escapeXml(param.keyword)}&sort=1">按价格从低到高</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods.action?keyword=${fn:escapeXml(param.keyword)}&sort=2">按价格从高到低</a>
									</li>								
									<li class="divider">
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods.action?keyword=${fn:escapeXml(param.keyword)}&sort=3">按销量从高到低</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/searchGoods.action?keyword=${fn:escapeXml(param.keyword)}&sort=4">按销量从低到高</a>
									</li>
							</c:if>
								
								 <c:if test="${param.keyword==null}">
								 	<li>
										<a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${param.childid==null?1:param.childid}&sort=1">按价格从低到高</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${param.childid==null?1:param.childid}&sort=2">按价格从高到低</a>
									</li>								
									<li class="divider">
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${param.childid==null?1:param.childid}&sort=3">按销量从高到低</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/goods/goodsCate.action?childid=${param.childid==null?1:param.childid}&sort=4">按销量从低到高</a>
									</li>
								
								</c:if>
                            </ul>
                        </li>
                    </ul>
                </div>

            </nav>
    






