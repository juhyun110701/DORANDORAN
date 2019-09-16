<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id"); 
	String name=request.getParameter("name");
	
	System.out.println(id);
	System.out.println(name);
	
	//db연결
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String sql="select pw from member where id=? AND name=?";
    
    int n=0;
    String pw="";
    
	//db 회원 테이블에 insert하기
	try{
		conn=DBConnection.getCon();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,name);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			n=1;
			pw=rs.getString("pw");
		}
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
<script>
	var pw="<%=pw%>";
	if(<%=n%>==1){
		alert("찾으시는 비밀번호는 "+pw+"입니다");
		location.href="login.jsp";
	}
	else{
		alert("비밀번호 찾기에 실패하였습니다");
		history.go(-1);
	}
</script>
</body>
</html>