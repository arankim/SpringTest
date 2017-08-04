<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dao.MemberDao,db.dto.MemberDto,java.util.Vector"%>
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

div.admin {
	position: absolute;
	left: 100px;
	top: 50px;
	width: 600px;
	height: 250px;
	font-size: 13pt;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function checkClick() {
		if ($(".del:checked").length == 0){
			alert("먼저 삭제할 회원을 선택해주세요.");
		} else {
			var num = "";
			for(var i = 0; i<del.length; i++){
				if(del[i].checked){
					nums += $(".del").eq(i).attr("num")+",";
				}
			}
			nums = nums.substring(0, nums.length-1);
			alert(nums);
			location.href="'member/deletecheckmember.jsp?nums="+nums
		}
	}
</script>
</head>
<body>
	<%
		String loginid = (String) session.getAttribute("idok");
		String loginok = (String) session.getAttribute("loginok");

		MemberDao dao = new MemberDao();
		Vector<MemberDto> list = dao.getAllList();
		MemberDto dto = new MemberDto();

		if (loginok == null || !loginid.equals("admin")) { // 로그인을 안하고 리스트를 보려고 하거나, admin계정이 아닌 일반 계정으로 리스트를 보려고 하는 경우다!
	%>
	<div class="admin">전체 명단은 관리자만 확인이 가능합니다. 먼저 관리자만 로그인을 해주세요.</div>
	<%
		} else {
	%>
	<fieldset>
		<legend>
			전체 회원 명단(총
			<%=list.size()%>명)
		</legend>
		<table>
			<tr>
				<th width="10"></th>
				<th width="100">아이디</th>
				<th width="100">회원명</th>
				<th width="150">핸드폰</th>
				<th width="150">생년월일</th>
				<th width="100">이메일</th>
				<th width="300">주 소</th>
				<th width="130">가입일</th>
				<th width="100">편집</th>
			</tr>
			<%
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
					for (int i = 0; i < list.size(); i++) {
						dto = list.get(i);
			%>
			<tr>
				<td><input type="checkbox" class="del" num="<%=dto.getNum()%>" name="check[]"></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getHp()%></td>
				<td><%=dto.getBirth()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getAddress()%></td>
				<td><%=sf.format(dto.getGaipday())%></td>
				<td><input type="button" value="수정" class="btn btn-info btn xs" onclick="location.href=''"> 
					  <input type="button" value="삭제" class="btn btn-success btn-xs" onclick="location.href='member/deletemember.jsp?num=<%=dto.getNum()%>'">
				</td>
				<%
					}
				%>
			</tr>
			<tr>
				<td align="center">
				<input type="button" value="선택한 회원 삭제" class="btn btn-warning btn xs" onclick="checkClick()"></td>
			</tr>
		</table>
	</fieldset>
	<%
}
%>
</body>
</html>