<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>

<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>도란도란 : 클라이언트 목록</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
#box{
    background-color:lightgoldenrodyellow;
    border-radius:30px;
    padding:1%;
    width:90%;
}

#dbox{
    background-color:#311b1b;
    color:lightgoldenrodyellow;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#dbox a{
    color:lightgoldenrodyellow;
}

#dbox a:hover{
    color:#ed6853;
}

#mbox{
    background-color:#311b1b;
    color:#ed6853;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#mbox a{
    color:#ed6853;
}
#bbox{
    background-color:#311b1b;
    color:#15a100;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#bbox a{
    color:#15a100;
}
.thumbnail{
	width:100px;
	height:150px;
}
.link{
	color:#311b1b;
}
b:hover{
	color:#ed6853;
}
#specific{
	border: 2px solid #311b1b;
	background-color:lightgoldenrodyellow;
	border-collapse:collapse;
}
#ybox{
    background-color:#311b1b;
    color:#fce803;
    border-radius:10px;
    padding:3%;
    margin-bottom:1%;
}

#ybox a{
    color:#fce803;
}
</style>
</head>
<body>
<jsp:include page="topp.jsp" flush="false"/><p>
<%
	request.setCharacterEncoding("utf-8");
	
	Cookie[] cookies=request.getCookies();
	String id="";
		
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
	    	id=cookies[i].getValue();
		}
	}
%>
<table id="whole">
        <tr>
           <td width="5%"></td>
           <td width="20%" style="vertical-align:top;">
           	<div id="box" align="center">
           		<br><font style="font-size:150%;">마이페이지<p></font>
           		<%=id %>님 환영합니다 :)<p>
           	</div><p>
           	<div id="dbox" align="center"><a href="oldBookEnroll.jsp">중고 도서 등록</a></div>
           	<%if(!(id.equals("admin")||id.equals("alba"))){ %>
           		<div id="dbox" align="center"><a href="bookReview.jsp">책 후기 작성</a></div>
           		<div id="dbox" align="center"><a href="boughtBook.jsp">구매목록</a></div>
           	<%} %>
           	<div id="dbox" align="center"><a href="soldBook.jsp">중고도서 판매목록</a></div>
           	<div id="dbox" align="center"><a href="pwChange.jsp">비밀번호 변경</a></div>
           	<%if(id.equals("admin")){ %>
           		<br>
           		<div id="mbox" align="center"><a href="bookEnroll.jsp">도서 등록</a></div>
           		<div id="mbox" align="center"><a href="memberCtrl.jsp">회원관리</a></div>	
           		<div id="mbox" align="center"><a href="clientList.jsp">클라이언트 관리</a></div>
           	<%} %>
           	<%if(id.equals("alba")||id.equals("admin")) {%>
           		<br>
           		<div id="bbox" align="center"><a href="boughtList.jsp">판매내역 관리</a></div>
           	<%} %>
           	<%if(id.equals("alba")) {%>
           		<div id="bbox" align="center"><a href="albaMemList.jsp">회원관리(알바용)</a></div>
           	<%} %>
           	<%if(id.equals("admin")) {%>
           		<br>
           		<div id="ybox" align="center"><a href="dicList.jsp">데이터사전</a></div>
           	<%} %>
           </td>
           <td width="5%"></td>
           <td width="65%">
           	<div id="box" align="center">
           	<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<h2>클라이언트 목록</h2>
				<%				
					//db연결
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select * from DORAN.CLIENTTBL";
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						%>
						<table width="110%" align="center" id="specific">
								<tr align="center" style="color:#ed6853;font-size:20px;" id="specific">
									<td id="specific" width="20%">이름</td>
									<td id="specific" width="20%">이메일</td>
									<td id="specific" width="20%">전화번호</td>
								</tr>
							<%
								while(rs.next()){%>
									<tr id="specific" align="center">	
										<td id="specific" align="center"><%=rs.getString("이름") %></td>
										<td id="specific" align="center"><%=rs.getString("이메일") %></td>
										<td id="specific" align="center"><%=rs.getString("전화번호") %></td>
									</tr>
								<%}//while
							%>
						</table>
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
						</div>
					</td>
				</tr>
			</table>
           	</div>
           	<p>
           </td>
           <td width="5%"></td>
         </tr>
</table>  
</body>
</html>