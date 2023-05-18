<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<title>Insert title here</title>
<script>
 $('#btn_search').on(click, function(){
	 
	 $.ajax({
		type: 'get',
		url: '${contextPath}/nave.do',
		data: 'search_count=' + $('search_count').val() + '&search_text=' + $('search_text').val(),
		dataType: 'json',
		success: function(resData){
			$('#search_list').append(resData)
			
		}
	 
	 
	 })
	 
	 
	 
	})
 
 

</script>
</head>
<body>


	<h1>주말에 풀어보기</h1>
	
		<div class="search_area">
			<div>
				<label for="count">검색결과건수</label>
				<select id="count">
					<% for(int i = 1; i <= 10; i++) { %>
					<option value="<%=i%>"><%=i%></option>
					<% } %>
					
					<select id="count">
						<c:forEach var="n" begin="1" end="10" step="1">
							<option value="${n}">${n}</option>
						</c:forEach>
					</select>
					
				</select>
			</div>
			<div>
				<input type="radio" value="same">유사도순
				<input type="radio" value="date">날짜순
				<input type="radio" value="row">낮은가격순
				<input type="radio" value="high">높은가격순
			</div>
			<div>
				<label for="text">검색어 입력</label>
				<input id="text" value="search_text"> 
				<input type="button" id="btn_search" value="검색">
			</div>
		</div>
			
			<hr>
			
			<div id="search_result">
				<table border="1">
					<thead>
						<tr>
							<td>상품명</td>
							<td>썸네일</td>
							<td>최저가</td>
							<td>판매처</td>
						</tr>
					</thead>
					<tbody id="search_list"></tbody>
				</table>
			</div>


</body>
</html>