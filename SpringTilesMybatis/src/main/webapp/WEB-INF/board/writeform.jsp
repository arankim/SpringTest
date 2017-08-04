<%@page import="spring.dto.ReplyDto"%>
<%@page import="spring.dao.ReplyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
	<div style="margin-left: 0px;">
		<fieldset style="width: 800px;">
			<legend>답변형 게시판 입력폼</legend>
			<form action="writeproc.do" method="post">
				<table class="table table-bordered">
					<tr>
						<th width="100" bgcolor="#ddd">작성자</th>
						<td><input type="text" class="form-control" style="width: 120px;"
							required="required" name="writer" placeholder="작성자"></td>
					</tr>
					<tr>
						<th width="100" bgcolor="#ddd">제 목</th>
						<td><input type="text" class="form-control" style="width: 300px;"
							required="required" name="subject" placeholder="제목" value="${subject }" ></td> <!-- 답글인 경우에만 값이 들어감. -->
					</tr>

					<tr>
						<th width="100" bgcolor="#ddd">상품설명</th>
						<td><textarea class="form-control" style="width: 100%; height: 300px;"
								name="content" id="content"></textarea>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="hidden" name="num" value="${num }">
						<input type="hidden" name="pageNum" value="${pageNum }">
						<input type="submit" value="등록"
							class="btn btn-info btn-sm" style="width: 100px;"></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>