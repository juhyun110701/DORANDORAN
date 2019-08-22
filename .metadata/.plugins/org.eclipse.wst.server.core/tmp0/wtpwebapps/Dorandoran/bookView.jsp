<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란 : 책 정보</title>
<!--
<link rel="shortcut icon" href="img/logo.png">
<link rel="apple-touch-icon" href="img/logo_apple.png">
-->
<link rel="stylesheet" href="css/bookView.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script>
//maxlength 체크
function maxLengthCheck(object){
 if (object.value.length > object.maxLength){
  object.value = object.value.slice(0, object.maxLength);
 }   
}
</script>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/><p>
<%
	//db연결
	Connection conn=null;
    PreparedStatement pstmt=null;
    //String sql="select * from book where ";
%>
<div id="box" align="center">
<table border=1 id="whole">
	<tr>
		<td rowspan=5 width="30%">img</td>
		<td id="title" class="title">제목</td>
	</tr>
	<tr>
		<td id="writer">김작가 지음</td>
	</tr>
	<tr>
		<td><br></td>
	</tr>
	<tr>
		<td id="price">가격 : </td>
	</tr>
	<tr>
		<td>
			수량 : <input type="number" name="amount" value=0 max=99 maxlength=2 style="width:30px;" oninput="maxLengthCheck(this)"> 권
		</td>
	</tr>
	<tr>
		<td colspan=2 align="center">
			<input type="button" id="buy" class="btn" value="구매하기">
		</td>
	</tr>
</table>
</div>
<p>
<div id="box" align="center">
<table border=1 id="whole" class="info">
	<tr>
		<td colspan=4 align="center" id="plus">책 정보</td>
	</tr>
	<tr>
		<td>제목</td>
		<td id="title">제목자리</td>
		<td>작가</td>
		<td id="writer">작가자리</td>
	</tr>
	<tr>
		<td>출판사</td>
		<td id="publisher">출판사자리</td>
		<td>출판일</td>
		<td id="publish_date">출판일자리</td>
	</tr>
	<tr>
		<td>분야</td>
		<td id="genre">분야자리</td>
		<td>옮긴이</td>
		<td id="translator">옮긴이자리</td>
	</tr>
</table>
</div>
</body>
</html>