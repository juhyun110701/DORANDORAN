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
<script>
	function check(){
		alert("로그인 후 이용하실 수 있습니다");
		return ;
	}
</script>
</head>
<body>
    <table id="whole">
        <tr>
            <td width="45%"></td>
            <td width="10%"><a href="index.jsp"><img src="img/logo.png" width="80%"></a></td>
            <td width="45%" style="padding-left:20%;">
            <div id="login"></div>
                		<a href="login.jsp" class="top_menu" style="color:#f54e42;" target="_top">로그인</a>&nbsp;
                		<a href="signup.jsp" class="top_menu" target="_top">회원가입</a><p>   
            </td>
        </tr>
        <tr class="menu">
            <td colspan=3>
                <table width="100%" height="50px">
                    <tr>
                       <td width="30%"></td>
                        <td class="menu_in"><a href="index.jsp">전체도서</a></td>
                        <td class="menu_in"><a href="recentBook.jsp">신간도서</a></td>
                        <td class="menu_in"><a href="oldBook.jsp">중고도서</a></td>
                        <td class="menu_in"><a onclick="check()">마이페이지</a></td>
                        <td width="30%"></td>
                    </tr>
                </table></td>
        </tr>
    </table>
</body>
</html> 
