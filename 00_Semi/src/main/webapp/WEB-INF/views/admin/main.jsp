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
</head>
<body>

	<div>
		<a href="${contextPath}/admin/product.form">상품 관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/member.form">회원 관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/board.form">게시판 관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/order.form">주문 관리</a>
	</div>
	
</body>
</html>
 