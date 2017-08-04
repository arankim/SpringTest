<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="db.dao.GuestDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}

.imgborder{
border : 2px solid red;
}

td img{
cursor: pointer;
}
</style>
<script type="text/javascript">
function imgClick(obj){
	$("td img").removeClass("imgborder");
	var num = $("td img").eq(obj-1).attr("value")
	$("#avata").val(num);
	$("td img").eq(obj-1).addClass('imgborder');
}
$(function(){
	 var avata = $("#avata").val();
	//인덱스는 0부터이므로 idx-1번째에 클ㅋ래스 추가함
	$("td img").eq(avata-1).addClass('imgborder');
});
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("idok");
		String loginok = (String) session.getAttribute("loginok");
		if (loginok == null) {
			id = "guest";
		}

		GuestDao dao = new GuestDao();
		String name = dao.getNames(id);

		if (loginok == null) {
			name = "";
		}
	%>
	<div style="margin-left: 70px;">
		<form action="guest/guestaction.jsp" method="post" name ="frm" id ="frm">
			<fieldset style="width: 300px;">
				<legend>방명록</legend>
			</fieldset>
			<table class="table table-bordered" style="width: 400px;">
				<tr>
					<th width="100" bgcolor="#ffe4c4">이름</th>
					<td width="300"><input type="text" name="name" style="width: 110px;"
						value="<%=name%>" class="form-control" <%=loginok != null ? "readonly" : ""%>></td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4c4">아이디</th>
					<td width="300"><input type="text" name="id" style="width: 110px;"
						value="<%=id%>" class="form-control" readonly="readonly"></td>
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
						%> 
						<br>
						<%
								}
						%>
						<img src="image4/C<%=i %>.png" style="width:50px;" value="<%=i %>" onclick="imgClick(<%=i %>)">
						<%
							}
						%>
						<input type="text" name="avata" id="avata" value="8">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="방명록 저장" class="btn btn-danger btm-sm" style="width:100px;">
					<input type="button" value="방명록 보기" class="btn btn-info btn-sm" style="width:100px;" onclick="location.href='layoutsero.jsp?main=guest/guestlist.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>