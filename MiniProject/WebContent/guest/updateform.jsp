<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="db.dao.GuestDao,db.dto.GuestDto"%>
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

.imgborder {
	border: 2px solid red;
}

td img {
	cursor: pointer;
}
</style>
</head>
<body>
	<script type="text/javascript">
function imgClick(obj){
	$("td img").removeClass("imgborder");
	var num = $("td img").eq(obj-1).attr("value")
	$("#avata").val(num);
	$("td img").eq(obj-1).addClass('imgborder');
}
$(function(){
	 var avata = $("#avata").val();
	$("td img").eq(avata-1).addClass('imgborder');
});
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
		GuestDao dao = new GuestDao();
		GuestDto dto = dao.getData(num);
		int currentPage = Integer.parseInt(request.getParameter("pageNumber"));
	%>
	<div style="margin-left: 70px;">
		<form action="guest/updateaction.jsp" method="post">
			<fieldset style="width: 300px;">
				<legend>방명록</legend>
			</fieldset>
			<table class="table table-bordered" style="width: 400px;">
				<tr>
					<th width="100" bgcolor="#ffe4c4">이름</th>
					<td width="300"><input type="text" name="name" style="width: 110px;"
						value="<%=dto.getName()%>" class="form-control" readonly="readonly"></td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4c4">아이디</th>
					<td width="300"><input type="text" name="id" style="width: 110px;"
						value="<%=dto.getId()%>" class="form-control" readonly="readonly"></td>
				</tr>
				<tr height="150">
					<th width="100" bgcolor="#ffe4c4">내 용</th>
					<td width="300"><textarea rows="5" cols="35" class="form-control" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4c4">비밀번호</th>
					<td width="300"><input type="password" name="pass" class="form-control"
						style="width: 100px;"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<%
							for (int i = 1; i <= 8; i++) {
								if (i == 5) {
						%> <br> <%
								}
						%> <img src="image4/C<%=i %>.png" style="width: 50px;" value="<%=i %>"
						onclick="imgClick(<%=i %>)"> <%
							}
						%> <input type="hidden" name="avata" id="avata" value="<%=dto.getAvata()%>">
						<input type="hidden" name="writeday" value="<%=dto.getWriteday() %>"> <input
						type="hidden" name="num" value="<%=dto.getNum() %>"> <input type="hidden"
						name="pageNum" value="<%=currentPage %>">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="방명록 수정"
						class="btn btn-danger btm-sm" style="width: 100px;"> <input type="button"
						value="방명록 보기" class="btn btn-info btn-sm" style="width: 100px;"
						onclick="location.href='layoutsero.jsp?main=guest/guestlist.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>