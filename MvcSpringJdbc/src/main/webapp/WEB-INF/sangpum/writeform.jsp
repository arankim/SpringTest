<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"
	type="text/javascript"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
	<form action="writeproc.do" method="post">
		<table>
			<caption>삳품 입력</caption>
			<tr>
				<th width="100">상품명</th>
				<td width="200"><input type="text" name="sang" size="20"></td>
			</tr>
			<tr>
				<th width="100">수량</th>
				<td width="200"><input type="text" name="su" size="7"></td>
			</tr>
			<tr>
				<th width="100">단가</th>
				<th width="200"><input type="text" name="dan" size="7"></th>
			</tr>
			<tr>
			<td colspan="2" align="center" bgcolor="#ddd">
			<input type="submit" value="db저장"></td>
		</table>
	</form>
</body>
</html>