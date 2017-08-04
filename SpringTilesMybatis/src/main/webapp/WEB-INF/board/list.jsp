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

#button{
top:250px;
left: 500px;
}
</style>
<script type="text/javascript">
function answeropen(num){
	window.open('alist.do?num='+num,'','width=400px,height=400px,left=800px');
}
</script>
</head>
<body>
	<b>총 ${totalCount }개의 글이 있습니다</b>
	<br>
	<table class="table table-bordered" style="margin-left: -230px;">
		<caption>답변형 글 목록
		</caption>
		<tr bgcolor="#ddd">
			<th width="60">번호</th>
			<th width="300">제목</th>
			<th width="80">작성일</th>
			<th width="60">조회</th>
			<th width="100">작성일</th>
		</tr>
		<c:if test="${totalCount==0 }">
			<tr>
				<td align="center" colspan="5"><b>등록된 글이 없습니다.</b></td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0 }">
			<c:forEach var="a" items="${list }">
				<tr>
					<td align="center">${no }</td>
					<c:set var="no" value="${no-1 }" />
					<td><c:forEach var="sp" begin="1" end="${a.re_level }">
		             &nbsp;&nbsp;
		            </c:forEach> <!-- 답글일경우 리플이미지 --> <c:if test="${a.re_step>0}">
							<img src="../image/re.gif">
						</c:if><a href="content.do?num=${a.num }&pageNum=${pageNum}&key=list" style="color: black;">${a.subject }
						<c:forEach var="mapKey" items="${map }">
						<c:if test="${ mapKey.key == a.num and mapKey.value > 0 }">
						&nbsp;<a href="javascript:answeropen(${a.num })"><span style="color:red;">[${mapKey.value }]</span></a>
						</c:if>
						</c:forEach>
						</a></td>
				<td>${a.writer }</td>
				<td>${a.readcount }</td>
				<td>${a.writeday }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<input type="button" class="btn btn-info btn-sm" value="글쓰기" onclick="location.href='writeform.do'" style="margin-left: 713px; margin-top: -10px;">
	<div style="width:800px;text-align: center;">
	<ul class="pagination">
	<c:if test="${startPage>1}">
	<li><a href="list.do?pageNum=${startPage-1}">이전</a></li>
	</c:if>
    &nbsp;
    <c:forEach var="pg" begin="1" end="${endPage }">
    <li><a href="list.do?pageNum=${pg }">${pg }</a></li>
    &nbsp;
    </c:forEach>
    <c:if test="${endPage<totalPage }">
   <li> <a href="lit.do?pageNum=${endPage+1 }">다음</a></li>
    </c:if>
    </ul>
    </div>
</body>
</html>