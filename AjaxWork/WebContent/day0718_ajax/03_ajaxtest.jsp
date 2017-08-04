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
		var re = $.ajax({
			type : 'GET',
			url : 'ajaxdata1.jsp',
			dataType : 'xml',
			success : function(redata){
			var str = "<b>xml처리결과</b><br>";
			$(redata).find("serverdata").each(function(){
				var r = $(this);
				str += "이름: "+r.find("irum").text() + "<br>";
				});
			$("#disp").append(str);
			},
			statusCode : {
				404 : function(){
					alert("해당 파일이 없어요");
				},
				505 : function(){
					alert("서버 오류에요");
				}
			}
		});
	
	}); //html
	
	$("#btn2").click(function(){
		$("#disp").empty();
		var irum1 = $("#irum1").val();
		var irum2 = $("#irum2").val();
		
		$.ajax({
			type : 'GET',
			url : 'ajaxdata2.jsp',
			dataType : 'xml',
			data : {"irum1" : irum1, "irum2" : irum2},
			success : function(redata){
			var str = "<b>xml처리결과</b><br>";
			$(redata).find("serverdata").each(function(){
				var r = $(this);
				str += "이름: "+r.find("irum").text() + "<br>";
				});
			$("#disp").append(str);
			},
			statusCode : {
				404 : function(){
					alert("해당 파일이 없어요");
				},
				505 : function(){
					alert("서버 오류에요");
				}
			}
		});
		
	}); //jsp-xml
	
	$("#btn3").click(function(){
		$("#disp").empty();
		
		$.ajax({
		type : 'GET',
		url : 'ajaxdata3.jsp',
		dataType : 'json',
		success : function(redata){
			var str = "<b>json 데이터 처리</b><br>";
			$.each(redata, function(index,item){
				str += "이름 : "+item["name"]+",";
				str += "나이 : "+item["age"]+"<br>";
			});
			$("#disp").append(str);
		},
		statusCode : {
			404 : function(){
				alert("해당 파일이 없어요");
			},
			505 : function(){
				alert("서버 오류에요");
			}
		}
	});
	}); 
	
	 $("#btn4").click(function(){
		$("#disp").empty();
		
		var ir1 = $("#irum1").val();
		var ir2 = $("#irum2").val();
		var n1 = $("#nai1").val();
		var n3 = $("#nai3").val();
		
		$.ajax({
			type : 'GET',
			url : 'ajaxdata4.jsp',
			dataType : 'json',
			data : {"irum1" : ir1, "irum2" : ir2, "nai1" : n1, "nai3" : n3},
			success : function(redata){
				var str = "<b>json 데이터 처리</b><br>";
				$.each(redata, function(index,item){
					str += "이름 : "+item["name"]+",";
					str += "나이 : "+item["age"]+"<br>";
				});
				$("#disp").append(str);
			},
			statusCode : {
				404 : function(){
					alert("해당 파일이 없어요");
				},
				505 : function(){
					alert("서버 오류에요");
				}
			}
		});
		}); 
	
	
	});
</script>
</head>
<body>
<h2>Ajax 자료 읽기</h2>
<input type="text" id="irum1" placeholder="irum1"><br>
<input type="text" id="nai1" placeholder="nai1"><br>
<input type="text" id="irum2" placeholder="irum2"><br>
<input type="text" id="nai3" placeholder="nai3"><br>

<input type="button" value="xml 읽기" id="btn1"><br><br>
<input type="button" value="xml읽기-para" id="btn2"><br><br>
<input type="button" value="json 읽기" id="btn3"><br><br>
<input type="button" value="json 읽기-para" id="btn4"><br><br>

<div id = "disp"></div>
</body>
</html>