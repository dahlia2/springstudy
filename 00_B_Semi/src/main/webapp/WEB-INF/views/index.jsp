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
<title>Index</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
<script>
	$(function(){
		$('.btn_yes').on('click', function(){
			location.href='${contextPath}/main.do';
		})
	})
</script>
</head>
<body>


	<div class="intro_page">
		<div class="intro_area">
			<div class="box_area">
				<div class="inner_box">
					<div class="logo"><img src="https://www.winenara.com/asset/images/shop/default/intro_logo.png" width="200px"></div>
					<div class="box_text"><p>만 19세 이상 음주 가능한 연령입니까?</p></div>
					<div class="btn">
						<div class="btn_yes"><a href="${contextPath}/main.do">예</a></div>
						<div class="btn_no"><a href="${contextPath}/main.do">아니요</a></div>
					</div>
					<div class="box_text2"><img src="https://www.winenara.com/asset/images/shop/default/ico_nineteen.png" width="20px"><p>&nbsp;&nbsp;&nbsp;이 사이트는 만 19세 이상만 입장 가능합니다.</p></div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>