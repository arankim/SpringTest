<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Time"%>
<%@page import="db.dto.GuestDto"%>
<%@page import="db.dao.GuestDao"%>
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
boolean result;
GuestDao dao = new GuestDao();

String pass = request.getParameter("pass");
int num = Integer.parseInt(request.getParameter("num"));
String content = request.getParameter("content");
int avata = Integer.parseInt(request.getParameter("avata"));
Timestamp writeday = Timestamp.valueOf(request.getParameter("writeday"));
String name = request.getParameter("name");
String id = request.getParameter("id");
int currentPage = Integer.parseInt(request.getParameter("pageNum"));

GuestDto dto = new GuestDto(num,name,id,pass,content,writeday,avata);
result = dao.isEqualPassGuest(num, pass);
if(result){
	%>
	해당 방명록을 수정하였습니다.
	<%
	dao.updateGuest(dto);
	response.sendRedirect("../layoutsero.jsp?main=guest/guestlist.jsp?pageNum="+currentPage);
} else {
	%>
<script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.")
history.back(-1);
</script>
<%
}
%>
</body>
</html>