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

	String name=request.getParameter("name"); 
	
	String tel1=request.getParameter("tel1");
	String tel2=request.getParameter("tel2");
	String tel3=request.getParameter("tel3");
	String tel=tel1+"-"+tel2+"-"+tel3;
	
	System.out.println(name);
	System.out.println(tel);
	
	//db연결
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String sql="select id from member where name=? AND tel=?";
    
    int n=0;
    String id="";
    
	//db 회원 테이블에 insert하기
	try{
		conn=DBConnection.getCon();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,tel);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			n=1;
			id=rs.getString("id");
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
	var id="<%=id%>";
	if(<%=n%>==1){
		alert("찾으시는 ID는 "+id+"입니다");
		location.href="login.jsp";
	}
	else{
		alert("아이디 찾기에 실패하였습니다");
		history.go(-1);
	}
</script>
</body>
</html>