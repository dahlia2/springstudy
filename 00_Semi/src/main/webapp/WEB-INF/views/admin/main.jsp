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
</head>
<body>

	<div>
		<a href="${contextPath}/admin/prodList.page">상품관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/userList.page">회원관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/orderList.page">주문관리</a>
	</div>
	<div>
		<a href="${contextPath}/admin/noticeList.page">게시판관리</a>
	</div>
	
</body>
</html>
 