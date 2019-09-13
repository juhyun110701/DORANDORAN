<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>

<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란 : 구매한 책</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
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
</style>
</head>
<body>
<jsp:include page="topp.jsp" flush="false"/><p>
<%	
		Cookie[] cookies=request.getCookies();
		String id="";
		
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
        		id=cookies[i].getValue();
			}
		}
		
%>
<p></p>
<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<%				
					//db연결
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select * from bought where buyer=?";
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1,id);
						rs=pstmt.executeQuery();
						%>
						<table width="80%" align="center" id="specific">
								<tr align="center" style="color:#ed6853;font-size:20px;" id="specific">
									<td id="specific" width="20%">표지</td>
									<td id="specific" width="20%">제목</td>
									<td id="specific" width="20%">판매자</td>
									<td id="specific" width="20%">가격</td>
									<td id="specific" width="20%">구매일시</td>
								</tr>
							<%
								while(rs.next()){%>
									<tr id="specific" align="center">	
										<td id="specific" align="center"><img class="thumbnail" src="imgView.jsp?title=<%=rs.getString("title")%>"></td>
										<td id="specific" align="center"><%=rs.getString("title") %></td>
										<td id="specific" align="center"><%=rs.getString("seller") %></td>
										<td id="specific" align="center"><%=rs.getString("price") %></td>
										<td id="specific" align="center"><%=rs.getString("bought_date") %></td>
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
</body>
</html>