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
<title>도란도란 : 마이페이지</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
#box{
    background-color:lightgoldenrodyellow;
    border-radius:30px;
    padding:2%;
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
           <td width="20%">
           	<div id="box" align="center">
           		<font style="font-size:150%;">마이페이지<p></font>
           		<%=id %>님 환영합니다 :)<p>
           		구매건수 : 건<br>
           		판매건수 : 건<br>
           	</div><p>
           	<div id="dbox" align="center"><a href="bookReview.jsp">책 후기 작성</a></div>
           	<div id="dbox" align="center"><a href="oldBookEnroll.jsp">중고 도서 등록</a></div>
           	<div id="dbox" align="center"><a href="boughtBook.jsp">구매목록</a></div>
           	<div id="dbox" align="center"><a href="soldBook.jsp">판매목록</a></div>
           	<div id="dbox" align="center"><a href="#">비밀번호 변경</a></div>
           	<%if(id.equals("admin")){ %>
           		<div id="mbox" align="center"><a href="memberCtrl.jsp">회원관리</a></div>	
           	<%} %>
           </td>
           <td width="5%"></td>
           <td width="65%">
           	<div id="box" align="center">
           	<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<h2>구매목록</h2>
				<%				
					//db연결
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					String sql="select * from bought where buyer=? AND seller='도란도란' order by bought_date desc";
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1,id);
						rs=pstmt.executeQuery();
						%>
						<table width="110%" align="center" id="specific">
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
           	</div>
           	<p>
           	<div id="box" align="center">
				<h2>중고도서 구매목록</h2>
				<%				
					sql="select * from bought where buyer=? AND seller!='도란도란' order by bought_date desc";
					
					try{
						conn=DBConnection.getCon();
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1,id);
						rs=pstmt.executeQuery();
						%>
						<table width="100%" align="center" id="specific">
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
										<td id="specific" align="center"><img class="thumbnail" src="oldImgView.jsp?title=<%=rs.getString("title")%>"></td>
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
           	</div>
           	<p>
           </td>
           <td width="5%"></td>
         </tr>
</table>  
</body>
</html>