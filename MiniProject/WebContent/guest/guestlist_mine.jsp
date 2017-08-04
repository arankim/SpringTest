<%@page import="db.dto.AnswerDto"%>
<%@page import="db.dao.AnswerDao"%>
<%@page import="db.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dao.GuestDao,java.util.Vector,db.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="60;layoutsero.jsp?main=guest/guestlist.jsp">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
<script type="text/javascript">

	$(function() {
		//댓글목록이랑 댓글폼은 안보이도록 설정
		$("td answerlist").hide();
		$("td answer a").click(function() {
			$(this).parent().next().toggle();
		});
	});
</script>
</head>
<body>
	<div style="margin-left: 150px;">
		<a href="layoutsero.jsp?main=guest/guestform.jsp"> <img src="image/btn13.gif"
			title="방명록쓰기">
		</a>
	</div>
	<%
		//세션으로부터 로그인 정보를 구한다.
		String loginok = (String) session.getAttribute("loginok");
		String id = (String) session.getAttribute("idok");

		//회원명은 회원정보로부터 얻는다.
		MemberDao mdb = new MemberDao();
		String name = mdb.getName(id);

		GuestDao dao = new GuestDao();
		int totalCount = dao.getTotalCount();

		//페이징 처리에 필요한 변수들
		int perPage = 2;
		int perBlock = 5;
		int currentPage;
		int totalPage;
		int startNum;
		int endNum;
		int startPage;
		int endPage;
		int no;

		if (request.getParameter("pageNum") != null) {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
		} else {
			currentPage = 1;
		}

		//각 페이지에 보여질 시작번호와 끝번호 구하기
		totalPage = (totalCount / perPage) + (totalCount % perPage > 0 ? 1 : 0);

		//각 페이지에 보여질 시작번호와 끝번호 구하기
		startNum = (currentPage - 1) * perPage + 1;
		endNum = startNum + perPage - 1;

		//예를 들어 모두 45개의 글이 있을 경우
		//마지막 페이지는 endnum이 45가 되야함.
		if (endNum > totalCount)
			endNum = totalCount;

		//각 블럭에 보여질 시작페이지번호와 끝페이지 번호 구하기.
		startPage = (currentPage - 1) / perBlock * perBlock + 1;
		endPage = startPage + perBlock - 1;

		if (endPage > totalPage)
			endPage = totalPage;

		no = totalCount - ((currentPage - 1) * perPage);

		//페이지에서 필요한 만큼만 게시글 가졍기.
		Vector<GuestDto> list = dao.getList(startNum, endNum);
		if (totalCount == 0) {
	%>
	등록된 방명록이 없습니다.
	<%
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for (GuestDto dto : list) {
	%>
	<table class="table .table-striped">
		<tr>
			<td width="250"><b><%=dto.getName()%>(<%=dto.getId()%>)</b></td>
			<td align="right"><%=sdf.format(dto.getWriteday())%></td>
		</tr>
		<tr height="80">
			<td colspan="2"><img src="image4/C<%=dto.getAvata()%>.png" align="left"
				hspace="10" width="70"> <pre><%=dto.getContent()%></pre></td>
		</tr>
		<tr>
			<td><input type="button" value="수정"
				onclick="location.href='layoutsero.jsp?main=guest/updateform.jsp?num=<%=dto.getNum()%>&pageNumber=<%=currentPage%>'">
				<input type="button" value="삭제"
				onclick="location.href='layoutsero.jsp?main=guest/deletepassform.jsp?num=<%=dto.getNum()%>&pageNumber=<%=currentPage%>'"></td>
		</tr>
		<tr>
			<td colspan="2"><answer> 
			<%
         	//댓글 가져오기
 			AnswerDao adao = new AnswerDao();
 			Vector<AnswerDto> alist = adao.getAnswerList(dto.getNum());
            %> <a style="cursor: pointer; font-size: 8px; color: black;" href="#"> 댓글(<%=alist.size()%>)
				</a>
				<br>
				</answer> <answerlist>
				<div style="margin-left: 10px; font-size: 9pt;">
					<%
						for (AnswerDto adto : alist) {
					%>
					<b><%=adto.getName()%>(<%=adto.getId()%>)</b>
					<%
						if (loginok != null && adto.getId().equals(id)) {
					%>
					<a style="color: red;" href="">수정</a> <a style="color: red;" href="">삭제</a>
					<%
						}
					%>
					&nbsp;&nbsp;
					<%=sdf.format(adto.getSdate())%>
				</div>
				<%
					}
							if (loginok != null) {
				%>
				<form action="guest/answeraction.jsp" method="post">
					<input type="text" name="content"> <input type="hidden" name="pageNumber"
						value="<%=currentPage%>">
					<!-- 댓글 저장 후 보던 페이지로 리턴하기 위해 필요 -->
					<input type="hidden" name="num" value="<%=dto.getNum()%>">
					<!-- 어느글에 대한 댓글인지 알아야함 -->
					<input type="hidden" name="name" value="<%=name%>">
					<!-- 댓글저장시 누가 작성하였는지에 대한 id / pass -->
					<input type="hidden" name="id" value="<%=id%>"> <input type="submit"
						value="저장">
				</form>
	</table>
	<br>
	<%
		}
			}
	%>
	<div style="width: 400px;" class="text-center">
		<ul class="pagination">
			<%
				for (int i = startPage; i <= endPage; i++) {
			%>
			<li><a style="color:<%=currentPage == i ? "red" : "black"%>"
				href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=i%>"><%=i%></a></li>
			<!-- 다음(마지막 블럭이 아니면) : 클릭시 현재페이지는 다음블럭의 startPage로 가려면 어떻게 주어야 할까요 -->
			<%-- <%
if(startPage>1){
%>
<li>
<a href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=i %>"></a></li>
<%
}
%> --%>
			<%
				}
			%>
			<%
				if (endPage < totalPage) {
			%>
			<li><a href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=endPage + 1%>">▶</a></li>
			<%
				}
					if (endPage == totalPage) {
			%>
			<li><a href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=endPage - 1%>">◀</a></li>
			<%
}
%>
		</ul>
	</div>
	<%
			}
%>
</body>
</html>