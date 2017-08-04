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

#View_area {
	position: absolute;
	left: 800px;
	top: 100px;
	width: 200px;
	height: 200px;
}
</style>
<script type="text/javascript">
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area); //div id
		var ua = window.navigator.userAgent;
		var files = targetObj.files;

		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;

			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}

			var img = document.createElement("img");
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100px';
			img.style.height = '100px';
			preview.appendChild(img);

			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);

				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_" + View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
</script>
</head>
<body>
	<%
		String loginok = (String) session.getAttribute("loginok");
		String id = (String) session.getAttribute("idok");

		if (loginok == null) {
	%>
	<img src="image/chr09.gif" style="max-width: 200px;" align="left" hspace="30">
	<h3>
		사진을 업로드 하려면<br>먼저 로그인을 해주세요
	</h3>
	<%
		}
	%>
	<div id="View_area"></div>
	<%
		if (loginok != null) {
	%>
	<div>
	<fieldset style="width: 500px;">
		<legend>상품 업로드</legend>
		<form action="upload/uploadaction.jsp"
		  method="post" enctype="multipart/form-data">
		 <table style="width: 500px;" class="table table-bordered">
		 	<tr>
		 		<th width="100" bgcolor="#ddd">제 목</th>
		 		<td>
		 			<input type="text" class="form-control"
		 			  style="width: 300px;" required="required"
		 			  name="subject" placeholder="제목">		 			  
		 		</td>
		 	</tr>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">상품사진</th>
		 		<td>
		 			<input type="file" class="form-control"
		 			  style="width: 300px;" required="required"
		 			  name="photo" placeholder="상품사진"
		 			  onchange="previewImage(this,'View_area')">		 			  
		 		</td>
		 	</tr>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">상품설명</th>
		 		<td>
		 			<textarea rows="7" cols="40"
		 			 class="form-control"
		 			 required="required"
		 			 name="content"></textarea>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td colspan="2" align="center">
		 			<!-- hidden  -->
		 			<input type="hidden" name="id" value="<%=id%>">
		 			
		 			<input type="submit" value="상품등록"
		 			 class="btn btn-info btn-sm"
		 			  style="width: 100px;">
		 			  
		 			<input type="button" value="상품목록"
		 			 class="btn btn-info btn-sm"
		 			  style="width: 100px;"
		 			  onclick="location.href='layoutgaro.jsp?main=upload/uploadlist.jsp'">  
		 		</td>		 		
		 	</tr>
		 </table>	  
		</form>
	</fieldset>
	</div>
	<%
}
%>
</body>
</html>