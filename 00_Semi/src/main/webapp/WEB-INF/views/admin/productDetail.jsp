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

function fnEdit(){
	$.ajax({
		type: 'post',
		url: '${contextPath}/admin/modifyProduct.do',
		data: $('#frm').serialize(),
		dataType: 'json',
		success: function(resData) {
			alert('수정이 완료되었습니다.'); 
		},
		error: function(jqXHR) {
			alert('수정이 실패되었습니다. 입력값을 확인해주세요.');
		}
	})
}

$('#btn_three').on('click', function(){
	function fnRemove(prodNo){
		type: 'post',
		url: '${contextPath}/admin/deleteProduct.do',
		data: prodNo,
		dataType: 'json',
		success: function(resData)
		
		
	}
	
})

$(function(){
	function fnRemove(${w.prodNo})
	
}
nRemove(${w.prodNo})
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
   background-color:  #D064D0;
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

#tableEdit {
  width: 800px;
  margin-top: 20px;
  margin-bottom: 20px;
  padding: 30px;
  padding-left: 40px;
  padding-right: 50px;
}

td {
  padding: 10px;
  font-size: 13px;
}

.tb_el:hover {
   background-color: #D064D0;
   cursor:pointer;
}

tr {
   padding: 5px;
}

.tb_row input {
  height: 28px;
  margin-top: 3px;
  margin-bottom: 3px;
  width: 250px;
}

select {
  height: 28px;
  margin-top: 3px;
  margin-bottom: 3px;
  width: 250px;
  text-align: center;
}

.main_right {
  padding-left: 50px;
  padding-top: 30px;
  padding-right: 160px;
  margin-right: 70px;
  border: 2px solid gray;
}

.row_left {
  width: 120px;
  background-color: #4D3771;
  color: white;
  font-size: 15px;
  font-weight: 500;
}

.row_right {
  width: 400px;

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

.row_right {
  text-align: left;
  padding-left: 20px;
}

input {
  text-align: center;
}

option {
  width: 100px;
}

#btn_three {
  width: 60px;
  height: 30px;
  margin-right: 10px;
}

#wNo {
  background-color: #dcdcdc;
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
        <li>회원관리</li>
        <li>상품관리</li>
        <li>주문관리</li>
        <li>게시판관리</li>
      </ul>
    </div>
    <div class="main_right">
      <h1>상품 상세</h1>
      <br>
      <div class="tableWine">
        <form id="frm">
          <div class="btnDiv">
            <input type="button" value="편집" onclick="fnEdit()" id="btn_three">
            <input type="button" value="삭제" onclick="fnRemove(${w.prodNo})" id="btn_three">
            <input type="button" value="목록" onclick="fnList()" id="btn_three">
          </div>
          <table border="1" id="tableEdit">
              <tbody>
                <tr class="tb_row">
                  <td class="row_left">와인번호</td>
                  <td class="row_right"><input type="text" value="${w.prodNo}" id="wNo" name="wNo" readonly="readonly"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">이미지</td>
                  <td class="row_right"><img src="${w.prodThumbnail}" width="200px"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">와인명(KOR)</td>
                  <td class="row_right"><input type="text" value="${w.prodName}" id="wName" name="wName"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">와인명(ENG)</td>
                  <td class="row_right"><input type="text" value="${w.prodNameEng}" id="wNameEng" name="wNameEng"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">가격</td>
                  <td class="row_right"><input type="text" value="${w.prodPrice}" id="wPrice" name="wPrice"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">타입</td>
                  <td class="row_right"><select><option>RED</option><option>WHITE</option><option>ROSE</option><option>SPARKLING</option></select></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">국가</td>
                  <td class="row_right" id="wprodNation"><input type="text" value="${w.prodNation}" id="wNation" name="wNation"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">알코올</td>
                  <td class="row_right"><input type="text" value="${w.prodAlcohol}" id="wAlcohol" name="wAlcohol"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">출시일자</td>
                  <td class="row_right"><input type="text" value="${w.prodDate}" id="wDate" name="wDate" disabled="disabled"></td>
                </tr>
                <tr class="tb_row">
                  <td class="row_left">재고</td>
                  <td class="row_right"><input type="number" value="${w.prodStock}" id="wStock" name="wStock"></td>
                </tr>
              </tbody>
          </table>
        </form>
      </div>
    </div>
  </div>
  
  <div class="footer">
  
  </div>
  
</body>
</html>