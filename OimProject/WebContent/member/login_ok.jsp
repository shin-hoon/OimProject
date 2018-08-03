<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${count eq 1}">
		<script>
		$(function(){
			 $('#result').text("아이디가 존재하지 않습니다.");
             $('#login_id').val("");
             $('#login_pwd').val("");
             $('#login_id').focus();
		});
		</script>
	</c:when>
	<c:when test="${count eq 2}">
		<script>
		$(function(){
			 $('#result').text("비밀번호가 틀립니다.");
	         $('#login_pwd').val("");
	         $('#login_pwd').focus();
		});
		</script>
	</c:when>
	<c:otherwise>
		<script>
		history.go(0);
		</script>
	</c:otherwise>
</c:choose>
