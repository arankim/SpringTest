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
<script type="text/javascript">
var idx=0;
function addFileForm(){
    
    var tb1 = document.getElementById("file_table");
    if(9 >= tb1.rows.length) {
     var idx = getObj().parentElement.rowIndex + 1;
     //alert(idx);
    // idx++;
   // $("#cnt").val(idx+1);
  
     var trow= tb1.insertRow(idx);
     var uploadOBJ="<input name='files["+idx+"]' type='file' id='f_id'> <input type=\"button\" class=\"button\" value=\"추가\" OnClick=\"javascript:addFileForm();\" /> <input type=\"button\" class=\"button\" value=\"삭제\" OnClick=\"javascript:deleteRow();\" /> ";
     trow.insertCell(0).innerHTML = uploadOBJ;
    } else {
     alert("문서파일은 10개 이상 접수할 수  없습니다.");
     return;
    }
   }
   
   function getObj()
   {
       var obj = event.srcElement
       while (obj.tagName !='TD') //TD가 나올때까지의 Object추출
       {
           obj = obj.parentElement
       }
       return obj
   }
   
   function deleteRow(){
    var tb1 = document.getElementById("file_table");
   
    var idx = getObj().parentElement.rowIndex;
   
    if(tb1.rows.length-1 !=0){
     var tRow = tb1.deleteRow(idx);
    }else{
      document.getElementById('f_id').select();
         document.selection.clear();
    }
   }
</script>
</head>
<body>
<form action="uploadproc2.do" enctype="multipart/form-data" method="post">
 <table id="file_table">
 <tr>
 <td>
 <b>문자열 : </b>
 <input type="text" name="msg"></td></tr>
         <tr>
          <td>
            <input name="upfile" type="file" id="f_id">
            <input type="button" class="button" value="추가" OnClick="javascript:addFileForm();" />
            <input type="button" class="button" value="삭제" OnClick="javascript:deleteRow();" />
          </td>
         </tr>
      </table>  
     <!--  <input type="text" name="cnt"  id="cnt" value="1"> -->
      <input type="submit" value="업로드">    
</form>
</body>
</html>