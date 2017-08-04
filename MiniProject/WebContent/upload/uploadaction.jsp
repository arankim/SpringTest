<%@page import="db.dao.UploadDao"%>
<%@page import="db.dto.UploadDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	UploadDao db=new UploadDao();

	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/save");
	int uploadSize=1024*1024*2;

	try{
		multi=new MultipartRequest(request,realFolder,uploadSize,"UTF-8",new DefaultFileRenamePolicy());
		//데이터 읽기
		String subject=multi.getParameter("subject");
		String id=multi.getParameter("id");
		String content=multi.getParameter("content");
		String filename=multi.getFilesystemName("photo");

		UploadDto dto=new UploadDto();
		dto.setId(id);
		dto.setSubject(subject);
		dto.setFilename(filename);
		dto.setContent(content);

		db.insertUpload(dto);
		response.sendRedirect("../layoutsero.jsp?main=upload/uploadlist.jsp");
		
	} catch(Exception e){
		out.write("파일 업로드 오류 : " +e.getMessage()+"<hr>");
	}
	
%>
</body>
</html>