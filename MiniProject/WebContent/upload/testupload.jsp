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
</style>
<script type="text/javascript">
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;
   var files = targetObj.files;
   
      for ( var i = 0; i < files.length; i++) {
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
	<fieldset>
		<legend>이미지 업로드 연습</legend>
		<form action="upload/testaction.jsp?main=upload/testaction.jsp" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered">
				<tr>
					<th width="100">이름</th>
					<td><input type="text" name="name" style="width: 120px;" class="form-control">
					</td>
				</tr>
				<tr>
					<th width="100">제목</th>
					<td><input type="text" name="title" style="width: 200px;" class="form-control">
					</td>
				</tr>
				<tr>
					<th width="100">이미지</th>
					<td><input type="file" name="upload" style="width: 400px;" class="form-control"
						onchange="previewImage(this,'View_area')"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="이미지 업로드"
						class="btn btn-success btn-sm"></td>
				</tr>
			</table>
		</form>
		<div id='View_area'
			style='position: relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline;'></div>
	</fieldset>
</body>
</html>