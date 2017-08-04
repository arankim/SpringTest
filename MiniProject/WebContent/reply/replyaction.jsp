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
String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id ="db" class="db.dao.ReplyDao" />
<jsp:useBean id = "dto" class="db.dto.ReplyDto" />
<jsp:setProperty property="*" name="dto"/>
<%
int n = db.insertReply(dto);
String path = "../layoutsero.jsp?main=reply/replycontent.jsp?num="+n+"&pageNum="+pageNum;
response.sendRedirect(path);
%>
</body>
</html>