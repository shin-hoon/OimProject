<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/table.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	var i=0;
	$('.reply_reply').click(function(){
		var no=$(this).attr("value");
		if(i==0)
		{
			$(this).text("취소");
			$('#in'+no).show();
			i=1;
		}
		else
		{
			$(this).text("댓글");
			$('#in'+no).hide();
			i=0;
		}
	});
	var u=0;
	$('.reply_update').click(function(){
		var no=$(this).attr("value");
		if(u==0)
		{
			$(this).text("취소");
			$('#up'+no).show();
			u=1;
		}
		else
		{
			$(this).text("수정");
			$('#up'+no).hide();
			u=0;
		}
	});
});
</script>
</head>
<body>
  <div id="news_area" class="container">
    <center>
       <h3>상세내용</h1>
       <table id="table_content" width=700 class="table table-hover">
        <tr>
         <th width=20% class="text-center warning qna-td">번호</th>
         <td width=30% align=center class="text-center qna-td">${vo.no }</td>
         <th width=20% class="text-center warning qna-td">작성일</th>
         <td width=30% align=center class="text-center qna-td">
           <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
         </td>
        </tr>
        <tr>
         <th width=20% class="text-center warning qna-td">아이디</th>
         <td width=30% align=center class="text-center qna-td">${vo.om_id }</td>
         <th width=20% class="text-center warning qna-td">조회수</th>
         <td width=30% align=center class="text-center qna-td">${vo.hit }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning qna-td">제목</th>
         <td colspan="3" align=left class="text-center qna-td">${vo.subject }</td>
        </tr>
        <tr>
          <td colspan="4" valign="top" class="text-left qna-td"
            height="200"><pre>${vo.content }</pre></td>
        </tr>
        <tr>
          <td colspan="4" align="right">
          <c:if test="${sessionScope.id != null || sessionScope.id=='admin'}">
            <a href="fbupdate.do?no=${vo.no }" class="btn btn-warning">수정</a>&nbsp;
            <a href="fbdelete.do?no=${vo.no }" class="btn btn-warning">삭제</a>&nbsp;
          </c:if>
           <a href="fblist.do" class="btn btn-warning">목록</a>
          </td>
        </tr>
       </table>
       <table id="table_content" width=700>
        <tr>
         <td align=right id="reply_view">댓글보기</td>
        </tr>
       </table>
       <div id="view">
        <table id="table_content" width=700>
          <c:forEach var="rvo" items="${list }">
           <tr>
            <td align=left>
             <c:if test="${rvo.group_tab>0 }">
              <c:forEach var="i" begin="1" end="${rvo.group_tab }">
                &nbsp;&nbsp;
              </c:forEach>
              <img src="fbboard/image/re.gif">
             </c:if>
             <img src="fbboard/image/icon.png" width=10 height=10>
             ${rvo.name}(${rvo.dbday })&nbsp;&nbsp;
              <c:if test="${rvo.dbday2==today }">
                <sup><img src="fbboard/image/new.gif"></sup>
              </c:if>
             <br>
             <c:if test="${rvo.group_tab>0 }">
              <c:forEach var="i" begin="1" end="${rvo.group_tab }">
                &nbsp;&nbsp;
              </c:forEach>
             </c:if>
             <span><pre>${rvo.msg }</pre></span>
            </td>
            <td align=right>
             <c:if test="${sessionScope.id!=null || sessionScope.id=='admin'}">
              <c:if test="${sessionScope.id==rvo.om_id or sessionScope.id=='admin'}">
               └<a class="reply_update" value="${rvo.no }">수정</a>&nbsp;
               └<a href="reply_delete.do?no=${rvo.no }&bno=${vo.no}">삭제</a>
              </c:if>&nbsp;
               └<a class="reply_reply" value="${rvo.no }">댓글</a>
             </c:if>
            </td>
           </tr>
           <tr id="in${rvo.no }" style="display:none">
           <td colspan="2">
	           <form method=post action="reply_reply_insert.do">
	           <input type="hidden" name=bno value="${vo.no }">
	           <input type="hidden" name=pno value="${rvo.no }">
	           <textarea rows="3" cols="80" style="float:left" name="msg"></textarea>
	           &nbsp;<input type=submit value="댓글달기" style="height:50px">
	           </form>
           </td>
         </tr>
         <tr id="up${rvo.no }" style="display:none">
          <td colspan="2">
           <form method=post action="reply_update.do">
           <input type="hidden" name=bno value="${vo.no }">
           <input type="hidden" name=no value="${rvo.no }">
           <textarea rows="3" cols="80" style="float:left" name="msg">${rvo.msg }</textarea>
           &nbsp;<input type=submit value="수정하기" style="height:50px">
           </form>
          </td>
         </tr>
          </c:forEach>
        </table>
       </div>
       <c:if test="${sessionScope.id!=null }">
        <table id="table_content" width=700>
         <tr>
          <td>
           <form method=post action="reply_new_insert.do">
           <input type="hidden" name=bno value="${vo.no }">
           <textarea rows="3" cols="80" style="float:left" name="msg"></textarea>
           &nbsp;<input type=submit value="댓글달기" style="height:50px">
           </form>
          </td>
         </tr>
        </table>
       </c:if>
    </center>
  </div>
</body>
</html>






