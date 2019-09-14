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
<title>도란도란 : 신간도서</title>
<!--
<link rel="shortcut icon" href="img/logo.png">
<link rel="apple-touch-icon" href="img/logo_apple.png">
-->
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
.thumbnail{
	width:200px;
	height:300px;
}
.link{
	color:#311b1b;
}
b:hover{
	color:#ed6853;
}
</style>
</head>
<body>
<jsp:include page="topp.jsp" flush="false"/><p>
<p></p>
<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<%
					String id=request.getParameter("id");
					//db연결
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select title, writer, price, publish_date from book where SYSDATE-publish_date<30";
					int count=1;
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						%>
						<table width="80%" align="center" id="books">
							<%
								while(rs.next()){
									if(count%3==1){%>
									<tr>	
										<td width="5%"></td>
										<td width="30%" align="center">
											<a href="bookView.jsp?title=<%=rs.getString("title") %>" class="link">
												<img class="thumbnail" src="imgView.jsp?title=<%=rs.getString("title")%>"><p>
												<b><%=rs.getString("title") %></b><br>
												<%=rs.getString("writer") %><br>
											</a>
										</td>								
								<%	}//if
									else if(count%3==2){%>
										<td width="30%" align="center">
										<a href="bookView.jsp?title=<%=rs.getString("title") %>" class="link">
										<img class="thumbnail" src="imgView.jsp?title=<%=rs.getString("title")%>"><p>
										<b><%=rs.getString("title") %></b><br>
										<%=rs.getString("writer") %><br>
										</a>
										</td>
									<%}
									else{%>
											<td width="30%" align="center">
												<a href="bookView.jsp?title=<%=rs.getString("title") %>" class="link">
												<img class="thumbnail" src="imgView.jsp?title=<%=rs.getString("title")%>"><p>
												<b><%=rs.getString("title") %></b><br>
												<%=rs.getString("writer") %><br>
												</a>
											</td>
											<td width="5%"></td>
											<p></p>
										</tr>
									<%}
									count++;
								}//while
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