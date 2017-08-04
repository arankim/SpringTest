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

table {
	border: 1px solid gray;
}

tr, td, th {
	font-size: 10pt;
	border: 1px solid gray;
}
</style>
</head>
<body>
	<b>총 ${count }개의 상품이 있습니다.</b>
	<hr>
	<a href="writeform.do">데이타 추가</a>
	<br>
	<table>
		<caption>Spirng JDBC 목록 출력</caption>
		<tr bgcolor="#ddd">
			<th width="50">번호</th>
			<th width="150">상품</th>
			<th width="80">수량</th>
			<th width="100">단가</th>
			<th width="100">편집</th>
		</tr>
		<c:forEach var="a" items="${list }" varStatus="i">
			<tr>
				<td align="center">${i.count }</td>
				<td>${a.sang }</td>
				<td align="right"><fmt:formatNumber value="${a.su }" pattern="#,##0"></fmt:formatNumber>
				</td>
				<td align="right"><fmt:formatNumber value="${a.dan }" type="currency"></fmt:formatNumber></td>
				<td align="center"><a href="updateform.do?num=${a.num }">수정</a> <a href="delete.do?num=${a.num }">삭제</a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>