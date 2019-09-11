<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
 request.setCharacterEncoding("euc-kr");
 String title="";
 String filename1 = "";
 String newFileName="";
 String fullpath="";
 String newFullpath="";
 int maxSize = 1024*1024*5;
 String encType = "utf-8";
 String savefile = "/WEB-INF/img";
 ServletContext scontext = getServletContext();
 String realFolder = scontext.getRealPath();
 
 String dirPath=application.getRealPath("/WEB-INF");
	out.println(dirPath);
 
 try{
  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  title=multi.getParameter("title");
  
  Enumeration<?> files = multi.getFileNames();
     String file1 = (String)files.nextElement();
     
     filename1 = multi.getFilesystemName(file1);
     System.out.println("filename1 첫번째 : "+filename1);
     
     if(filename1.toLowerCase().indexOf(".jpg")>0){
         newFileName = title+".jpg";
     }else if(filename1.toLowerCase().indexOf(".bmp")>0){
         newFileName = title+".bmp";
     }else if(filename1.toLowerCase().indexOf(".png")>0){
         newFileName = title+".png";
     }else if(filename1.toLowerCase().indexOf(".gif")>0){
         newFileName = title+".gif";
     }else{//확장자가 벗어나면 파일명 그대로 셋팅
         newFileName = filename1;
     }
     
     fullpath = realFolder + "\\" + filename1;
     newFullpath = realFolder + "\\" + newFileName;
     
     if(filename1!=null){
    	 File upFile=new File(fullpath);
    	 File newUpFile=new File(newFullpath);
    	 
    	 if(upFile.renameTo(newUpFile)){
    		 System.out.println("이름변경성공");
    	 }
    	 newFileName=newUpFile.getName();
     }
     
     //filename1=newFileName;
     System.out.println("filename1 두번째 : "+filename1);
     
     System.out.println("file1 : "+file1);
     System.out.println("newFileName : "+newFileName);
     
     
     
 } catch(Exception e) {
  e.printStackTrace();
 }
 
 
 System.out.println("title : "+title);
 System.out.println("realFolder : "+realFolder);
 System.out.println("filename1 : "+filename1);
 System.out.println("savefile : "+savefile);
 System.out.println("fullpath : "+fullpath);
 System.out.println("newFullpath : "+newFullpath);
%>

<img src="<%=newFullpath%>" width=512 height=384></img> 

</body>
</html>