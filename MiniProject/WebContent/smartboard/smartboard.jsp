<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style type="text/css">
#cl-dashboard {
	display: none;
}

table {
	border: 1px solid gray;
}

th, tr, td {
	border: 1px solid gray;
}

a:LINK {
	color: black;
	text-decoration: none;
	font-size: 10pt;
}

a:HOVER {
	color: blue;
	text-decoration: underline;
	font-size: 10pt;
}
</style>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div style="margin-left: -100px;">
		<fieldset style="width: 800px;">
			<legend>SmartEditor 입력폼</legend>
			<form action="writeaction.do" method="post" enctype="multipart/form-data" name="f">
				<table class="table table-bordered">
					<tr>
						<th width="100" bgcolor="#ddd">작성자</th>
						<td><input type="text"  style="width: 120px;"
							required="required" name="name" placeholder="작성자"></td>
					</tr>
					<tr>
						<th width="100" bgcolor="#ddd">제 목</th>
						<td><input type="text" style="width: 300px;"
							required="required" name="subject" placeholder="제목"></td>
					</tr>

					<tr>
						<th width="100" bgcolor="#ddd">내 용</th>
						<td><textarea
								style="width: 100%; height: 300px; display: none;" name="content" id="content"></textarea>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" value="db등록" style="width: 100px;" onclick="submitContents(this)">
						<input type="button" value="데이타추가" style="width: 100px;" onclick="location.href='list.do'">
						</td>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>

	<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>
