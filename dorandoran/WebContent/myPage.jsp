<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>도란도란 : 마이페이지</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
#box{
    background-color:lightgoldenrodyellow;
    border-radius:30px;
    padding:3%;
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
%>
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
           	<div id="dbox" align="center"><a href="#">책 후기 작성</a></div>
           	<div id="dbox" align="center"><a href="oldBookEnroll.jsp">중고 도서 등록</a></div>
           	<div id="dbox" align="center"><a href="boughtBook.jsp">구매목록</a></div>
           	<div id="dbox" align="center"><a href="#">판매목록</a></div>
           	<div id="dbox" align="center"><a href="#">비밀번호 변경</a></div>
           	<%if(id.equals("admin")){ %>
           		<div id="mbox" align="center"><a href="memberCtrl.jsp">회원관리</a></div>	
           	<%} %>
           </td>
           <td width="5%"></td>
           <td width="65%">
           	<div id="box" align="center">
           	
           	</div>
           </td>
           <td width="5%"></td>
         </tr>
</table>  
</body>
</html>