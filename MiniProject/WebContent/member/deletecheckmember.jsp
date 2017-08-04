<%@page import="org.apache.tomcat.jni.Mmap"%>
<%@page import="db.dao.MemberDao"%>
<%@page import="java.util.StringTokenizer"%>
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
MemberDao dao = new MemberDao();
String nums = request.getParameter("nums");

StringTokenizer st = new StringTokenizer(nums,",");
while(st.hasMoreElements()){
	String n = st.nextToken();
	dao.deleteMember(n);
}

response.sendRedirect("../layoutsero.jsp?main=member/memberlist.jsp");
%>
</body>
</html>