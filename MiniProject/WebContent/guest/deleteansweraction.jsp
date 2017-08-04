<%@page import="db.dto.AnswerDto"%>
<%@page import="db.dao.AnswerDao"%>
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
int num = Integer.parseInt(request.getParameter("num"));
int currentPage  = Integer.parseInt(request.getParameter("pageNumber"));
boolean result;

AnswerDao dao = new AnswerDao();
AnswerDto dto = new AnswerDto();
	%>
	해당 방명록을 삭제하였습니다.
	<%
	dao.deleteAnswer(num);
	response.sendRedirect("../layoutsero.jsp?main=guest/guestlist.jsp?pageNum="+currentPage);
%>
</body>
</html>