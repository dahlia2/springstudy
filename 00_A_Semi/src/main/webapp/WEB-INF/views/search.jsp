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
<link rel="stylesheet" href="${contextPath}/resources/css/search.css">
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
	
	<div class="search_area" style="margin-left: 30px;">
		<form id="frm_search" action="${contextPath}/search.do">
			<input type="text" name="query" id="query" size="35" placeholder="오늘 마시고 싶은 와인을 검색해보세요.">
			<button>검색</button>
		</form>
	</div>
	
	
	<section id="contents" style="margin-top: 50px; margin-left: 30px; margin-right: 30px;">
		<div class="search_wrap">
			<div class="search_txt">
				<p id="keyword">" ${query} "</p>
				<div id="keyword_next">&nbsp;&nbsp;으로 검색하신 결과입니다.</div>
			</div>
		</div>
		
		<br><hr><br>
		
		
		<div class="product_list">
			<ul>
				<c:forEach items="${product}" var="sp">
				<li>
					<div class="item">
						<div class="main_img" style="background:#F6EC9C">
							<a href="${contextPath}/detail.do?prodNo=${sp.prodNo}"><img src="${sp.prodImgWine}" width="250px"></a>
						</div>
						<div class="info">
							<p id="pr_name">${sp.prodName}</p>
							<p id="pr_name_eng">${sp.prodNameEng}</p>
							<p id="pr_price">${sp.prodPrice}</p>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>
		
		</div>
	
	
	</section>

		
		
	
</body>
</html>