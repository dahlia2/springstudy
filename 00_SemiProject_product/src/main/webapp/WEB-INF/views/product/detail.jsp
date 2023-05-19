<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/detail.css">
</head>
<style>
* {
	margin: 0;
	padding: 0;
    box-sizing: border-box;
    font-family: 'NotoSansCJKkr', sans-serif;
}

.logo {
	display: flex;
	justify-content: center;
}

h3 {
	font-size: 30px;
 }
 
 .nav {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    text-align: center;
}
    
 ul {
 	margin: 0 auto;  
	list-style: none;
	display: flex;
 }
 
 .gnb > li {
 	margin: 0 auto;  
	width: 200px;
	padding: 30px;
	text-align: middle;
}
	
.gnb > li:hover {
	background-color: green;
}

.con_top {
	margin-top: 50px;
	margin-left: 45px;
	display: flex;
}

.con_bottom {
	margin-top: 30px;
	margin-left: 200px;
}

.ct_right p {
	margin-bottom: 5px;

}

#title {
	font-size: 30px;
	font-weight: 800;
}

#content {
	font-size: 18px;
	font-weight: 400;
}

#price {
	font-size: 23px;
	font-weight: 900;
	font-style: italic;
}

#brown {
	font-size: 15px;
	font-weight: 900;
	color: #AC8B68;
}
</style>
<body>


	<!-- 화면 상단 -->
	<header id="header" class="header">
		
		<div class="top">
			<h1 class="logo">
				<a href="${contextPath}/main.do">
					<img src="https://www.winenara.com/asset/images/shop/default/pc_logo.png">
				</a>
			</h1>
			
		</div>
			<div class="nav">
				<ul class="gnb">
					<li><a>Wine</a></li>
					<li><a>New & Best</a></li>
					<li><a>Board</a></li>
					<li><a>Introduce us</a></li>
					<li><a>My Page</a></li>
				</ul>
			</div>
			
	</header>


	<div class="content_wrap">
		<div class="con_top">
			<div class="ct_left"><img src="${p.prodImgWine}" width="450px"></div>	
				<div class="ct_right">
					<p id="title">${p.prodName}</p>
					<p id="content">${p.prodContent}</p>
					<p id="price">${p.prodPrice}</p>
					<p id="brown">※ 이 상품은 행사상품으로 쿠폰사용이 제한됩니다</p>
				<div class="botton_type_two">
					<input type="button" value="장바구니">
					<input type="button" value="구매하기">
				</div>
			</div>
		</div>
		
		<div class="con_bottom">
			<div><img src="${p.prodImgContent}" width="750px"></div>
		</div>
	</div>
		
		
	
</body>
</html>