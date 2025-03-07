<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ page import="doran.db.connection.DBConnection" %>
<%@ page import="java.io.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.driver.*" %>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	

	String uploadPath=request.getRealPath("/uploadFile");
	out.println("절대 경로 : "+uploadPath+"<br>");
	
	int maxSize=1024*1024*10;
	
	String title="", writer="", publisher="", publish_date="";
	String stock="", price="", genre="", translator="";
	
	String fileName1="";//중복처리된 이름
	String originalName1="";//중복 처리 전 실제 원본 이름
	long fileSize=0;//파일 사이즈
	String fileType="";//파일 타입
	int n=5;
	
	File file=null;
	
	try{
		MultipartRequest multi=new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		title=multi.getParameter("title");
		writer=multi.getParameter("writer");
		publisher=multi.getParameter("publisher");
		publish_date=multi.getParameter("publish_date");
		genre=multi.getParameter("genre");
		translator=multi.getParameter("translator");
		stock=multi.getParameter("stock");
		price=multi.getParameter("price");
		out.println(stock);
		out.println(title);
		
		file=multi.getFile("file");
		
		Connection conn=DBConnection.getCon();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer("insert into book(title, writer, publisher, publish_date, stock, price, genre, translator, image) values(?,?,?,?,?,?,?,?,?)");
		byte[] buf=FileUtils.readFileToByteArray(file);
		pstmt = conn.prepareStatement(sql.toString());
		
		pstmt.setString(1,title);
		pstmt.setString(2, writer);
		pstmt.setString(3, publisher);
		pstmt.setString(4, publish_date);
		pstmt.setString(5, stock);
		pstmt.setString(6, price);
		pstmt.setString(7, genre);
		pstmt.setString(8, translator);
		pstmt.setBytes(9, buf);
		pstmt.addBatch();
		pstmt.clearParameters();
		pstmt.executeBatch();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	var title="<%=title%>";
	if(<%=n%>>0){
		alert("책 \'"+title+"\'이 등록되었습니다 :)");
		location.href="indexx.jsp";
	}
	else{
		alert("책 등록에 실패하였습니다 :(");
		history.go(-1);
	}
</script>
</body>
</html>