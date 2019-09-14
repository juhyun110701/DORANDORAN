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
<title>도란도란 : 중고도서</title>
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
.btn{
	border-radius:20px;
	border:0;
	outline:0;
	padding:1%;
	width:60%;
}
</style>
<script>
function login(){
	alert("로그인 후 이용하실 수 있습니다");
	return ;
}
</script>
</head>
<body>
<jsp:include page="top.jsp" flush="false"/><p>
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
					
					String sql="select title, writer, price, status from old_book order by status NULLS FIRST, price";
					int count=1;
					String status="";
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						%>
						<table width="80%" align="center" id="books">
							<%
								while(rs.next()){
									System.out.println(rs.getString("status"));
									if(rs.getString("status")==null) status="판매 중";
									else status=rs.getString("status");
									
									if(count%3==1){%>
									<tr>	
										<%if(status.equals("판매됨")) {%>
												<td width="5%"></td>
												<td width="30%" align="center">
													<a class="link"  onclick="login()">
														<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
														<b><%=rs.getString("title") %></b><br>
														<%=rs.getString("price") %><br>
														<input type="button" class="btn" style="background-color:#ed6853;color:white;" value="판매 완료">
													</a>
												</td>
										<%} 
										else{%>
												<td width="5%"></td>
												<td width="30%" align="center">
													<a onclick="login()" class="link">
														<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
														<b><%=rs.getString("title") %></b><br>
														<%=rs.getString("price") %><br>
														<input type="button" class="btn" style="background-color:#15a100;color:white;" value="판매 중">
													</a>
												</td>
										<%}%>
								<%	}//if
									else if(count%3==2){%>
										<%if(status.equals("판매됨")) {%>
												<td width="30%" align="center">
													<a class="link" onclick="login()">
														<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
														<b><%=rs.getString("title") %></b><br>
														<%=rs.getString("price") %><br>
														<input type="button" class="btn" style="background-color:#ed6853;color:white;" value="판매 완료">
													</a>
												</td>
										<%} 
										else{%>
												<td width="30%" align="center">
													<a onclick="login()" class="link">
														<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
														<b><%=rs.getString("title") %></b><br>
														<%=rs.getString("price") %><br>
														<input type="button" class="btn" style="background-color:#15a100;color:white;" value="판매 중">
													</a>
												</td>
										<%}%>
									<%}
									else{%>
										<%if(status.equals("판매됨")) {%>
											<td width="30%" align="center">
												<a class="link" onclick="login()">
													<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
													<b><%=rs.getString("title") %></b><br>
													<%=rs.getString("price") %><br>
													<input type="button" class="btn" style="background-color:#ed6853;color:white;" value="판매 완료">
												</a>
											</td>
											<td width="5%"></td>
											<p></p>
											</tr>
										<%} 
										else{%>
											<td width="30%" align="center">
												<a onclick="login()" class="link">
													<img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"><p>
													<b><%=rs.getString("title") %></b><br>
													<%=rs.getString("price") %><br>
													<input type="button" class="btn" style="background-color:#15a100;color:white;" value="판매 중">
												</a>
											</td>
											<td width="5%"></td>
											<p></p>
											</tr>
										<%}%>
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