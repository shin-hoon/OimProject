<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 답변게시판 -->
<div class="container">
   <div class="row">
   <h1 style="font-weight: 900">문의 게시판Q&A</h1>
   <table class="table table-hover">
   <c:if test="${sessionScope.om_id != null}">
     <tr>
      <td class="text-left">
       <a href="iinsert.do" class="btn btn-warning">새글</a> 
      </td>
     </tr>
   </c:if>
   </table>
   <table class="table table-hover">
     <tr class="warning">
      <th width=10% class="text-center" style="font-size: 17px;">번호</th>
      <th width=45% class="text-center" style="font-size: 17px;">제목</th>
      <th width=15% class="text-center" style="font-size: 17px;">아이디</th>
      <th width=20% class="text-center" style="font-size: 17px;">작성일</th>
      <th width=10% class="text-center" style="font-size: 17px;">조회수</th>
     </tr>
     <c:forEach var="vo" items="${list }">
      <tr class="active">
       <td width=10% class="text-center">${vo.qa_no }</td>
       <td width=45% class="text-left">
       <c:if test="${vo.qa_group_tab>0 }">
       	<c:forEach begin="0" end="${vo.qa_group_tab }">
		        		&nbsp;&nbsp;
       	</c:forEach>
       		<img src="qaboard/image/re.gif">
       </c:if>
       <c:choose>
        <c:when test="${msg==vo.qa_subject }">
        	<span style="color:#999">${vo.qa_subject }</span>
        </c:when>
        <c:otherwise>
        	<a href="ccontent.do?no=${vo.qa_no }&page=${curpage}">${vo.qa_subject }</a>
        </c:otherwise>
       </c:choose>
       
      
      	 
       <c:if test="${today==vo.dbday}">
          <sup>
           <img src="qaboard/image/new.gif" width=30 height=30>
          </sup>
		</c:if>
		
       </td>
       <td width=15% class="text-center">${vo.om_id }</td>
       <td width=20% class="text-center">
        ${vo.dbday }</td>
       <td width=10% class="text-center">${vo.qa_hit }</td>
      </tr>
     </c:forEach>
   </table>
   <table class="table">
     <tr>
      <td class="text-left qna-td">
       Search:
       <select name="fs">
        <option value="om_id">아이디</option>
        <option value="qa_subject">제목</option>
        <option value="qa_content">내용</option>
       </select>
       <input type=text name="ss" size=13>
       <input type=submit value="찾기" class="btn btn-info btn-xs">
      </td>
      <td class="text-left"></td>
   	  <td class="text-right">
   	  <c:choose>
        <c:when test="${curpage>block }">
          <a href="llist.do?page=1" class="btn btn-warning btn-xs">◀◀</a>
          <a href="llist.do?page=${fromPage-1 }" class="btn btn-warning btn-xs">◀</a>
        </c:when>
        <c:otherwise>
          <span style="color:white" class="btn btn-warning btn-xs">◀◀</span>   
          <span style="color:white" class="btn btn-warning btn-xs">◀</span>
        </c:otherwise>
       </c:choose>
       <c:forEach var="i" begin="${fromPage }" end="${toPage }">
        <c:if test="${i==curpage }">
          [${i }]
        </c:if>
        <c:if test="${i!=curpage }">
          [<a href="llist.do?page=${i }">${i }</a>]
        </c:if>
       </c:forEach>
       <c:choose>
       <c:when test="${toPage<allpage }">
          <a href="llist.do?page=${toPage+1 }" class="btn btn-warning btn-xs">▶</a>
          <a href="llist.do?page=${allpage }" class="btn btn-warning btn-xs">▶▶</a>
        </c:when>
        <c:otherwise>
          <span style="color:white" class="btn btn-warning btn-xs">▶</span>
          <span style="color:white" class="btn btn-warning btn-xs">▶▶</span>
        </c:otherwise>
       </c:choose>
      </td>
      
     </tr>
    </table>

   </div>
  </div>
</body>
</html>