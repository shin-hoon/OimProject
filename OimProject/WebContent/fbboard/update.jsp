<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel = "stylesheet" type = "text/css" href = "../css/bootstrap.min.css">
<script type="text/javascript" src = "../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "../js/bootstrap.mine.js"></script>
<style type="text/css">
	.row{
	   margin: 0px auto;
	   width:600px;
	}
	.jumbotron{
	  height: 500px;
	  background: #ededed;	
	}
	
	td,th{
		font-size:15px;
	}
</style>
</head>
<body>
   <div class="container">
      <div class="row qnarow">
         <div style="height:70px"></div>
         <h3>수정하기</h3>
         <!-- 지금 인크루드 되어있기 때문에 메인위치이다. -->
         
         <form method="post" action="fbupdateok.do">
         <table class="table table-hover">
            <tr>
               <td width="20%" class="text-right qna-td">이름</td>
               <td width="80%" class="text-left qna-td">
                  <input type="text" name="om_id" size="13" id="om_id" value="${vo.om_id }">
                  <input type="hidden" name="no" value="${vo.no }">
                  <input type="hidden" name="page" value="${strpage }">
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td">제목</td>
               <td width="80%" class="text-left qna-td">
                  <input type="text" name="subject" size="50" id="subject" value="${vo.subject }">
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td" valign="top">내용</td>
               <td width="80%" class="text-left qna-td">
                  <textarea rows="10" cols="55" name="content" id="content">${vo.content }</textarea>
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td">비밀번호</td>
               <td width="80%" class="text-left qna-td">
                  <input type="password" name="pwd" size="13" id="pwd">
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center qna-td">
                  <input type="submit" class="btn btn-info btn-sm" value="수정">
                  <input type="button" class="btn btn-danger btn-sm" value="취소" onclick="javascript:history.back()">
               </td>
            </tr>
         </table>
         </form>
      </div>
   </div>
</body>
</html>