<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란</title>
<!--
<link rel="shortcut icon" href="img/logo.png">
<link rel="apple-touch-icon" href="img/logo_apple.png">
-->
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
	<%	
		String id=(String)session.getAttribute("id");
	%>
    <table id="whole">
        <tr>
            <td width="45%"></td>
            <td width="10%"><a href="index.jsp"><img src="img/logo.png" width="80%"></a></td>
            <td width="45%" style="padding-left:20%;">
            	<%
                	if(session.getAttribute("id")==null){
                %>
                		<a href="login.jsp" class="top_menu" style="color:#f54e42;">로그인</a>&nbsp;
                <%
                	}
                	else{
                %>
                		<div id="whilelog"><font style="color:#f54e42;"><%=id %></font>님 로그인 중입니다</div><p>
                		<a href="index.jsp" class="top_menu" style="color:#f54e42;">로그아웃</a>&nbsp;	
                <%
        				session.invalidate();
                		response.sendRedirect("index.jsp");
                	}
                %>
                <a href="signup.jsp" class="top_menu">회원가입</a><p>
                
            </td>
        </tr>
        <tr class="menu">
            <td colspan=3>
                <table width="100%" height="50px">
                    <tr>
                       <td width="30%"></td>
                        <td class="menu_in"><a href="index.jsp">전체도서</a></td>
                        <td class="menu_in"><a href="newBook.jsp">신간도서</a></td>
                        <td class="menu_in"><a href="oldBook.jsp">중고도서</a></td>
                        <td class="menu_in"><a href="toMyPage.jsp?id=<%=id%>">마이페이지</a></td>
                        <td width="30%"></td>
                    </tr>
                </table></td>
        </tr>
    </table>
</body>
</html> 
