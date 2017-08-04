<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}

table {
	width: 300px;
	border: 1px solid gray;
}

tr, td, th {
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<!-- JSTL에서 변수 선언 -->
	<c:set var="su1" value="7"></c:set>
	<c:set var="su2" value="3"></c:set>
	<!-- jstl에서의 연산자 연습 -->
	<table>
		<tr>
			<th>연산식</th>
			<th>결과값</th>
		</tr>
		<tr>
			<td>\${su1+su2}</td>
			<td>${su1+su2}</td>
		</tr>
		<tr>
			<td>\${su1/su2}</td>
			<td>${su1/su2}</td>
		</tr>
		<tr>
			<td>\${su1 div su2}</td>
			<td>${su1 div su2}</td>
		</tr>
		<tr>
			<td>\${su1/su2}</td>
			<td><fmt:formatNumber value = "${su1/su2}" pattern="0.0" /></td>
		</tr>
		<tr>
			<td>\${su1%su2}</td>
			<td>${su1%su2}</td>
		</tr>
		<tr>
			<td>\${su1modsu2}</td>
			<td>${su1 mod su2}</td>
		</tr>
		<c:set var = "str1" value="Happy"></c:set>
		<c:set var = "str2" value=""></c:set>
		<tr>
			<td>\${str1}</td>
			<td>${str1}</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>\${empty str2}</td>
			<td>
			<c:if test="${empty str2}">str2안에 값이 없음</c:if>
			</td>
		</tr>
		<c:set var="date" value="<%=new Date()%>"/>
	<tr>
		<td>\${date}</td>
		<td>${date}</td>
	</tr>
	<tr>
		<td>\${date}</td>
		<td>
			<fmt:formatDate value="${date}"
			  pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	</table>
</body>
</html>