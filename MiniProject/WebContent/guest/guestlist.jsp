<%@page import="db.dao.AnswerDao" %>
<%@page import="db.dto.AnswerDto" %>
<%@page import="db.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dto.GuestDto"%>
<%@page import="java.util.Vector"%>
<%@page import="db.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 60초마다 refresh -->
<meta http-equiv="refresh" 
content="60;layoutsero.jsp?main=guest/guestlist.jsp">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}	
</style>
<script type="text/javascript">
$(function(){
	//댓글목록이랑 댓글폼은 일단은 안보이도록 설정
	$("td answerlist").hide();
	//댓글부분을 클릭하면 
	//그부분의 댓글목록과 폼이 보이도록
	$("td answer a").click(function(){
		$(this).parent().next().toggle();
	});
	
});
</script>
</head>
<%
	//세션으로부터 로그인정보를 구한다
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("idok");
	//회원명은 회원정보로부터 얻는다
	MemberDao mdb=new MemberDao();
	String name=mdb.getName(id);

	GuestDao db=new GuestDao();
	//페이징 처리에 필요한 변수들	
	int totalCount=db.getTotalCount(); //총 글의 갯수
	int perPage=2; //한페이지당 보여지는 글의 갯수
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
	
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	no=totalCount-((currentPage-1)*perPage);
	
	//페이지에서 필요한 만큼만 게시글 가져오기
	Vector<GuestDto> list=db.getList(startNum,endNum);
	//mysql 은 startNum 과 perPage 를 보내야함	
%>
<body>
<div style="margin-left: 70px;">
	<a href="layoutsero.jsp?main=guest/guestform.jsp">
	<img src="image/btn13.gif" title="방명록글쓰기"
	  width="30"></a>
	<br><br>
	<%
	if(totalCount==0){
	%>
		<hr align="left" style="border-bottom:3px solid gray;" color="gray" width="500">
		<b style="padding-left: 150px;">등록된 방명록 글이 없습니다</b>
		<hr align="left" style="border-bottom:3px solid gray;" color="gray" width="500">
				
	<%
	}else{
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd HH:mm");		
		for(GuestDto dto:list){
		%>
			<b>No.<%=no--%></b><br>
			<table class="table .table-striped"
			  style="width: 400px;">
				<tr>
					<td width="250">
						<b><%=dto.getName()%>(<%=dto.getId()%>)</b>
					</td>
					<td align="right">
						<%=sdf.format(dto.getWriteday()) %>
					</td>
				</tr>
				<tr height="80">
					<td colspan="2">
						<div style="white-space:pre-wrap;word-wrap:break-word;width: 400px;">	
						<img src="image4/C<%=dto.getAvata()%>.png"
						  align="left" hspace="10" width="70">
						
						<pre><%=dto.getContent()%></pre> 
						</div> 
					</td>
				</tr>
				<tr>
				 <td colspan="2">
				 	<answer>
			 	   <%
			 	   	//댓글 가져오기
			 	   	AnswerDao adb=new AnswerDao();
			 	    Vector<AnswerDto> alist=adb.getAnswerList(dto.getNum());
			 	   %>
				 		<a style="cursor: pointer;font-size: 9pt;color: black;"
				 		 href="#">
				 		댓글 (<%=alist.size()%>)</a><br>			 		
				 	</answer>
				 	<answerlist>
				 	<!-- 댓글목록과 폼출력할곳 -->
				 	<div style="margin-left: 10px;font-size: 9pt;">
				 	 <%
				 	 for(AnswerDto adto:alist){
				 	 %>
				 		<b><%=adto.getName()%>(<%=adto.getId()%>)</b> 
				 		<!--  자기자신이 쓴 댓글에만 
				 		수정,삭제 보이게하기 -->
				 		&nbsp;&nbsp;
				 		<%
				 		if(loginok!=null && adto.getId().equals(id)){
				 		%>
				 		<a href="">수정</a>
				 		<a href="../layoutsero.jsp?main=guest/deleteanswerform.jsp?num=<%=adto.getNum()%>&pageNum=<%=currentPage%>">삭제</a>	
				 		<%
				 		}
				 		%>
				 		&nbsp;&nbsp;
				 		<%=sdf.format(adto.getSdate())%>
				 		<br>
				 		<span style="margin-left: 20px;">
				 			<%=adto.getContent()%></span>
				 		<br>
				 	 <%}
				 	 %>
				 	</div>				 	
				 	<%
				 	if(loginok!=null){
				 	%>
				 	  <form action="guest/answeraction.jsp" method="post">
				 	  	<!-- hidden : 총 4개-->
				 	  	<!-- 댓글 저장후 보던 페이지로 와야하므로 필요함 -->
				 	  	<input type="hidden" name="pageNum"
				 	  	 value="<%=currentPage%>">
				 	  	<!--  어느글에 대한 댓글인지를 알아야하므로 필요함 -->
				 	  	<input type="hidden" name="num"
				 	  	 value="<%=dto.getNum()%>">
				 	  	<!-- 댓글 저장시 누가 글을썼는지 아이디와 이름도 같이 저장함 -->
				 	  	<input type="hidden" name="name"
				 	  	 value="<%=name%>">
				 	  	<input type="hidden" name="id"
				 	  	 value="<%=id%>">				 	  	 
				 	  	
				 	  	<input type="text" name="content"
				 	  	 class="form-control"
				 	  	 style="width: 300px;float: left;margin-left: 10px;">
				 	  	 &nbsp;
				 	  	<input type="submit" value="확인"
				 	  	  class="btn btn-info btn-xs"
				 	  	  style="width: 40px;height: 30px;"> 
				 	  </form>				 	  
				 	<%
				 	}
				 	%>  
				 	</answerlist>
				 </td>	
				</tr>
				<tr>
					<td colspan="2" align="right">
					  <input type="button"  
					  class="btn btn-success btn-xs"
					  value="수정"
					  onclick="location.href='layoutsero.jsp?main=guest/updateform.jsp?num=<%=dto.getNum()%>&pageNumber=<%=currentPage%>'">
					  <input type="button"  
					  class="btn btn-danger btn-xs"
					  value="삭제"
					  onclick="location.href='layoutsero.jsp?main=guest/deletepassform.jsp?num=<%=dto.getNum()%>&pageNumber=<%=currentPage%>'">
					</td>
				</tr>
			</table>
			<br>
		<%}	//for		
		//페이징처리
	%>
	<div style="width: 400px;" class="text-center">
	 <ul class="pagination">
	 <!-- 이전(첫블럭이 아니면 보이게하기) -->
	<%
	 if(startPage>1)
	 {%>
		<li>
		<a href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=startPage-1%>">
		◀Prev</a></li> 
	 <%}
	 %>	  
	 
	 <%
	 for(int i=startPage;i<=endPage;i++)
	 {%>
		<li>
		<a 
		style="color:<%=currentPage==i?"red":"black"%>"
		href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=i%>"><%=i%></a>
		</li> 
	 <%}
	 %>	
	 <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
	 다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
	 <%
	 if(endPage<totalPage)
	 {%>
		<li>
		<a href="layoutsero.jsp?main=guest/guestlist.jsp?pageNum=<%=endPage+1%>">
		Next▶</a></li> 
	 <%}
	 %>	 
	 </ul>	
	</div>
	<%}//else
	%>
</div>
</body>
</html>






