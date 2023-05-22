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
<script>
  $(function(){
    $('.btn_yes').on('click', function(){
      location.href='${contextPath}/admin/main.page';
    })
  })
</script>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

a {
  text-decoration: none;
}

p {
  font-family: 'NotoSansCJKkr', sans-serif;
    letter-spacing: -0.05em;
}

.intro_page {
    display: table;
    padding: 0 20px;
    width: 100%;
    height: 100vh;
  background-image: url('https://www.winenara.com/asset/images/shop/main/mb_intro_bg.jpg');
    background-size: 100% 100%;
}

.intro_page .intro_area {
    display: table-cell;
    vertical-align: middle;
}

.intro_page .intro_area .box_area .inner_box {
    padding: 20px;
    box-sizing: border-box;
    background: rgba(0, 0, 0, 0.8);
    border: 1px solid #AC8B68;
    width: 600px;
    height: 400px;
    margin-left: 400px;
}

.logo {
  margin-left: 180px;
  margin-top: 20px;
}

.box_text {
  margin-top: 25px;
  margin-left: 85px;
  font-size: 23px;
  font-weight: 600;
  color: white;
    font-family: 'NotoSansCJKkr', sans-serif;
}


.btn {
  margin-top: 30px;
  margin-left: 75px;
  display: flex;
  text-align: center;
}

.btn_yes {
  background-color: #AC8B68;
  border-radius: 4px;
    width: 180px;
    height: 50px;
    margin-right: 50px;
    line-height: 50px; 
}

.btn_yes a {
  color: white;
  font-size: 20px;
}

.btn_no {
  background-color: white;
  border-radius: 7px;
    width: 180px;
    height: 50px;
    line-height: 50px; 
}

.btn_no a {
  color: #AC8B68;
  font-size: 20px;
}

.box_text2 {
  display: flex;
  margin-top: 25px;
  margin-left: 100px;
  font-size: 16px;
  font-weight: 400;
  color: white;
    font-family: 'NotoSansCJKkr', sans-serif;
}
</style>
</head>
<body>


  <div class="intro_page">
    <div class="intro_area">
      <div class="box_area">
        <div class="inner_box">
          <div class="logo"><img src="https://www.winenara.com/asset/images/shop/default/intro_logo.png" width="200px"></div>
          <div class="box_text"><p>만 19세 이상 음주 가능한 연령입니까?</p></div>
          <div class="btn">
            <div class="btn_yes"><a href="${contextPath}/admin/main.page">예</a></div>
            <div class="btn_no"><a href="${contextPath}/admin/main.page">아니요</a></div>
          </div>
          <div class="box_text2"><img src="https://www.winenara.com/asset/images/shop/default/ico_nineteen.png" width="20px"><p>&nbsp;&nbsp;&nbsp;이 사이트는 만 19세 이상만 입장 가능합니다.</p></div>
        </div>
      </div>
    </div>
  </div>

  
</body>
</html>