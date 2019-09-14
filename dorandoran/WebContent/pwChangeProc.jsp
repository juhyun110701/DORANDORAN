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

	Cookie[] cookies=request.getCookies();
	String id="";
		
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
	    	id=cookies[i].getValue();
		}
	}
	
	String pw=request.getParameter("pw");
	String pwchk=request.getParameter("pwchk");
	
	//db연결
    Connection conn=null;
    PreparedStatement pstmt=null;
    String sql="update member set pw=?, pwchk=? where id=?";
    int n=0;
    
	//db 회원 테이블에 insert하기
	try{
		conn=DBConnection.getCon();
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,pw);
		pstmt.setString(2,pwchk);
		pstmt.setString(3,id);
		
		n=pstmt.executeUpdate();
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
	if(<%=n%>>0){
		alert("비밀번호가 변경되었습니다");
		location.href="myPage.jsp";
	}
	else{
		alert("비밀번호 변경에 실패하였습니다 :(");
		history.go(-1);
	}
</script>
</body>
</html>