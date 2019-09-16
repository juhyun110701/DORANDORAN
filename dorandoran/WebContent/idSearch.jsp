<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도란도란 : 아이디찾기</title>
    <link rel="stylesheet" href="css/signup.css">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
    <style>
    	.btn2{
    		background-color:#311b1b;
    		color:lightgoldenrodyellow;
    		border:0;
			outline:0;
			border-radius:5px;
			padding:2%;
    	}
    </style>
    <script>
	    window.onload=function(){
			document.form.name.focus();
		}
	    function check(){
			if(document.form.name.value==""){
				alert("이름을 입력해주세요");
				document.form.name.focus();
				return;
			}
			if(document.form.tel1.value=="" || document.form.tel2.value=="" || document.form.tel3.value==""){
				alert("전화번호를 입력해주세요");
				document.form.tel1.focus();
				return;
			}	
			document.forms['form'].submit();
		}//function check()
    </script>
</head>
<body>
<form name="form" action="idSearchProc.jsp" method="post">
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
                              <input type="text" name="name" class="text" size=30><p>
                          </td>
                       </tr>
                       <tr>
                            <td>
                                <font size="5%">전화번호</font>
                            </td>
                            <td>
                                <input type="tel" name="tel1" class="text" size=5> <font size="5%">-</font>
                                <input type="tel" name="tel2" class="text" size=5> <font size="5%">-</font>
                                <input type="tel" name="tel3" class="text" size=5><p>
                            </td>
                       </tr>
                       <tr>
                           <td colspan=2 align="center">
                           	<p>
                           	<input type="button" id="signup" class="btn" value="찾기" onclick="check()">
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