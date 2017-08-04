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
</style>
</head>
<body>
	<h3>1-10 까지 출력</h3>
	<c:forEach var="a" begin="1" end="10" step="1">
${a}&nbsp;
</c:forEach>
	<br>
	<h3>1-100까지 10단위로 출력</h3>
	<c:forEach var="a" begin="1" end="100" step="10">
${a}&nbsp;
</c:forEach>
	<br><br>
	<%
		String[] str1 = { "red", "green", "blue", "magenta", "gray", "orange" };
	%>
	<c:set var="s1" value="<%=str1%>" />
	<table style="width: 200px;">
		<tr>
			<th>번호</th>
			<th>적용값</th>
		</tr>
		<c:forEach var="a" items="${s1 }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td style="background-color: ${a};">${a }</td>
			</tr>
		</c:forEach>
	</table>
	<br><br>
	<table style="width: 200px;">
		<tr>
			<th>번호</th>
			<th>적용값</th>
		</tr>
		<c:forEach var="a" items="${s1 }" begin="2" end="4" varStatus="i">
			<tr>
				<td>${i.index }</td>
				<td style="background-color: ${a};">${a }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>