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
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
%>
<jsp:useBean id="adb" class="db.dao.AnswerDao"></jsp:useBean>
<jsp:useBean id="adto" class="db.dto.AnswerDto"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<%
adb.insertAnswer(adto);
String path = "../layoutsero.jsp?main=guest/guestlist.jsp?pageNum="+pageNum;
response.sendRedirect(path);
%>
</body>
</html>