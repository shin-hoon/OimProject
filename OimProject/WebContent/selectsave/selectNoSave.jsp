<%@ page language="java"
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form method="post" action="selectsave/selectsave_ok.jsp">
		<div class="col-sm-12">
			<input type="hidden" name="cst_no" value="${num}"/>
			<input type="text" name="cst_subject" size="90" maxlength="15" value="맞춤모임 이름을 입력해주세요.(최대15글자)" />
		</div>
		<div>
			<div class="col-sm-1">
				<span>모임카테고리</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                	<input type="checkbox" name="cst_cg" value="교육" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강연</button>
                	<input type="checkbox" name="cst_cg" value="강연" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                	<input type="checkbox" name="cst_cg" value="세미나,컨퍼런스" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                	<input type="checkbox" name="cst_cg" value="문화,예술" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                	<input type="checkbox" name="cst_cg" value="방송,연예" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                	<input type="checkbox" name="cst_cg" value="취미활동" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                	<input type="checkbox" name="cst_cg" value="소모임,친목행사" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                	<input type="checkbox" name="cst_cg" value="공모전" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                	<input type="checkbox" name="cst_cg" value="전시,박람회" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                	<input type="checkbox" name="cst_cg" value="패션,뷰티" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                	<input type="checkbox" name="cst_cg" value="이벤트,파티" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">여행</button>
                	<input type="checkbox" name="cst_cg" value="여행" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                	<input type="checkbox" name="cst_cg" value="후원금 모금" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타</button>
                	<input type="checkbox" name="cst_cg" value="기타" class="hidden"/>
            	</span>
            	</div>
				
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임지역</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">서울</button>
                	<input type="checkbox" name="cst_loc" value="서울" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                	<input type="checkbox" name="cst_loc" value="부산,울산,경남" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                	<input type="checkbox" name="cst_loc" value="인천,경기" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                	<input type="checkbox" name="cst_loc" value="대전,충청,세종" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                	<input type="checkbox" name="cst_loc" value="광주,전라" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강원</button>
                	<input type="checkbox" name="cst_loc" value="강원" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                	<input type="checkbox" name="cst_loc" value="대구,경북" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">제주</button>
                	<input type="checkbox" name="cst_loc" value="제주" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                	<input type="checkbox" name="cst_loc" value="기타지역" class="hidden"/>
            	</span>
            	</div>
            	
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임요일</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주중</button>
                	<input type="checkbox" name="cst_day" value="주중" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주말</button>
                	<input type="checkbox" name="cst_day" value="주말" class="hidden"/>
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임가격</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">무료</button>
                	<input type="checkbox" name="cst_price" value="0" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000원</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000원~25,000원</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000원~40,000원</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000원~99,000원</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000원 ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden"/>
				</span>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" id="InsertBtn" value="검색저장"/>
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" name="saveNum" id="saveNum" value="${num}">
			</div>
			</form>
		</div>
</body>
</html>












