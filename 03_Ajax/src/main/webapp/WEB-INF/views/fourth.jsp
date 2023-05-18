<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
</head>
<script>

	$(function(){
		
		// C:\GDJ61\images 디렉터리에 저장된 flower1~4.jpg 화면에 표시하기
		// 경로(path)와 파일명(filename)을 전달하면 해당 이미지를 화면에 출력하는 연습
		
		// Java에서 이미지를 byte 배열로 저장해서 jsp로 보내면 이미지가 나타난다
		
		for(let n = 1; n <= 5; n++) {
			let path = encodeURIComponent('C:\\GDJ61\\images'); /* 자바로 보내기 위해서 역슬래시 두개 사용한 것  */
			let filename = 'flower' + n + '.jpg';
			let str = '<div>';
			str += '<img src="${contextPath}/image/display?path=' + path + '&filename=' + filename + '" width="300px">';
					  // '${contextPath}/image/display? => mapping 이름
			$('#result').append(str); // 반복문이니까 뒤에 추가하는 append 사용 
		}
		
	})

</script>
<body>

	<div id="result"></div>
	
</body>
</html>