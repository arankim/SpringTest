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
	<table class="table table-striped">
		<caption>
			<b>댓글 출력(${acount }개)</b>
		</caption>
		<c:forEach var="a" items="${alist }">
			<tr>
				<td><b>${a.nickname }</b>&nbsp; ${a.content }&nbsp; <span
					style="color: gray; font-size: 8pt;"><fmt:formatDate value="${a.writeday }"
							pattern="yyyy-MM-dd HH:mm" /></span></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>