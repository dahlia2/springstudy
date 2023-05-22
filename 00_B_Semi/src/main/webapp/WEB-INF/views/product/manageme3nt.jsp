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
<script>

$(function(){
	
	$('.wine_img').on('click', function(){
		location.href = '${contextPath}/detail.do?prodNo=' + $(this).prev().text();	
		});

	$('#checkAll').on('change', function() {
		if ($(this).prop('checked')) {
			$('.checkOne').prop('checked', true)
			} else {
				$('.checkOne').prop('checked', false);
				}
		});
	
	function fnDelete() {
		  var prodNos = [];
		  $('.checkOne:checked').each(function() {
		    prodNos.push($('.wine_prodNo').text());
		  });
		  if (prodNos.length > 0) {
		    location.href='${contextPath}/delete.do?prodNo=' + prodNos.join(',');
		  }
		}
  });

</script>

<style>
.content {
margin-left: 50px;
}

#title {
	font-size: 20px;
	background-color: pink;
}

#service {
	height: 20px;
	width: 20px;
	margin-left: 10px;
}

#delete {
	height: 40px;
	width: 80px;
	font-size: 15px;
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
	
	<div class="search_area" style="margin-left: 30px;">
		<form id="frm_search" action="${contextPath}/search.do">
			<input type="text" name="query" id="query" size="35" placeholder="오늘 마시고 싶은 와인을 검색해보세요.">
			<button>검색</button>
		</form>
	</div>
	<br><br>
	
	<div class="content">
		<h1>상품 목록</h1><br>
		<hr><br>
		<div>
			<input type="checkbox" id="checkAll">
			<label for="checkAll">모두 선택</label>
			<br><br>
			<input type="button" value="삭제하기" onclick="fnDelete()" height="20px" id="delete">
		</div>
		<br>
		<table border="1">
			<thead>
				<tr id="title">
					<td width="80">상품선택</td>
					<td width="70">상품번호</td>
					<td>상품이미지</td>
					<td>상품명(KR)</td>
					<td>상품명(ENG)</td>
					<td>가격</td>
					<td>재고</td>
					<td>판매수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${wineList}" var="wine">
					<tr class="wine_List">
						<td><input type="checkbox" id="service" class="checkOne">
						<td class="wine_prodNo">${wine.prodNo}</td>
						<td class="wine_img"><img src="${wine.prodImgWine}" width="100px"></td>
						<td>${wine.prodName}</td>
						<td>${wine.prodNameEng}</td>
						<td>${wine.prodPrice}</td>
						<td>${wine.prodStock}</td>
						<td>${wine.prodSellCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

		
		
	
</body>
</html>