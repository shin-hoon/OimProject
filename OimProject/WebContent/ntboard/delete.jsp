<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
</head>
<body>
   <div id="news_area">
    <center>
       <h1 style="color:white;">삭제하기</h1>
       <form method=post action="ntdeleteok.do">
       <table id="table_content" width=300>
        <tr>
         <td width=100% align=left>
          <input type=hidden name=nt_no value="${nt_no }">
         </td>
        </tr>
        <tr>
         <td colspan="2" align=center>
          <input type=submit class="btn btn-info btn-xs" value="삭제">
          <input type=button class="btn btn-info btn-xs" value="취소"
           onclick="javascript:history.back()"
          >
         </td>
        </tr>
       </table>
       </form>
    </center>
   </div>
</body>
</html>





