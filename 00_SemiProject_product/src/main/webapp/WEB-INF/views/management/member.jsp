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


	<div>
		<a href="${contextPath}/">메인</a>
	</div>
	
	<div>
		<h1>상품 목록</h1>
		<div>
			<span>정렬 개수</span>
			<select id="recordPerPage">
				<option value="10">10개</option>
				<option value="20">20개</option>
				<option value="30">30개</option>
			</select>
		</div>
		<div>
			<span>검색 날짜</span>
		</div>
		<hr>
		<table border="1">
			<thead>
				<tr id="tb_column">
					<td>순번</td>
					<td><span class="title" data-column="P.PROD_NO" data-order="${order}">와인번호</span></td>
					<td><span class="title" data-column="P.PROD_IMG_WINE" data-order="${order}">와인이미지</span></td>
					<td><span class="title" data-column="P.PROD_NAME" data-order="${order}">와인명(KOR)</span></td>
					<td><span class="title" data-column="P.PROD_NAME_ENG" data-order="${order}">와인명(ENG)</span></td>
					<td><span class="title" data-column="P.PROD_PRICE" data-order="${order}">가격</span></td>
					<td><span class="title" data-column="P.PROD_TYPE" data-order="${order}">타입</span></td>
					<td><span class="title" data-column="P.PROD_NATION" data-order="${order}">국가</span></td>
					<td><span class="title" data-column="P.PROD_BODY" data-order="${order}">바디</span></td>
					<td><span class="title" data-column="P.PROD_ALCOL" data-order="${order}">알코올</span></td>
					<td><span class="title" data-column="P.PROD_DATE" data-order="${order}">출시일자</span></td>
					<td><span class="title" data-column="OD.PROD_STOCK" data-order="${order}">재고량</span></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${wineList}" var="wine" varStatus="vs">
					<tr>
						<td class="wine_row">${beginNo - vs.index}</td>
						<td class="wine_row">${wine.prodNo}</td>
						<td class="wine_row">${wine.prodImgWine}</td>
						<td class="wine_row">${wine.prodName}</td>
						<td class="wine_row">${wine.prodNameEng}</td>
						<td class="wine_row">${wine.prodPrice}</td>
						<td class="wine_row">${wine.prodType}</td>
						<td class="wine_row">${wine.prodNation}</td>
						<td class="wine_row">${wine.prodBody}</td>
						<td class="wine_row">${wine.prodAlcol}</td>
						<td class="wine_row">${wine.prodDate}</td>
						<td class="wine_row">${wine.orderDTO.prodStock}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="12">
						${pagination}
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
</body>
</html>
 