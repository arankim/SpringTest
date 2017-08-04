<%@page import="db.dao.UploadDao"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Vector"%>
<%@page import="db.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.dto.UploadDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#td img {
	padding: 10px;
	border: 1px solid gray;
}

td div {
	padding: 10px;
	margin: 10px;
	height: 140px;
	width: 160px;
	border: 1px solid gray;
}

td:HOVER {
	background-color: #ffc;
	border: 1px solid red;
}
</style>
</head>
<body>
	<%

		MemberDao mdao = new MemberDao();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-mm-dd");
		String realFolder=getServletContext().getRealPath("/save");
		UploadDto ddto = null;
		UploadDao dao = new UploadDao();
		//String name=mdao.getName(id);

		int totalCount=dao.getTotalCount(); //총 글의 갯수
		int perPage = 2; //한페이지당 보여지는 글의 갯수
		int perBlock = 5; //한블럭당 보여지는 페이지번호의 수
		int currentPage;//현재페이지,만약 널값이면 1로 줌
		int totalPage; //총 페이지의 갯수"WebContent/guest/guestlist.jsp"
		int startNum;//한페이지당 보여지는 시작번호
		int endNum;//한페이지당 보여지는 끝번호
		int startPage; //한 블럭당 보여지는 시작페이지번호
		int endPage; //한 블럭당 보여지는 끝페이지번호
		int no; //게시글에 붙일 시작번호

		//현재 페이지
		if (request.getParameter("pageNum") != null)
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
		else
			currentPage = 1;
		
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
		Vector<UploadDto> list = dao.getSangpums(startNum, endNum);
		int idx = 0;
	%>
	<table>
		<tr height="170">
			<%
					for (UploadDto dto : list) {
					idx++;
					File imgFile = new File(realFolder + "\\" + dto.getFilename());
					String myimg = "";
					if (imgFile.exists())
						myimg = dto.getFilename();
					else
						myimg = "empty.jpg";
			%>
			<td width="150" align="center">
			<div>
			<%
			if(dto.getReadcount() >= 10){
			%>
			<img src="image/hot.png" style="position:absolute; width:70px;">
			<%
			}
			%>
			<a href="layoutsero.jsp?main=upload/content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
			<img src="save/<%=myimg%>" class="myimg" style="width: 110px; max-height: 110px;">
			</a>
			</div>
			<span style="text-overflow:ellipsis; overflow: hidden; white-spcae:nowrap; display:block;max-height: 140px; font-size:9pt;">
			<a href="layoutsero.jsp?main=upload/content.jsp?num=<%=dto.getNum() %>&pageNum=<%=currentPage %>&key=list">
			<%=dto.getSubject() %></a></span>
			<span style="font-size:9pt;color:#ccc;">조회&nbsp;<%=dto.getReadcount() %>&nbsp;&nbsp;<%=sdf.format(dto.getWriteday()) %></span>
			<%
			String name = mdao.getName(dto.getId());
			%>
			<br>
			<img src="image/chr15.gif" width="20">
			<span style="color:black;font-size:9pt;"><%=name %></span>
			</td>
			<%
				if (idx % 4 == 0) {
			%>
		</tr>
		<tr>
			<%
				}
				}
			%>
		
	</table>
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

</body>
</html>