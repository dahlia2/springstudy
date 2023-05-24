<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param name="title" value="블로그" />
</jsp:include>

    <div>
     </div>
  <h1>블로그 목록</h1>
  <c:if test="${sessionScope != null}" var=""></c:if>
    <c:if type="button" value="블로그 작성하기" onclick="fnWrite()">
    </c:if>
     <div>
      
</div>

<!-- 스크립트를 마지막에 두면 load 이벤트를 사용할 필요가 없음 -->
<script>
function fnWrite(){
	 location.href='${contextPath}/blog/write.form';
}
</script>

</body>
</html>