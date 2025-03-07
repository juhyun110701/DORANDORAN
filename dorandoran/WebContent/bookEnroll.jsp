<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란 : 책 등록</title>
<link rel="stylesheet" href="css/bookEnroll.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script>
    	window.onload=function(){
    		document.form.title.focus();
    	}
    	
    	function check(){
			/*if(document.form.id.value==""){
				alert("아이디를 입력해주세요");
				document.form.id.focus();
				return;
			}
			if(document.form.pw.value==""){
				alert("비밀번호를 입력해주세요");
				document.form.pw.focus();
				return;
			}*/
			document.forms['form'].encoding="multipart/form-data";
			document.forms['form'].submit();	//아이디, 비밀번호 다 입력했을 시 loginProc.jsp로 이동
		}//function check()
</script>
</head>
<body>
<jsp:include page="topp.jsp" flush="false"/><p><br>

<form name="form" action="bookEnrollProc.jsp" method="post" enctype="multipart/form-data">
    <table id="whole">
        <tr>
           <td colspan=3>
               <div id="box" align="center">
                   <h1>책 등록하기</h1>
                   <p/>
                   <table>
                      <tr>
                         	<td>
                               <font size="5%">제목</font>
                         	 </td>
                         	<td>
                              <input type="text" name="title" class="text" size=30><p>
                       	    </td>
                      		<td width="10%"></td>
                      		<td>
                               <font size="5%">이미지</font>
                          	</td>
                      		<td>
                              <input type="file" name="file"><p>
                          	</td>
                      </tr>
                      <tr>	
                            <td>
                                <font size="5%">작가</font>
                            </td>
                            <td>
                                <input type="text" name="writer" class="text" size=30><p>
                            </td>
                            <td width="10%"></td>
                            <td>
                               <font size="5%">장르</font>
                          	</td>
                      		<td>
                              <select name="genre">
                              	<option value="null" selected>----- 선택 -----</option>
                              	<option value=0>총류</option>
                              	<option value=1>철학</option>
                              	<option value=2>종교</option>
                              	<option value=3>사회과학</option>
                              	<option value=4>순수과학</option>
                              	<option value=5>기술과학</option>
                              	<option value=6>예술</option>
                              	<option value=7>언어</option>
                              	<option value=8>문학</option>
                              	<option value=9>역사</option>
                              </select><p>
                          	</td>
                       </tr>
                       <tr>
                            <td>
                                <font size="5%">출판사</font>
                            </td>
                            <td>
                                <input type="text" name="publisher" class="text" size=30><p>
                            </td>
                            <td width="10%"></td>
                            <td>
                                <font size="5%">출판일</font>
                            </td>
                            <td>
                                <input type="date" name="publish_date" class="text" size=30><p>
                            </td>
                       <tr>
                            <td>
                                <font size="5%">수량</font>
                            </td>
                            <td>
                                <input type="text" name="stock" class="text" size=30><p>
                            </td>
                       		<td width="10%"></td>
                            <td>
                                <font size="5%">가격</font>
                            </td>
                            <td>
                                <input type="text" name="price" class="text" size=30><p>
                            </td>
                       </tr>
                       <tr>
                            <td>
                                <font size="5%">옮긴이</font>
                            </td>
                            <td  colspan=4>
                                <input type="text" name="translator" class="text" size=30><p>
                            </td>
                       </tr>
                       <tr>
                           <td colspan=5 align="center">
                           	<p>
                           	<input type="button" id="enroll" class="btn" value="등록하기" onclick="check()">
                           	<p>
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