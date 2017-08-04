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
</head>
<body>
	<%
	ReplyDao db=new ReplyDao();
	//페이징 처리에 필요한 변수들	
	int totalCount=db.getTotalCount(); //총 글의 갯수
	int perPage=10;//한페이지당 보여지는 글의 갯수
	int perBlock=5; //한블럭당 보여지는 페이지번호의 수
	int currentPage;//현재페이지,만약 널값이면 1로 줌
	int totalPage; //총 페이지의 갯수
	int startNum;//한페이지당 보여지는 시작번호
	int endNum;//한페이지당 보여지는 끝번호
	int startPage; //한 블럭당 보여지는 시작페이지번호
	int endPage; //한 블럭당 보여지는 끝페이지번호
	int no; //게시글에 붙일 시작번호
	
	//현재 페이지
	if(request.getParameter("pageNum")!=null)
		currentPage=Integer.parseInt(request.getParameter("pageNum"));
	else
		currentPage=1;
	//총 페이지수
	totalPage=(totalCount/perPage)+(totalCount%perPage>0?1:0);
	//각 페이지에 보여질 시작번호와 끝번호 구하기
	startNum=(currentPage-1)*perPage+1;
	endNum=startNum+perPage-1;
	//예를 들어 모두 45개의 글이 있을경우
	  //마지막 페이지는 endnum 이 45 가 되야함
	  if(endNum>totalCount)
			endNum=totalCount;
	
	//각 블럭에 보여질 시작 페이지번호와 끝 페이지 번호 구하기
	startPage= (currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	//예를 들어 총 34페이지일경우
	//마지막 블럭은 30-34 만 보여야함
	if(endPage>totalPage)
	   endPage=totalPage;
	
	Vector<ReplyDto> list=db.getList(startNum,endNum);
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
%>
	<b>총 <span style="color: red;"><%=totalCount%></span> 개의 글이 있습니다
	</b>
	<input type="button" value="게시물등록" class="btn btn-danger btn-xs"
		style="width: 100px; margin-left: 200px;"
		onclick="location.href='layoutsero.jsp?main=reply/replyform.jsp?pageNum=<%=currentPage%>'">

	<br>
	<br>
	<%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
	<div style="margin-left: 5px;">
		<table class="table table-bordered" style="width: 700px;">
			<tr bgcolor="#ddd">
				<th width="50">번호</th>
				<th width="300">제 목</th>
				<th width="80">작성자</th>
				<th width="60">조회수</th>
				<th width="100">작성일</th>
			</tr>
			<%
 		if(totalCount == 0){
 		%>
			<tr>
				<td colspan="5" align="center"><b>등록된 자료가 없습니다.</b></td>
			</tr>
			<%
 		} else {
 			for(ReplyDto dto : list){
 		%>
			<tr>
				<td align="center"><%=no-- %></td>
				<td>
			<!-- 레벨 1당 공백 2칸 --> 
			<%
			for(int i = 1; i<=dto.getRe_level(); i++){
			%> 
				&nbsp;&nbsp; 
			<%
			}
			%> 
			<%
			if(dto.getRe_level() > 0){
			%>
			<img src="image/re.gif">
			<%
			}
			%>
			<a style="color: black;" href="layoutsero.jsp?main=reply/replycontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>&key=list">
			<%=dto.getSubject()%></a></td>
				<td align="center"><%=dto.getWriter()%></td>
				<td align="center"><%=dto.getReadcount()%></td>
				<td align="center"><%=sdf.format(dto.getWriteday())%></td>
			</tr>
			<%
 			}
%>
		</table>
	</div>
	<!-- 페이징처리 -->
	<div style="width: 700px;" class="text-center">
		<ul class="pagination">
			<!-- 이전(첫블럭이 아니면 보이게하기) -->
			<%
	 if(startPage>1)
	 {%>
			<li><a href="layoutsero.jsp?main=reply/replylist.jsp?pageNum=<%=startPage-1%>">
					◀</a></li>
			<%}
	 %>

			<%
	 for(int i=startPage;i<=endPage;i++)
	 {%>
			<li><a style="color:<%=currentPage==i?"red":"black"%>"
				href="layoutsero.jsp?main=reply/replylist.jsp?pageNum=<%=i%>"><%=i%></a></li>
			<%}
	 %>
			<!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
			<%
	 if(endPage<totalPage)
	 {%>
			<li><a href="layoutsero.jsp?main=reply/replylist.jsp?pageNum=<%=endPage+1%>">
					▶</a></li>
			<%}

	 %>
		</ul>
	</div>
	<%
 			}
	%>
</body>
</html>
