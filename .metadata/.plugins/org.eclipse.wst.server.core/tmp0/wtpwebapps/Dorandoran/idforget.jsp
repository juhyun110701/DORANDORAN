<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도란도란 : 아이디찾기</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body onload="form.id.focus()">
<form name="form" action="login_proc.jsp" method="post">
    <table id="whole">
        <tr>
            <td width="47%"></td>
            <td width="12%"><a href="index.jsp"><img src="img/logo.png" width="80%"></a></td>
            <td width="41%"></td>
        </tr>
        <tr>
           <td colspan=3>
               <div id="box" align="center">
                   <h1>아이디 찾기</h1>
                   <p/>
                   <table>
                      <tr>
                          <td>
                               <font size="5%">이름</font>
                          </td>
                          <td>
                              <input type="text" id="name" class="text" size=30><p>
                          </td>
                       </tr>
                       <tr>
                          <td>
                               <font size="5%">전화번호</font>
                          </td>
                          <td>
                              <input type="tel" id="tel1" class="text" size=5> <font size="5%">-</font>
                              <input type="tel" id="tel2" class="text" size=5> <font size="5%">-</font>
                              <input type="tel" id="tel3" class="text" size=5><p>
                          </td>
                       </tr>
                       <tr>
                          <td>
                               <font size="5%">이메일</font>
                          </td>
                          <td>
                              <input type="text" id="email" class="text" size=30><p>
                          </td>
                       </tr>
                       <tr>
                           <td colspan=2 align="center">
                           	<p>
                           	<input type="button" id="login" class="btn" value="아이디찾기" onclick="location.href='idforgetProc.jsp'">
                           </td>
                       </tr>
                   </table>
               </div>
           </td>
        </tr>
    </table>
</form>
</body>
</html>