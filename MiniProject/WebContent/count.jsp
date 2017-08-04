<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.oracle.CountDB" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
<%
CountDB db = new CountDB();
DecimalFormat nf = new DecimalFormat("0000000");

//double count = db.getCount();
String cnt = nf.format(db.getCount());
for(int i = 0; i<cnt.length(); i++){
%>	
 <img src="number/<%=cnt.substring(i, i+1) %>.gif" width="20px;" height="20px;"> 
<%
}
%>

</body>
</html>