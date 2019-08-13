<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>도란도란 : 아이디 중복체크</title>
<style>
	*{
    	font-family: 'Sunflower', sans-serif;
    	font-weight:bold;
	}	
    .btn2{
    	background-color:#311b1b;
    	color:lightgoldenrodyellow;
    	border:0;
		outline:0;
		border-radius:5px;
		padding:2%;
    }
</style>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<script>
	function dupChk(){
		document.forms['form'].submit();
		window.close();
	}
	
	
</script>
</head>
<body>
<center>
	<%
		String formid=request.getParameter("id");
	
		//db연결
	    Connection conn=null;
	    PreparedStatement pstmt=null;
	    ResultSet rs=null;
	    
	    try{
	    	conn=DBConnection.getCon();
	    	String sql="select id from member where id='"+formid+"'";
	    	pstmt=conn.prepareStatement(sql);
	    	rs=pstmt.executeQuery();
	    	
	    	if(rs.next()){
				out.println("<font color='red'>"+formid+"는 사용할 수 없는 아이디입니다</font>");%><p>
				새로운 아이디를 입력하세요
				<form name="checkForm" method="post" action="idDupChk.jsp">
					<input type="text" name="id" class="text" size=30>
					<input type="submit" class="btn2" value="중복확인">
					<!-- <input type="button" class="btn2" value="창닫기" onclick="dupChk()"><p> -->
				</form>
<%	  		}//if
	    	else{
	  			out.println(formid+"는 사용할 수 있는 아이디입니다");%><p>
	  			<input type="button" class="btn2" value="사용하기" onclick="setid()">
<%	    	}
	    }//try
	    catch(SQLException e){
	    	System.out.println(e.getMessage());
	    }
	    finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
			catch(SQLException e){
				System.out.println(e.getMessage());
			}
		}
	%>
</center>
<script>
	function setid(){
		opener.document.form.id.value="<%=formid%>";
		self.close();
	}
</script>
</body>
</html>