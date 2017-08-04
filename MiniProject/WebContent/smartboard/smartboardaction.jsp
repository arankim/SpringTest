<%@page import="db.dao.SmartDao"%>
<%@page import="db.dto.SmartDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
<%
	SmartDao db=new SmartDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/save");
	int uploadSize=1024*1024*2;
	
	try{
		multi=new MultipartRequest(request,realFolder,
				uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String subject=multi.getParameter("subject");
		String name=multi.getParameter("name");
		String content=multi.getParameter("content");
		
		SmartDto dto=new SmartDto();
		dto.setContent(content);
		dto.setName(name);
		dto.setSubject(subject);
		
		db.insertSmartData(dto);
		
		String path="../layoutsero.jsp?main=smartboard/smartpagelist.jsp";
		response.sendRedirect(path);
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>

</body>
</html>