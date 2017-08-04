<%@page import="java.io.File"%>
<%@page import="db.dao.UploadDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script ssrc="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");

UploadDao dao = new UploadDao();
String realFolder = getServletContext().getRealPath("/save");
String fileName = dao.getData(num).getFilename();

File file = new File(realFolder+"\\"+fileName);
if(file.exists()){
	file.delete();
	dao.deleteSangpum(num);
	
	//보던페이지로 이동
	String path = "../layoutsero.jsp?main=upload/uploadlist.jsp";
	response.sendRedirect(path);
}
%>
</body>
</html>