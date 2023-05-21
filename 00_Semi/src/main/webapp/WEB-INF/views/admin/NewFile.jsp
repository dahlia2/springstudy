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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>

</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

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

table {
   text-align: center;
   padding: 20px;
   width: auto;
}

td {
  padding: 10px;
  height: 10px;
  font-size: 13px;
}

.tb_el:hover {
   background-color: yellow;
   cursor:pointer;
}

tr {
   padding: 5px;
}
#tb_column {
   font-size: 15px;
   font-weight: 500;
   background-color: orange;
}

.main_right {
  padding-left: 30px;
  padding-top: 30px;
  padding-right: 150px;
  border: 2px solid gray;
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
      <a href="${contextPath}/admin/main.page">
        <img src="https://www.winenara.com/asset/images/shop/default/pc_logo.png">
      </a>
    </div>
    <div class="gnb">
      <ul>
        <li id="test"></li>
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
        <li>회원관리</li>
        <li>상품관리</li>
        <li>주문관리</li>
        <li>게시판관리</li>
      </ul>
    </div>
    <div class="main_right">
      <h1>상품 수정</h1>
      <div class="tableWine">
        <table border="1">
          <tbody>
            <tr class="tb_row">
              <td class="row_left">와인번호</td>
              <td><input type="text" value="${w.prodNo}" readonly="readonly"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">와인명(KOR)</td>
              <td><input type="text" value="${w.prodName}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">와인명(ENG)</td>
              <td><input type="text" value="${w.prodNameEng}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">가격</td>
              <td><input type="text" value="${w.prodPrice}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">타입</td>
              <td><select><option>RED</option><option>WHITE</option><option>ROZE</option><option>SPARKLING</option></select></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">국가</td>
              <td><input type="text" value="${w.prodNation}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">알코올</td>
              <td><input type="text" value="${w.prodAlcohol}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">출시일자</td>
              <td><input type="text" value="${w.prodDate}"></td>
            </tr>
            <tr class="tb_row">
              <td class="row_left">재고</td>
              <td><input type="text" value="${w.prodStock}"></td>
            </tr>
          </tbody>
            <tr>
              <td colspan="10">${pagination}</td>
            </tr>
        </table>
        </div>
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>