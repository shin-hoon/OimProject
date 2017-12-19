<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.qaboard.dao.*"%>
<jsp:useBean id="model" class="com.qaboard.model.qaboardModel"/>
<%
	model.qaboardUpdateData(request);
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link rel = "stylesheet" type = "text/css" href = "../css/bootstrap.min.css">
<script type="text/javascript" src = "../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "../js/bootstrap.mine.js"></script>
<style type="text/css">

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
         
         <form method="post" action="update_ok.jsp">
         <table class="table table-hover">
            <tr>
               <td width="20%" class="text-right qna-td">이름</td>
               <td width="80%" class="text-left qna-td">
                  <input type="text" name="om_id" size="13" id="om_id" value="${vo.om_id }">
                  <input type="hidden" name="qa_no" value="${vo.qa_no }">
                  <input type="hidden" name="page" value="${strpage }">
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td">제목</td>
               <td width="80%" class="text-left qna-td">
                  <input type="text" name="qa_subject" size="50" id="subject" value="${vo.qa_subject }">
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td" valign="top">내용</td>
               <td width="80%" class="text-left qna-td">
                  <textarea rows="10" cols="55" name="qa_content" id="content">${vo.qa_content }</textarea>
               </td>
            </tr>
            <tr>
               <td width="20%" class="text-right qna-td">비밀번호</td>
               <td width="80%" class="text-left qna-td">
                  <input type="password" name="qa_pwd" size="13" id="pwd">
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