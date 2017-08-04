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
int num = Integer.parseInt(request.getParameter("num"));
int currentPage = Integer.parseInt(request.getParameter("pageNumber"));

%>
<div style="margin-left:200px;">
<form action="guest/deletepassaction.jsp" method="post">
<fieldset>
<legend></legend>
</fieldset>
<table class="tabe table-bordered" style="width:300px;">
<tr>
<th width="120" bgcolor="#ffdab9">비밀번호</th>
<td>
<input type="password" name="pass" class="form-control" style="width:130px;">
</td>
</tr>
<tr bgcolor="#ffdab9">
<td colspan="2" align="center">
<input type="submit" value="삭제">
<input type="hidden" name="pageNumber" value="<%=currentPage%>">
<input type="hidden" name="num" value="<%=num %>">
</td>
</tr> 
</table>
</form>
</div>
</body>
</html>