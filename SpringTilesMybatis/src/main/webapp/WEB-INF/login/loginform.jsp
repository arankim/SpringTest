<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	table{
		border: 2px groove gray;
	}
	tr,th,td{
		font-size: 10pt;
		border-bottom: 1px solid gray;
		border-right: 1px dotted green;
	}
	a:LINK {
		text-decoration: none;
		font-size: 10pt;
		color: black;
	}
	a:HOVER {
		text-decoration: underline;
		color: red;
	} 
</style>
</head>

<body>
<div style="margin-left: 40px;">
<form action="loginaction.do" method="post">
	 <fieldset style="width: 360px;">
	 	<legend>로그인</legend>
	 	<table  class="table table-bordered">
	 		<tr>
	 			<th width="100" bgcolor="#b0e0e6">아이디</th>
	 			<td width="250">
	 				<div class="form-inline">
	 				<input type="text" name="id" value="${id }" class="form-control" required="required" style="width: 120px;" placeholder="아이디">
	 				&nbsp;&nbsp;
	 				<input type="checkbox" name="idsave" value="yes" class="form-control">
	 				  
	 				  아이디저장
	 				</div>
	 			</td>
	 		</tr>
	 		<tr>
	 			<th width="100" bgcolor="#b0e0e6">비밀번호</th>
	 			<td width="250">
	 				<input type="password" name="pass" 
	 				class="form-control" required="required"
	 				style="width: 120px;" placeholder="비밀번호">
	 				
	 			</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center" bgcolor="#ddd">
	 				<input type="submit" value="로그인"
	 				  class="btn btn-danger btn-sm"
	 				   style="width: 100px;">
	 				 
	 				<input type="button" value="회원가입"
	 				  class="btn btn-primary btn-sm"
	 				   style="width: 100px;"
	 				   onclick="location.href='../member/memberform.do'">   
	 			</td>
	 		</tr>
	 	</table>
	 </fieldset>
</form>
</div>
</body>
</html>






