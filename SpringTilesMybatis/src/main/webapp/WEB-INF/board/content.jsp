<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		
	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td, div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
<script type="text/javascript">
	$(function() {
		var dialog;
		$("#answerUpdate-form").hide();
		function addUser() {
			frm.submit();
		}

		dialog = $("#dialog-form").dialog({
			autoOpen : false,
			height : 400,
			width : 350,
			modal : true,
			buttons : {
				"수정하기" : addUser,
				'취소' : function() {
					dialog.dialog("close");
				}
			},

		});

		$("#updateform").click(function() {
			dialog.dialog("open");
		});

		//삭제창 확인 dialog
		$("#deletebutton").click(
				function() {
					$("#dialog-confirm").dialog(
							{
								resizable : false,
								height : "auto",
								width : 400,
								modal : true,
								buttons : {
									"확인" : function() {
										location.href = "delete.do?num=" + num
												+ "&pageNum=" + pg;
										$(this).dialog("close");
									},
									Cancel : function() {
										$(this).dialog("close");
									}
								}
							});
				});
	});

	function answerdel(pk, num, pg) {
		//alert(pk + "," + num + "," + pg);
		location.href="deleteanswer.do?pk="+pk+"&num="+num+"&pageNum="+pg;
	}
	
	function answerup(){
		$("#answer").hide();
		$("#answerUpdate-form").show();
		$("#answerUpdate-form>#content").focus();
		$("#answerUpdate-form>#content").removeAttr("readOnly");
	}
	
</script>
</head>
<body>
	<table style="width: 500px;" class="table table-striped">
		<caption>
			<b>내용보기</b>
		</caption>
		<tr>
			<td width="350"><b>${dto.subject}</b></td>
			<td><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /></td>
		</tr>
		<tr height="250">
			<td colspan="2" valign="top"><b>${dto.writer}</b> <br>
			<br> <pre>${dto.content}</pre></td>
		</tr>
		<tr>
			<td colspan="2"><b>조회 ${dto.readcount}</b> &nbsp;&nbsp; <b>댓글 ${acount}</b> <br>
				<c:forEach var="a" items="${list}">
				<div style="padding-left: 20px;" id="answer">
						<b>${a.nickname}</b> 
				 	    &nbsp;&nbsp;
				 	    <span style="color: gray; font-size: 9pt;"> <fmt:formatDate value="${a.writeday}" pattern="yyyy-MM-dd HH:mm" /></span>
				 		<br>
				 		<b>${a.content }</b>
				 	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	    <a href="javascript:answerup()">수정</a>&nbsp;
				 	    <a href="javascript:answerdel(${a.pk },${dto.num },${pageNum })">삭제</a>
				 	    </div>
				 	<div id="answerUpdate-form" style="padding-left: 20px;">
						<b>${a.nickname}</b> 
				 	    &nbsp;&nbsp;
				 	    <span style="color: gray; font-size: 9pt;"> <fmt:formatDate value="${a.writeday}" pattern="yyyy-MM-dd HH:mm" /></span>
				 		<input type="text" name="content" id="content" value="${a.content}" readonly>
				 	     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	    <a href="javascript:answerup()">수정</a>&nbsp;
				 	    <a href="javascript:answerdel(${a.pk },${dto.num },${pageNum })">삭제</a>
                    </div>
						<br>
					</c:forEach>
				</td>
		</tr>
		<tr height="100">
			<td colspan="2">
				<form action="answerread.do" method="post">
					<div class="form-inline">
						<input type="text" name="nickname" class="form-control"
							style="width: 80px; float: left;" placeholder="닉네임"> <input type="text"
							name="content" class="form-control" style="width: 300px;" placeholder="댓글내용">

						<!-- hidden -->
						<input type="hidden" name="num" value="${dto.num}"> <input type="hidden"
							name="pageNum" value="${pageNum}"> <input type="submit"
							class="btn btn-danger btn-sm" value="확인" style="width: 70px;">
					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="button" class="btn btn-info btn-sm" value="글쓰기" style="width: 70px;" onclick="location.href='writeform.do'"> 
				<input type="button" class="btn btn-info btn-sm" value="수정" style="width: 70px;" id="updateform"> 
				<input type="button" class="btn btn-info btn-sm" value="삭제" style="width: 70px;" id="deletebutton" num="${dto.num }" pg="${pageNum }">
				<input type="button" class="btn btn-info btn-sm" value="답글" style="width: 70px;" onclick="location.href='writeform.do?num=${dto.num}&pageNum=${pageNum}'"> 
				<input type="button" class="btn btn-info btn-sm" value="목록" style="width: 70px;" onclick="location.href='list.do?pageNum=${pageNum}'"></td>
		</tr>
	</table>

	<div id="dialog-form" title="게시판 내용 수정하기">
		<form name="frm" action="bbsupdate.do" method="post">
			<fieldset>
				<label for="writer">작성자</label> 
				<input type="text" name="writer" value="${dto.writer}" class="text ui-widget-content ui-corner-all"> 
				<label for="subject">제목</label>
				<input type="text" name="subject" value="${dto.subject}" class="text ui-widget-content ui-corner-all">
				<label for="content">내용</label>
				<textarea rows="4" cols="40" name="content" class="ui-widget-content ui-corner-all">${dto.content}</textarea>

				<input type="hidden" name="num" value="${dto.num}"> 
				<input type="hidden" name="pageNum" value="${pageNum}"> 
				<input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
			</fieldset>
		</form>
	</div>
	
	<div id="dialog-confirm" title="게시글 삭제" style="display:none;">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>글을 삭제하시겠습니까? (글을 삭제하면 댓글도 같이 삭제됩니다.)</p>
</div>

</body>
</html>







