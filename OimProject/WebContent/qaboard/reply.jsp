<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.qnarow{
  margin: 0px auto;
  width: 650px;
}
.qna-th,.qna-td{
  font-family: 맑은 고딕;
  font-size: 10pt;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row qnarow">
    <div style="height:70px"></div>
    <h3>답변하기</h3>
    <form method="post" action="rreplyok.do">
    <table class="table table-hover">
     <tr>
      <td width=20% class="text-right qna-td">이름</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=om_id size=13 id="om_id">
       <input type="hidden" name=pno value="${pno }">
       <input type="hidden" name=page value="${page }">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">제목</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=qa_subject size=50 id="qa_subject">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td" valign="top">내용</td>
      <td width=80% class="text-left qna-td">
       <textarea rows="10" cols="55" name=qa_content id="qa_content"></textarea>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">비밀번호</td>
      <td width=80% class="text-left qna-td">
       <input type=password name=qa_pwd size=10 id="qa_pwd">
      </td>
     </tr>
     <tr>
      <td colspan="2" class="text-center qna-td">
       <input type=submit class="btn btn-info btn-sm"
        value="답변">
       <input type=button class="btn btn-danger btn-sm"
        value="취소" onclick="javascript:history.back()">
      </td>
     </tr>
    </table>
    </form>
   </div>
  </div>
</body>

</html>