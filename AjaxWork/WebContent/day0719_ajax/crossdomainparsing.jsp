<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
 #cl-dashboard{display: none;} 
</style>
<!-- 가져올 xml데이타가 크로스도메인이라서 아래 js파일을 두개 더 추가함. -->
<script type="text/javascript" src="../js/xml2json.js"></script>
<script type="text/javascript" src="../js/jquery.xdomainajax.js"></script>
 
<script type="text/javascript">
//<![CDATA[
 $(document).ready(function(){
    // var url = "http://www.kma.go.kr/wid/queryDFS.jsp?gridx=65&gridy=99";
    var url = "http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
     
     $.ajax({
          url: url
         ,type: 'GET'
         ,success: function(res) {
             var myXML = res.responseText;
             myXML = $.parseXML(myXML)
             $(myXML).find("weather").each(function(){
            	    var firstrowHtml = $(this).attr("year")+"-"+$(this).attr("month")+"-"+$(this).attr("day")+"&nbsp;&nbsp;"+$(this).attr("hour")+"시";
            	    $("#updateXml").append(firstrowHtml);
             });
    $(myXML).find("local").each(function(no){
     var rowHtml = "<tr><td>"+no+"</td>";
     rowHtml += "<td>"+$(this).attr("ta")+"</td>";
     rowHtml += "<td>"+$(this).attr("desc")+"</td>";
     rowHtml += "<td>"+$(this).attr("icon")+"</td>";
     rowHtml += "<td>"+$(this).attr("stn_id")+"</td>";
     rowHtml += "<td>"+$(this).text()+"</td>";
  /*    rowHtml += "<td>"+$(this).find("tmn").text()+"</td>";
     rowHtml += "<td>"+$(this).find("sky").text()+"</td>";
     rowHtml += "<td>"+$(this).find("pty").text()+"</td>";
     rowHtml += "<td>"+$(this).find("wfKor").text()+"</td>";
     rowHtml += "<td>"+$(this).find("wfEn").text()+"</td>";
     rowHtml += "<td>"+$(this).find("pop").text()+"</td>";
     rowHtml += "<td>"+$(this).find("r12").text()+"</td>";
     rowHtml += "<td>"+$(this).find("s12").text()+"</td>";
     rowHtml += "<td>"+$(this).find("ws").text()+"</td>";
     rowHtml += "<td>"+$(this).find("wd").text()+"</td>";
     rowHtml += "<td>"+$(this).find("wdKor").text()+"</td>";
     rowHtml += "<td>"+$(this).find("wdEn").text()+"</td>";
     rowHtml += "<td>"+$(this).find("reh").text()+"</td>";
     rowHtml += "<td>"+$(this).find("r06").text()+"</td>";
     rowHtml += "<td>"+$(this).find("s06").text()+"</td>"; */
     $("#testXml").append(rowHtml);
    });
         }
     }); 
 });
//]]>
</script>
<body>
<div>전국기상정보</div>
<div id ="updateXml">최종 업데이트 시간: </div>
<div>
 <table>  
  <tbody id="testXml">
   <tr>
    <th>seq</th>
    <th>ta</th>
    <th>desc</th>
    <th>icon</th>
    <th>stn_id</th>
    <th>local</th>
   <!--  <th>sky</th>
    <th>pty</th>
    <th>wfKor</th>
    <th>wfEn</th>
    <th>pop</th>
    <th>r12</th>
    <th>s12</th>
    <th>ws</th>
    <th>wd</th>
    <th>wdKor</th>
    <th>wdEn</th>
    <th>reh</th>
    <th>r06</th>
    <th>s06</th>  -->
   </tr>
  </tbody>
 </table>
</div>
</body>
</html>
