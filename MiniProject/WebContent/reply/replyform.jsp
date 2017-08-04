<%@page import="db.dto.ReplyDto"%>
<%@page import="db.dao.ReplyDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%
int num = 0;
if(request.getParameter("num") != null){
	num = Integer.parseInt(request.getParameter("num"));
}
String pageNum = "1";

if(request.getParameter("pageNum") != null){
	pageNum = request.getParameter("pageNum");
}
	ReplyDao db = new ReplyDao();
	ReplyDto dto = db.getData(num);
	int ref = 0, re_step = 0, re_level = 0;
	String subject = "";
	if(num!=0) { //답글인 경우
		dto = db.getData(num);
		ref = dto.getRef();
		re_step = dto.getRe_step();
		re_level = dto.getRe_level();
		subject = dto.getSubject();
		}
%>
<body>
	<div style="margin-left: 0px;">
		<fieldset style="width: 800px;">
			<legend>답변형 게시판 입력폼</legend>
			<form action="reply/replyaction.jsp" method="post">
				<table class="table table-bordered">
					<tr>
						<th width="100" bgcolor="#ddd">작성자</th>
						<td><input type="text" class="form-control" style="width: 120px;"
							required="required" name="writer" placeholder="작성자"></td>
					</tr>
					<tr>
						<th width="100" bgcolor="#ddd">제 목</th>
						<td><input type="text" class="form-control" style="width: 300px;"
							required="required" name="subject" placeholder="제목" value="<%=subject %>"></td> <!-- 답글인 경우에만 값이 들어감. -->
					</tr>

					<tr>
						<th width="100" bgcolor="#ddd">상품설명</th>
						<td><textarea class="form-control" style="width: 100%; height: 300px;"
								name="content" id="content"></textarea>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="hidden" name="num" value="<%=num %>">
						<input type="hidden" name="pageNum" value="<%=pageNum %>">
						<input type="hidden" name="ref" value="<%=ref %>">
						<input type="hidden" name="re_step" value="<%=re_step %>">
						<input type="hidden" name="re_level" value="<%=re_level %>">
						<input type="submit" value="등록"
							class="btn btn-info btn-sm" style="width: 100px;"></td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</body>
</html>
