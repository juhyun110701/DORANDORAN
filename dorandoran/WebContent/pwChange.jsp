<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>

<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>도란도란 : 마이페이지</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script>
		var pattern1 = /[0-9]/;	
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[*!%@#^]/;
		var pattern4=/[~\$<>&]/;
		var pw_msg = "";

    	window.onload=function(){
    		document.form.pw.focus();
    	}
    	
    	function check(){
    		if(document.form.pw.value==""){
				alert("비밀번호를 입력해주세요");
				document.form.pw.focus();
				return;
			}
			if(document.form.pwchk.value==""){
				alert("비밀번호 확인란을 입력해주세요");
				document.form.pwchk.focus();
				return;
			}
			
			if(pattern4.test(document.form.pw.value)){
				alert("특수문자는 *, !, %, @, #, ^만 사용이 가능합니다");
				return;
			}
			if(!pattern1.test(document.form.pw.value)||!pattern2.test(document.form.pw.value)||!pattern3.test(document.form.pw.value)||document.form.pw.value.length<8||document.form.pw.value.length>50){
	            alert("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
	            return;
	        }	
			if(document.form.pw.value !=document.form.pwchk.value){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				return;
			}
			
			document.forms['form'].submit();	
		}//function check()
		
</script>
<style>
#box{
    background-color:lightgoldenrodyellow;
    border-radius:30px;
    padding:1%;
    width:90%;
}

#dbox{
    background-color:#311b1b;
    color:lightgoldenrodyellow;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#dbox a{
    color:lightgoldenrodyellow;
}

#dbox a:hover{
    color:#ed6853;
}

#mbox{
    background-color:#311b1b;
    color:#ed6853;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#mbox a{
    color:#ed6853;
}
.thumbnail{
	width:100px;
	height:150px;
}
.link{
	color:#311b1b;
}
b:hover{
	color:#ed6853;
}
#specific{
	border: 2px solid #311b1b;
	background-color:lightgoldenrodyellow;
	border-collapse:collapse;
}
.text{
	border-radius:10px;
	border:0;
	outline:0;
	padding-left:5px;
	font-size:110%;
}
.btn{
	background-color:#311b1b;
	color:lightgoldenrodyellow;
	border-radius:20px;
	border:0;
	outline:0;
	padding:3%;
	font-size:120%;
}
</style>
</head>
<body>
<jsp:include page="topp.jsp" flush="false"/><p>
<%
	request.setCharacterEncoding("utf-8");
	
	Cookie[] cookies=request.getCookies();
	String id="";
		
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
	    	id=cookies[i].getValue();
		}
	}

	//db연결
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="";
%>	
<form name="form" action="pwChangeProc.jsp" method="post">
<table id="whole">
        <tr>
           <td width="5%"></td>
           <td width="20%">
           	<div id="box" align="center">
           		<font style="font-size:150%;">마이페이지<p></font>
           		<%=id %>님 환영합니다 :)<p>
           		구매건수 : 건<br>
           		판매건수 : 건<br>
           	</div><p>
           	<div id="dbox" align="center"><a href="bookReview.jsp">책 후기 작성</a></div>
           	<div id="dbox" align="center"><a href="oldBookEnroll.jsp">중고 도서 등록</a></div>
           	<div id="dbox" align="center"><a href="boughtBook.jsp">구매목록</a></div>
           	<div id="dbox" align="center"><a href="soldBook.jsp">판매목록</a></div>
           	<div id="dbox" align="center"><a href="pwChange.jsp">비밀번호 변경</a></div>
           	<%if(id.equals("admin")){ %>
           		<div id="mbox" align="center"><a href="memberCtrl.jsp">회원관리</a></div>	
           	<%} %>
           </td>
           <td width="5%"></td>
           <td width="65%">
           	<div id="box" align="center">
           	<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<h2>비밀번호 변경</h2>
				
				<table width="70%" align="center">
	                <tr>
                            <td>
                                <font size="5%">비밀번호</font>
                            </td>
                            <td>
                                <input type="password" name="pw" class="text" size=30><p>
                            </td>
                       </tr>
                       <tr>
                            <td>
                                <font size="5%">비밀번호 확인</font>
                            </td>
                            <td>
                                <input type="password" name="pwchk" class="text" size=30><p>
                            </td>
                       </tr>
                       <tr>
                           <td colspan=2 align="center">
                           	<p>
                           	<input type="button" id="signup" class="btn" value="변경하기" onclick="check()">
                           </td>
                       </tr>
            	</table>
            	</table>
           	</div>
           </td>
           <td width="5%"></td>
         </tr>
</table>  
</form>
</body>
</html>