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
<script type="text/javascript">
$(function(){
	$("#hp2").keyup(function(){
		if($(this).val().length==4)
			$("#hp3").focus();
	});
	
	$("#selemail").change(function(){
		if($(this).val()=='-'){
			$("#email2").val('');
			$("#email2").focus();
		}else{
			$("#email2").val($(this).val());
		}			
	});
});
</script>
</head>
<body>
	<div class="form-inline"></div>

	<form action="memprocess.do" method="post" name="frm" onsubmit="return check()">
		<div class="form-inline">
			<table class="table table-bordered">
				<tr>
					<th width="100" bgcolor="#ffe4e1">회원명</th>
					<td><input type="text" name="name" size="10" placeholder="이름입력"
						required="required" class="form-control" style="width: 130px;"></td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">아이디</th>
					<td>
						<div class="form-inline">
							<input type="text" name="id" size="10" placeholder="아이디" required="required"
								readonly="readonly" class="form-control"> &nbsp;&nbsp; <input
								type="button" class="btn btn-info btn-sm" value="아이디 입력"
								onclick="return idwinopen()">
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">비밀번호</th>
					<td>
						<div class="form-inline">
							<input type="password" name="password" size="10" placeholder="비밀번호"
								required="required" class="form-control" id="pass"> &nbsp;&nbsp;<b>한번더</b>
							<input type="password" name="password2" size="10" placeholder="비밀번호"
								required="required" class="form-control" id="pass2" onchange="return check()">
							<b style="color: blue;" id="pass_msg"></b>
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">주 소</th>
					<td>
						<div class="form-inline">
							<input type="text" name="address" size="50" placeholder="주소" readonly="readonly"
								class="form-control"> <input type="button" value="주소입력"
								class="btn btn-danger btn-sm" onclick="postwinopen()">
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">핸드폰</th>
					<td>
						<div class="form-inline">
							<select name="hp1" class="form-control">
							<c:forTokens items="${hp}" delims="," var="h">
							<option value="${h }" >${h }</option>
							</c:forTokens>
							</select> 
							<b>-</b> <input type="text" class="form-control" style="width: 70px;" id="hp2"
								name="hp2"> <b>-</b> <input type="text" class="form-control"
								style="width: 70px;" id="hp3" name="hp3">
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">이메일</th>
					<td>
						<div class="form-inline">
							<input type="text" class="form-control" name="email1" style="width: 100px;"
								id="email1"> <b>@</b> <input type="text" class="form-contorl"
								name="email2" id="email2" style="width: 130px;"> <select id="selemail"
								class="form-control">
								<option value="-">직접입력</option>
								<option value="naver.com">네이버</option>
								<option value="nate.com">네이트</option>
								<option value="gmail.com">구글</option>
								<option value="daum.net">다음</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th width="100" bgcolor="#ffe4e1">생년월일</th>
					<td>
						<div class="form-inline">
							<select name="year" class="form-control">
								<c:forEach var="y" begin="1950" end="${year }">
									<option value="${y }">${y }</option>
								</c:forEach>
							</select> <b>년</b>&nbsp; <select name="month" class="form-control">
								<c:forEach var="m" begin="1" end="12">
									<option value="${m }" ${month==m?"selected":""}>${m }</option>
								</c:forEach>
							</select>
							<b>월</b>&nbsp;
							<select name="day" class="form-control">
							<c:forEach var="d" begin="1" end="31">
							<option value="${d }" ${day==d?"selected":"" }>${d }</option>
							</c:forEach>
							</select>
							<b>일생</b>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" class="btn btn-danger"
						style="width: 100px;" value="회원가입"> <input type="button"
						class="btn btn-info" style="width: 100px;" value="로그인"
						onclick="location.href='layoutsero.jsp?main=login/loginform.jsp'">
			</table>
		</div>
	</form>
</body>
</html>