<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
#disp{
position: absolute;
left: 300px;
top: 50px;
width: 500px;
height: 800px;
border: 1px solid black;
}
table,td,th,tr{
border: 1px solid black;
}
</style>
<script type="text/javascript">
$(function(){
	$("#btn1").click(function(){
		$("#disp").empty();
		$("#disp").load("a.html");
	}); //html
	
	$("#btn2").click(function(){
		$("#disp").empty();
		$.getJSON("b.json",function(data){
			var str = "<table style='width:500px;'>";
			str+="<tr><th>term</th><th>part</th>";
			str+="<th>definition</th><th>quote</th>";
			str+="<th>author</th></tr>"
			$.each(data,function(index,item){
				str+="<tr>";
				str+="<td>"+item["term"]+"</td>";
				str+="<td>"+item["part"]+"</td>";
				str+="<td>"+item["definition"]+"</td>";
				//quote - 배역타입
				str+="<td>";
				if(item["quote"]!=null){
	             $.each(item["quote"],function(index,qitem){
					str+=qitem+"<br>";
				}); 
				} else {
					str+="quote 없음";
				}
				str+="</td>";
				str+="<td>"
			   if(item["author"]==null){
				   str+="author 없음";
			   } else {
				   str += item["author"];
			   }
				str+="</td>";
				str+="</tr>";
			});
			str+="</table>";
			$("#disp").append(str);
		});
	}); //json
	
	$("#btn3").click(function(){
		$("#disp").empty();
		$.get("c.xml",function(data){
			var str = "<table style='width:500px;'>";
			str+="<tr><th>term</th><th>part</th>";
			str+="<th>mes</th></tr>";
			$(data).find("aa").each(function(){
				var entry = $(this);
				str+="<tr>";
				str+="<td>"+entry.attr("term")+"</td>";
				str+="<td>"+entry.attr("part")+"</td>";
				str+="<td>"+entry.find("mes").text()+"</td>";
				str+="</tr>";
			});
			str+="</table>";
			$("#disp").append(str);
		});
	}); //xml
	
	$("#btn4").click(function(){
		$("#disp").empty();
		$.get("d.jsp",function(data){
			var str = "<table style='width:500px;'>";
				$(data).find("guestlist").each(function(){
					var entry = $(this);
					str += "<tr>";
					str += "<td>"+"번호:"+entry.find("num").text() +"   작성자:"+ entry.find("name").text()+"<br>";
					str += "아이디:"+entry.find("id").text()+"<br>";
					str += "<img src='../image4/C"+entry.find("avata").text()+".png'>"+entry.find("content").text()+"<br>";
					str += "작성일:"+entry.find("writeday").text()+"</td>";
					str += "</tr>"
				});
			str+="</table>";
			$("#disp").append(str);
		});
		
	}); //jsp-xml
});
</script>
</head>
<body>
<h2>Ajax 자료 읽기</h2>
<input type="button" value="html 읽기" id="btn1"><br><br>
<input type="button" value="json 읽기" id="btn2"><br><br>
<input type="button" value="xml 읽기" id="btn3"><br><br>
<input type="button" value="jsp-xml 읽기" id="btn4"><br><br>
<div id = "disp"></div>
</body>
</html>