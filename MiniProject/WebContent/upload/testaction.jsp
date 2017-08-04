<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
</head>
<body>
	<%
		//실제 업로드되는 save폴더의 경로 구하기
	//	ServletContext context = getServletContext();
	//	String realFolder = context.getRealPath("/save");
	String realFolder = getServletContext().getRealPath("/save");
		out.write("업로드될 실제경로 : " + realFolder + "<hr>");
		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(request, realFolder, 1024 * 100, "UTF-8", new DefaultFileRenamePolicy());

			//데이타읽기
			String name = multi.getParameter("name");
			String title = multi.getParameter("title");
			String originalFilename = multi.getOriginalFileName("upload");
			String uploadFilename = multi.getFilesystemName("upload");
			
			File myfile = new File(realFolder+"\\"+uploadFilename);
	%>
	<h2>파일업로드 데이타 출력</h2>
	이름 :
	<%=name%><br> 제목 :
	<%=title%><br> 업로드한 이미지
	<br> 원래이름 :
	<%=originalFilename%><br> 실제업로드이름 :
	<%=uploadFilename%><br> 파일유무 :
	<%=myfile.exists()?"파일있음":"파일없음" %><br> 파일크기 :
	<%=myfile.length()>1024 ? myfile.length()/1024+"kb":myfile.length()+"Byte" %><br>
	<hr>
	<img src="../save/<%=uploadFilename%>" style="max-width: 500px;">
	<%
		} catch (Exception e) {
			out.write("업로드 오류 : " + e.getMessage() + "<br>");
		}
	%>
</body>
</html>