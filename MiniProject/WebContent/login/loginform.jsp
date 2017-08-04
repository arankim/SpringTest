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
	//세션으로부터 아이디와 체크된 저장값을 얻는다
	String id = (String) session.getAttribute("idok");
	//yes 면 체크, no면 체크 안한경우
	String saveok = (String) session.getAttribute("saveok");
	//no 인경우 id도 지워준다
	if (saveok == null || saveok.equals("no"))
		id = "";
%>
<body>
	<div style="margin-left: 40px;">
		<form action="login/loginaction.jsp" method="post">
			<fieldset style="width: 300px;">
				<legend>로그인</legend>
				<table class="table table-bordered">
					<tr>
						<th width="100" bgcolor="#b0e0e6">아이디</th>
						<td width="250">
							<div class="form-inline">
								<input type="text" name="id" value="<%=id%>" class="form-control"
									required="required" style="width: 100px;" placeholder="아이디"> <input
									type="checkbox" name="idsave" value="yes" class="form-control"
									<%=saveok != null && saveok.equals("yes") ? "checked" : ""%>> 아이디저장

							</div>
						</td>
					</tr>
					<tr>
						<th width="100" bgcolor="#b0e0e6">비밀번호</th>
						<td width="250"><input type="password" name="pass" class="form-control"
							required="required" style="width: 120px;" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2" align="center" bgcolor="#c0c0c0"><input type="submit"
							value="로그인" class="btn btn-danger btn-sm" style="width: 100px;"> <input
							type="button" value="회원가입" class="btn btn-primary btn-sm" style="width: 100px;"
							onclick="location.href='layoutsero.jsp?main=member/memberform.jsp'"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
</body>
</html>