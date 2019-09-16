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
<title>도란도란 : 도서 상세 페이지</title>
<!--
<link rel="shortcut icon" href="img/logo.png">
<link rel="apple-touch-icon" href="img/logo_apple.png">
-->
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
.thumbnail{
	width:300px;
	height:450px;
	border:solid 2px #311b1b;
}
b{
	font-size:50px;
}
#upper{
	font-size:20px;
}
#price{
	font-size:20px;
	color:#ed6853;
	margin-bottom:180px;
}
.btn{
	background-color:#311b1b;
	color:lightgoldenrodyellow;
	border-radius:20px;
	border:0;
	outline:0;
	padding:3%;
	font-size:120%;
	width:100%;
}
#specific{
	border: 2px solid #311b1b;
	background-color:lightgoldenrodyellow;
}
</style>
</head>
<body>

<jsp:include page="topp.jsp" flush="false"/><p>
<p></p>
<%	
		Cookie[] cookies=request.getCookies();
		String id="";
		
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("id")){
        		id=cookies[i].getValue();
			}
		}
		
%>
	
<form name="form" action="insertBought.jsp">
<table id="whole">
	<tr>
		<td>
			<div id="box" align="center">
				<%
					request.setCharacterEncoding("utf-8");
					
					String title=request.getParameter("title");
					
					//db연결
					Connection conn=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					
					try{
						conn=DBConnection.getCon();
						
						String sql="select title, writer, publisher, publish_date, genres.genre as genre, price, stock, translator from book, genres where book.genre=genres.genre_num AND title=?";
						
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1,title);
						rs=pstmt.executeQuery();
						%>
						<table width="80%" align="center" id="books">
							<%
								while(rs.next()){%>
									<tr>	
										<td align="center" width="50%">
											<img class="thumbnail" src="imgView.jsp?title=<%=title%>"><p>
										</td>
										<td width="50%" style="padding-left:20px;">
											<b><%=title%></b>
											<div id="upper"><%=rs.getString("writer") %></div>
											<div id="price"><%=rs.getString("price") %>원</div>
											구매 권 수 : <input type="number" name="num" style="width:100px;height:20px;font-size:20px;"><br><p>
											<input type="hidden" name="title" value="<%=title%>">
											<input type="hidden" name="price" value="<%=rs.getString("price") %>">
											<input type="hidden" name="stock" value="<%=rs.getString("stock") %>">
											<input type="hidden" name="seller" value="도란도란">
											<input type="hidden" name="book" value="책">
											<script>
												function check(){
													if(document.form.num.value==""){
														alert("구매하실 권 수 를 입력해주세요");
														document.form.num.focus();
														return;
													}
													if(document.form.num.value><%=Integer.parseInt(rs.getString("stock"))%>){
														alert("재고가 부족해 입력하신 권 수 만큼 구매하실 수 없습니다");
														document.form.num.focus();
														return;
													}
													if(document.form.num.value==0){
														alert("재고가 모두 소진되었습니다");
														document.form.num.focus();
														return;
													}
													alert("<%=title%>을 "+document.form.num.value+"권 주문하시겠습니까?");
													alert("주문이 완료되었습니다 :)");
													document.forms['form'].submit();
												}//function check()
											</script>
											<div align="center">
												<input type="button" id="enroll" class="btn" value="구매하기" onclick="check()">)
											</div>
										</td>
									</tr>
						</table>
						
						<!-- 상세정보 -->
						<table id="specific" width="50%" align="center">
							<tr id="specific">
								<td align="center" colspan=2><p style="font-size:30px;">상세정보</p></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">제목</td>
								<td width="50%"><%=title%></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">작가</td>
								<td width="50%"><%=rs.getString("writer") %></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">출판사</td>
								<td width="50%"><%=rs.getString("publisher") %></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">출판일</td>
								<td width="50%"><%=rs.getString("publish_date") %></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">장르</td>
								<td width="50%"><%=rs.getString("genre") %></td>
							</tr>
							<tr id="specific">
								<td width="50%" align="right" style="padding-right:20px;">옮긴이</td>
								<td width="50%"><%=rs.getString("translator") %></td>
							</tr>
							<tr id="specific">
								<td><br></td>
							</tr>
						</table>
						<%}//while %>
						
						<!-- 후기 -->
						<%
							sql="select * from comments where title=? order by num";
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1,title);
							rs=pstmt.executeQuery();%>
							
						<p></p>
						<table id="specific" width="50%" align="center" style="margin-bottom:20px">
							<tr id="specific">
								<td align="center" colspan=2><p style="font-size:30px;">후기</p></td>
							</tr>
						<%	while(rs.next()){
						%>	<tr>
								<td style="padding:10px;">
									<details style="border:2px solid #311b1b;border-radius:10px;">
										<summary style="background-color:#311b1b;padding:2%;color:lightgoldenrodyellow;"><%=rs.getString("ctitle") %></summary>
										<div style="padding:2%;">
											작성자 : <%=rs.getString("id") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<%=rs.getString("content") %>
										</div>
									</details>
								</td>
							</tr>	
						<%}//while%>
						</table>			
					<%}
					catch(SQLException e){
						e.printStackTrace();
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

</form>
	
</body>
</html>