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
   <h3>문의 게시판Q&A</h3>
   <table class="table table-hover">
     <tr>
      <td class="text-left">
       <a href="ntinsert.do" class="btn btn-warning">새글</a>
      </td>
     </tr>
   </table>
   <table class="table table-hover">
     <tr class="success">
      <th width=15% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=25% class="text-center">작성일</th>
      <th width=15% class="text-center">조회수</th>
     </tr>
     <c:forEach var="vo" items="${list }">
      <tr>
       <td width=15% class="text-center">${vo.nt_no }</td>
       <td width=45% class="text-left">
       <a href="ntcontent.do?no=${vo.nt_no }&page=${curpage}">${vo.nt_subject }</a>
       	<!-- 
       		content.do === DispatcherServlet === Model
       			request						request
       			=======
       			no : 10
       			page : 1
       	 -->
       </td>
       <td width=25% class="text-center">
        <fmt:formatDate value="${vo.nt_regdate }" 
               pattern="yyyy-MM-dd"/></td>
       <td width=15% class="text-center">${vo.nt_hit }</td>
      </tr>
     </c:forEach>
   </table>
   <table class="table">
     <tr>
      <td class="text-left qna-td">
       Search:
       <select name="fs">
        <option value="nt_subject">제목</option>
        <option value="nt_content">내용</option>
       </select>
       <input type=text name="ss" size=13>
       <input type=submit value="찾기" class="btn btn-info btn-xs">
      </td>
      <td class="text-left"></td>
   	  <td class="text-right">
   	  <a href="ntlist.do?page=${curpage<10?1:curpage-10 }" class="btn btn-warning btn-xs">◀◀</a>&nbsp;
   	  <a href="ntlist.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-warning btn-xs">◀</a>&nbsp;
   	  <fmt:parseNumber var="num" value="${curpage/10}" integerOnly="true"/>
             <c:set var="num" value="${num<=0?1:num*10}"/>  
             <c:forEach var="i"  begin="${num}" end="${num==1?num+8:num+9}">
                <c:choose>
                   <c:when test="${i > totalpage }"></c:when>
                   <c:when test="${i==curpage}">
                   <a href="ntlist.do?page=${i}">
                      <b>(${i})</b>
                      </a>
                   </c:when>
                   <c:when test="${i <= totalpage}">
                      <a href="ntlist.do?page=${i }">
                         <b>(${i})</b>
                      </a>
                   </c:when>
                </c:choose>
             </c:forEach>
   	  <a href="ntlist.do?page=${curpage<totalpage?curpage+1:curpage }"class="btn btn-warning btn-xs">▶</a>&nbsp;&nbsp;
   	  <a href="ntlist.do?page=${totalpage}" class="btn btn-warning btn-xs">▶▶</a>
   	  ${curpage } page / ${totalpage } pages
   	  </td>
      
     </tr>
    </table>

   </div>
  </div>
</body>
</html>