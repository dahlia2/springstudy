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
<title>Main</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
<script>
	$(function(){
		$('#btn_management').on('click', function(){
			location.href='${contextPath}/management.do';
		})
	})
</script>
<style>
#btn_management {
	background: yellow;
	width: 200px;
	margin-left: 30px;
}

#btn_management span {
	font-size: 16px;
	font-weight: 400;
}

</style>

</head>
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
	
	
	<div class="search_area">
		<form id="frm_search" action="${contextPath}/search.do">
			<input type="text" name="query" id="query" size="35" placeholder="오늘 마시고 싶은 와인을 검색해보세요.">
			<button>검색</button>
		</form>
	</div>
	
	<br>
	<button id="btn_management"><span>[관리자 화면]</span>&nbsp;상품관리</button>

	<div class="product_wrap">
	
		<!-- 최근 등록순 -->
		<div class="newArrivalList">
			<h3>New Arrivals</h3>
			<ul>
				<c:forEach items="${newProducts}" var="np">
				<li>
					<div class="item">
						<div class="main_img" style="background:#F6EC9C">
							<a href="${contextPath}/detail.do?prodNo=${np.prodNo}"><img src="${np.prodImgWine}" width="300px"></a>
						</div>
						<div class="info">
							<span>${np.prodName}</span>
							<span>${np.prodNameEng}</span>
							<span>${np.prodPrice}</span>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 판매량순 -->
		<div class="bestSellerList">
			<h3>Best Seller</h3>
			<ul>
				<c:forEach items="${bestProducts}" var="bp">
				<li>
					<div class="item">
						<div class="main_img" style="background:#E0EBF8">
							<a href="${contextPath}/detail.do?prodNo=${bp.prodNo}"><img src="${bp.prodImgWine}" width="300px"></a>
						</div>
						<div class="info">
							<span>${bp.prodName}</span>
							<span>${bp.prodNameEng}</span>
							<span>${bp.prodPrice}</span>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		
	</div>
	
	
	<!-- loading.gif 보여주는 곳 -->
	<div class="loading_wrap">
	
	</div>
	
</body>
</html>