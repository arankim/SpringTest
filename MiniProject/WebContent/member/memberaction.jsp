<%@page import="db.dao.MemberDao"%>
<%@page import="db.dto.MemberDto"%>
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
request.setCharacterEncoding("UTF-8");
MemberDao dao = new MemberDao();
String id = request.getParameter("id");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String address = request.getParameter("selectResult")+" "+request.getParameter("writeResult");
String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String birth = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
MemberDto dto = new MemberDto(name,id,pass,address,email,hp,birth);
dao.insertMember(dto);

%>
가입입니다.
</body>
</html>