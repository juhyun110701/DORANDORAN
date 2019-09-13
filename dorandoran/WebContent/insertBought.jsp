<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>

<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@ page import="java.util.*, java.text.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란 : 구매한 책</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="top.jsp" flush="false"/><p>
<%	
	Cookie[] cookies=request.getCookies();
	String buyer="";
		
	for(int i=0; i<cookies.length; i++){
		if(cookies[i].getName().equals("id")){
        	buyer=cookies[i].getValue();
		}
	}
		
	request.setCharacterEncoding("utf-8");
	
	int price=Integer.parseInt(request.getParameter("price"));
	int stock=Integer.parseInt(request.getParameter("stock"));
	String title=request.getParameter("title");
	int num=Integer.parseInt(request.getParameter("num"));
	System.out.println("int num : "+num);
	price=price*num;
	System.out.println("price : "+price);
	
	
	//db연결
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	int n=0;
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String today = formatter.format(new java.util.Date());
	System.out.println(today);
	String seller="도란도란";
	System.out.println("buyer : "+buyer);
	
	try{
		conn=DBConnection.getCon();
		
		String sql="insert into bought(num, title, seller, buyer, price, bought_date) values(BOUGHT_SEQ.nextval, ?,?,?,?,TO_DATE(?,'YYYY-MM-DD HH24:MI:SS'))";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,title);
		pstmt.setString(2,seller);
		pstmt.setString(3,buyer);
		pstmt.setInt(4,price);
		pstmt.setString(5,today);
		
		n=pstmt.executeUpdate();
		
		//해당 책 재고수량 update
		sql="update book set stock=MINUSSTOCK(?,?) where title=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,stock);
		pstmt.setInt(2,num);
		pstmt.setString(3,title);
	}
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
<meta http-equiv="refresh" content="0;url='boughtBook.jsp'">
</body>
</html>