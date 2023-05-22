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
<title>Product List</title>
<script src="${contextPath}/resources/js/lib/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
$(function() {
  
    $("#datepicker1, #datepicker2").datepicker({
      
           dateFormat: 'yy-mm-dd'   // 달력 날짜 형태
           ,showOtherMonths: true   // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true   // option값 '년' 선택 가능
           ,changeMonth: true  // option값 '월' 선택 가능                
           ,showOn: "both"     // button: 버튼을 표시하고, 버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고, 버튼을 누르거나 input을 클릭하면 달력 표시
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"  // 버튼 이미지 경로
           ,buttonImageOnly: true  // 버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택"     // 버튼 호버 텍스트              
           ,yearSuffix: "년"       // 달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']  // 달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']       // 달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토']                           // 달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']  // 달력의 요일 Tooltip
           ,minDate: "-5Y"    // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5Y"    // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
    // 초기값을 오늘 날짜로 설정
    $("#datepicker1, #datepicker2").datepicker('setDate', 'today');  // (-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
});
</script>
<script>
$(function(){
    $('.elwine').on('click', function(){
      location.href='${contextPath}/admin/detailWine.page?prodNo=' + $(this).siblings('#wineNo').text();
    });
  })

$(function(){
  $('#text').hide();
  $('.elwine').on('mouseover', function(){
    $('#text').show();
  })
})
  
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css');

* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
}

.logo {
   display: flex;
   justify-content: center;
}

.main {
   margin: 0 auto;
   display: flex;
}

.gnb {
   display: flex;
   flex-direction: row;
   justify-content: space-between;
   text-align: center;
 }
 
.gnb ul {
   margin: 0 auto;  
   list-style: none;
   display: flex;
}

.gnb li {
   margin: 0 auto;  
   width: 170px;
   padding: 30px;
   text-align: middle;
 }

li:hover {
   background-color: purple;
}

.main_left {
   margin-right: 20px;
   margin: 15px;

}
.main_left ul {
   margin: 0 auto;  
   list-style: none;
   text-align: center;
}

.main_left li {
   margin: 0 auto;  
   width: 140px;
   padding: 30px;
 }
 
.main_left a {
   text-decoration: none;
   color: black;
 }
 
.tableWine {
  width: 1200px;
}

table {
   text-align: center;
   margin-top: 30px;
   margin-bottom: 50px;
   padding: 30px;
}

td {
  padding: 10px;
  height: 10px;
  font-size: 13px;
}

.tb_el:hover {
   background-color: #d3e3d3;
   cursor:pointer;
}

tr {
   padding: 5px;
}

#tb_column {
   font-size: 15px;
   font-weight: 500;
   color: white;
   background-color: #8e7583;
}

.main_right {
  padding-left: 30px;
  padding-top: 30px;
  padding-right: 120px;
  border: 2px solid gray;
  width: 1150px;
  border-radius: 7px;
}

#searchWineP {
  height: 20px;
  margin-top: 10px;
}

#test {
    background-image: url('../resources/images/bossbaby.png');
    background-size: 150px;
    background-repeat: no-repeat;
}

</style>
</head>
<body>

  <div class="header">
    <div class="logo">
      <a href="${contextPath}/admin/product.page">
        <img src="${contextPath}/resources/images/logo.jpg" width="200px">
      </a>
    </div>
    <div class="gnb">
      <ul>
        <!-- <li id="test"></li> -->
        <li><a>Wine</a></li>
        <li><a>New & Best</a></li>
        <li><a>Board</a></li>
        <li><a>Introduce us</a></li>
        <li><a>My Page</a></li>
      </ul>
    </div>
  </div>
  
  <div class="main">
    <div class="main_left">
    <ul>
      <li><a href="${contextPath}/admin/user.page">회원관리</a></li>
      <li><a href="${contextPath}/admin/product.page">상품관리</a></li>
      <li>주문관리</li>
      <li>게시판관리</li>
    </ul>
    
    </div>
    <div class="main_right">
    <h1>상품관리 <i class="fa-solid fa-wine-glass fa-beat-fade"></i></h1>
      <br>
         <span>정렬개수 :&nbsp;</span>
         <select id="recordPerPage">
           <option value="10">10개</option>
           <option value="20">20개</option>
           <option value="30">30개</option>
         </select>
      
      <div class="searchWine">
         <p id="searchWineP">출시일자 :&nbsp; 
           <input type="text" id="datepicker1">
           ~
           <input type="text" id="datepicker2">
           &nbsp;
           <input type="button" value="검색" onclick="fnSearch()">
         </p>
      </div>
      
      <div class="tableWine">
        <table border="1">
        <thead>
          <tr id="tb_column">
            <td><span class="title" data-column="U.USER_NO" data-order="${order}">회원번호</span></td>
            <td><span class="title" data-column="U.USER_ID" data-order="${order}">회원아이디</span></td>
            <td><span class="title" data-column="U.USER_NAME" data-order="${order}">회원명</span></td>
            <td><span class="title" data-column="U.USER_TEL" data-order="${order}">전화번호</span></td>
            <td><span class="title" data-column="U.USER_EMAIL" data-order="${order}">이메일</span></td>
            <td><span class="title" data-column="U.USER_BIRTH" data-order="${order}">생년월일</span></td>
        </thead>
        <tbody>
          <c:forEach items="${userList}" var="user" varStatus="vs">
            <tr>
              <td>${user.userNo}</td>
              <td>${user.userId}</td>
              <td>${user.userName}</td>
              <td>${user.userTel}</td>
              <td>${user.userEmail}</td>
              <td>${user.userBirth}</td>
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
    
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>