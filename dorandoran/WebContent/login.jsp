<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도란도란 : 로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
    <script>
    	window.onload=function(){
    		document.form.id.focus();
    	}
    	
	    function check(){
			if(document.form.id.value==""){
				alert("아이디를 입력해주세요");
				document.form.id.focus();
				return;
			}
			if(document.form.pw.value==""){
				alert("비밀번호를 입력해주세요");
				document.form.pw.focus();
				return;
			}
			document.forms['form'].submit();	//아이디, 비밀번호 다 입력했을 시 loginProc.jsp로 이동
		}//function check()
    </script>
</head>
<body>

<form name="form" action="loginProc.jsp" method="post">
    <table id="whole">
        <tr>
            <td width="47%"></td>
            <td width="12%"><a href="index.jsp"><img src="img/logo.png" width="80%"></a></td>
            <td width="41%"></td>
        </tr>
        <tr>
           <td colspan=3>
               <div id="box" align="center">
                   <h1>로그인</h1>
                   <p/>
                   <table>
                      <tr>
                          <td>
                               <font size="5%">아이디</font>
                          </td>
                          <td>
                              <input type="text" name="id" class="text" size=30><p>
                          </td>
                       </tr>
                       <tr>
                            <td>
                                <font size="5%">비밀번호</font>
                            </td>
                            <td>
                                <input type="password" name="pw" class="text" size=30>
                            </td>
                       </tr>
                       <tr>
                           <td colspan=2 align="center">
                           	<p>
                           	<input type="button" id="login" class="btn" value="로그인" onclick="check()">
                           	<input type="button" id="signup" class="btn" value="회원가입" onclick="location.href='signup.jsp'">
                           	<p>
                           	<p>
                           	<hr color="#311b1b">
                           </td>
                       </tr>
                       <tr>
                       		<td colspan=2 align="center" id="forget">
                       			아이디나 비밀번호를 잊어버리셨나요?<p>
                       		</td>
                       </tr>
                       <tr>
                       		<td colspan=2 align="center">
                       			<input type="button" id="idforget" class="btn" value="아이디 찾기" onclick="location.href='idSearch.jsp'">
                       		    <input type="button" id="pwforget" class="btn" value="비밀번호 찾기" onclick="location.href='pwSearch.jsp'">
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