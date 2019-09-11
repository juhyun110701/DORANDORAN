<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>

<%@page import="org.apache.commons.io.output.ByteArrayOutputStream"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="oracle.sql.BLOB" %>
<%@page import="java.io.BufferedOutputStream" %>
<%@page import="oracle.jdbc.OracleResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>도란도란</title>
<link rel="stylesheet" href="css/index.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
</head>
<body>
<%
	String title=request.getParameter("title");

	Connection conn=null;
	StringBuffer sqlText=new StringBuffer();
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	BLOB image=null;
	
	try{
		conn=DBConnection.getCon();
		
		sqlText.append("select image from book where title=?");
		
		pstmt=conn.prepareStatement(sqlText.toString());
		pstmt.setString(1, title);
		
		rs=pstmt.executeQuery();
		
		rs.next();
		image=((OracleResultSet)rs).getBLOB("image");
		
		if(image!=null){
			InputStream in=image.getBinaryStream();
			int length=(int)image.length();
			int bufferSize=image.getChunkSize();
			
			byte[] buffer=new byte[bufferSize];
			out.clear();
			out=pageContext.pushBody();
			BufferedOutputStream fout=new BufferedOutputStream(response.getOutputStream());
			while((length=in.read(buffer))!=-1){
				fout.write(buffer);
			}
			in.close();
			fout.flush();
			fout.close();
		}
	}catch(SQLException e){
		e.getMessage();
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	}
%>
</body>
</html>