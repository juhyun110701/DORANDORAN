<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도란도란 : 회원관리</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<%
	//db연결
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	String id=request.getParameter("id");
	int n=0;
	
	try{
		conn=DBConnection.getCon();
		String sql="delete from member where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		
		n=pstmt.executeUpdate();%>
		<script>
  			var id="<%=id%>";
  			alert("회원 "+id+"이(가) 삭제되었습니다");
  			location.href="memberCtrl.jsp";
  		</script>	
<%
	}
	catch(SQLException e){
    	System.out.println(e.getMessage());
    }
    finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</body>
</html>