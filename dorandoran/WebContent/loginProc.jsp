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
	String pw=request.getParameter("pw");

	Boolean isLogin=false;
	
	//db연결
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    
    try{
    	conn=DBConnection.getCon();
    	String sql="select id, pw from member where id='"+id+"' and pw='"+pw+"'";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	
    	if(rs.next()){
  			//isLogin=true;
  			Cookie cookie=new Cookie("id",id);
  			System.out.println("loginProc id : "+id);
  			cookie.setMaxAge(60*30);
  			//cookie.setPath("/");
  			response.addCookie(cookie);
    		%>
  			<script>
  				var id="<%=id%>";
  				alert(id+"님 로그인되었습니다");
  				//location.href="index.jsp";
  				//location.target="area";
  			</script>
  			<meta http-equiv="refresh" content="1;URL='indexx.jsp'">
	  			
<%			
  		}//if
    	else{%>
    		<script>
    			alert("회원 정보가 올바르지 않습니다");
    			location.href="login.jsp";
    		</script>
<%    	}
  		
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

</body>
</html>