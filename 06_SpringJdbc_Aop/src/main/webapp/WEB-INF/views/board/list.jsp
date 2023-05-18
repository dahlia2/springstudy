<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>   <!-- 동적파일에서 contextPath은 webapp을 의미한다. -->
<script src="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="${contextPath}/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<title>Insert title here</title>
<style>
	/* 테이블 행에 마우스를 가져다대면 베이지배경, 손가락포인터로 변경되는 css */
	tbody tr:hover { 
	background-color: beidge;
	cursor: pointer;
	}
</style>
<script>
	function fnDetail(n) {  // 게시판 번호로 상세 조회
		location.href = '${contextPath}/board/detail.do?board_no=' + n;
	}
</script>
</head>
<body>

	<div>
		<a href="${contextPath}/board/write.do">새글작성하기</a>
	</div>
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일자</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boardList}">
					<tr>
						<td colspan="3">첫 게시물의 주인공이 되어보세요!</td>
					</tr>
				</c:if>
				<c:if test="${not empty boardList}">  <!--  ↓↓ 게시판이 있을 때 보이는 화면 ↓↓  -->
					<c:forEach items="${boardList}" var="b">    
						<tr onclick="fnDetail(${b.board_no})">  <!-- 게시판을 클릭하면 게시판 번호를 전달하여 detail.do로 이동하는 함수 -->
							<td>${b.title}<td>
							<td>${b.writer}<td>
							<td>${b.created_at}<td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	
</body>
</html>