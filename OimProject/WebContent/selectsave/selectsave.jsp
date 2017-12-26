<%@ page language="java"
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="model" class="com.oim.model.SelectSaveModel" />
<%
	model.meetingList(request,session);	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="css/selectsave.css">
	<!-- <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	 --><!-- <link href="../css/oim_style.css" rel="stylesheet"> -->
	<!-- <link rel="stylesheet" href="../css/bootstrap.css"> -->
	
	<style type="text/css">
		*{
			color:black;
		}
		.label {
			padding: 10px 8px 10px;
		}
		@media (min-width: 768px)   {
  			.label {
    			padding: .0em .0em .0em;
  			}
		}
		@media (min-width: 992px)   {
  			.label {
    			padding: 10px 8px 10px;
  			}
		}
		
	.checkbtn{
        text-align:left;
        font-size: 12px;
        font-weight: bold;
        margin: 3px;
        width: 13%;
    }
	</style>
<script type="text/javascript">
	 /*체크박스 이벤트 스크립트*/
    $(function () {
    	 $('#DeleteBtn').click(function(){
    	 	var id = $('#id').val();
    		var saveNum = $('#saveNum').val();
    		$.ajax({
    			type:'post',
    			url:'selectsave/selectDelete.jsp',
    			data:{"id":id,"saveNum":saveNum},
    			success:function(response){
    				alert("맞춤모임"+saveNum+" 삭제 되었습니다.");
    				location.href="selectsave.do";
    		 	}
    		 });
    	 });
    	 
    	$(function(){
    		$('#InsertBtn').click(function(){
    	   	 	var id = $('#id2').val();
    	   	 	if(id==""){
    	   	 		alert("로그인 후 이용해주세요");
    	   	 	}
    	   	 });
    	});   		
    	 
    $('.button-checkbox').each(function () {
        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };

        /*Event Handlers*/
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });
        /*Actions*/
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $button.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$button.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $button
                    .removeClass('btn-default')
                    .addClass('btn-' + color + ' active');
            }
            else {
                $button
                    .removeClass('btn-' + color + ' active')
                    .addClass('btn-default');
            }
        }

        // Initialization
        function init() { 

            updateDisplay();

            // Inject the icon if applicable
            if ($button.find('.state-icon').length == 0) {
                $button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
            }
        }
        init();
    });
});
    </script>
    
</head>
<body>
	<div class="container">
		<div id="SubContentsTab" >
			<ul >
				<li>
					<a href="selectsave.do?saveNum=1" ${num==1?'class="on"':''}>
						<span id="selectSave1">맞춤모임1</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=2" ${num==2?'class="on"':''}>
						<span id="selectSave2">맞춤모임2</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=3" ${num==3?'class="on"':''}>
						<span id="selectSave3">맞춤모임3</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<c:if test="${view==0}">
	<jsp:include page="../selectsave/selectNoSave.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${view!=0}">
	<c:forEach var="vo" items="${checkBox}">
	<div class="container">
		<c:set var="cst_cg" value="${fn:split(vo.cst_cg,',')}"/>
		<form method="post" action="selectsave/selectsave_ok.jsp">
		<div class="col-sm-12">
			<input type="hidden" name="cst_no" value="${view}" />
			<input type="text" name="cst_subject" size="90" maxlength="15" value="${vo.subject}" />
		</div>
		<div>
			<div class="col-sm-1">
				<span>모임카테고리</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                	<input type="checkbox" name="cst_cg" value="교육" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='교육'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강연</button>
                	<input type="checkbox" name="cst_cg" value="강연" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='강연'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                	<input type="checkbox" name="cst_cg" value="세미나,컨퍼런스" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='세미나' or check=='컨퍼런스'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                	<input type="checkbox" name="cst_cg" value="문화,예술" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='문화' or check=='예술'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                	<input type="checkbox" name="cst_cg" value="방송,연예" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='방송' or check=='연예'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                	<input type="checkbox" name="cst_cg" value="취미활동" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='취미활동'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                	<input type="checkbox" name="cst_cg" value="소모임,친목행사" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='소모임' or check=='친목행사'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                	<input type="checkbox" name="cst_cg" value="공모전" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='공모전'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                	<input type="checkbox" name="cst_cg" value="전시,박람회" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='전시' or check=='박람회'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                	<input type="checkbox" name="cst_cg" value="패션,뷰티" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='패션' or check=='뷰티'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                	<input type="checkbox" name="cst_cg" value="이벤트,파티" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='이벤트' or check=='파티'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">여행</button>
                	<input type="checkbox" name="cst_cg" value="여행" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='여행'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                	<input type="checkbox" name="cst_cg" value="후원금 모금" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='후원금 모금'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타</button>
                	<input type="checkbox" name="cst_cg" value="기타" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='기타'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	</div>
				
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임지역</span>
				</div>
				<c:set var="cst_loc" value="${fn:split(vo.cst_loc,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">서울</button>
                	<input type="checkbox" name="cst_loc" value="서울" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='서울'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                	<input type="checkbox" name="cst_loc" value="부산,울산,경남" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='부산' or check=='울산' or check=='경남'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                	<input type="checkbox" name="cst_loc" value="인천,경기" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='인천' or check=='경기'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                	<input type="checkbox" name="cst_loc" value="대전,충청,세종" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='대전' or check=='충청' or check=='세종'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                	<input type="checkbox" name="cst_loc" value="광주,전라" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='광주' or check=='전라'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강원</button>
                	<input type="checkbox" name="cst_loc" value="강원" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='강원'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                	<input type="checkbox" name="cst_loc" value="대구,경북" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='대구' or check=='경북'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">제주</button>
                	<input type="checkbox" name="cst_loc" value="제주" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='제주'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                	<input type="checkbox" name="cst_loc" value="기타지역" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='기타지역'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	</div>
            	
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임요일</span>
				</div>
				<c:set var="cst_day" value="${fn:split(vo.cst_day,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주중</button>
                	<input type="checkbox" name="cst_day" value="주중" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='주중'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주말</button>
                	<input type="checkbox" name="cst_day" value="주말" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='주말'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>모임가격</span>
				</div>
				<c:set var="cst_price" value="${fn:split(vo.cst_price,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">무료</button>
                	<input type="checkbox" name="cst_price" value="0" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='0'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000원</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='10000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000원~25,000원</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='25000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000원~40,000원</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='40000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000원~99,000원</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000원 ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99001'?'checked':''}
						</c:forEach>   
                	/>
				</span>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" value="검색저장"/>
				<input type="button" id="DeleteBtn" value="검색삭제"/>
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" name="saveNum" id="saveNum" value="${num}">
			</div>
			</form>
		</div>
	</c:forEach>
	</c:if>			
	
	
	
		<div class="container col-lg-12 text-center" style="margin-top:5%">
			<c:if test="${view==0}">
				<b style="font-size:40px">전체 모임정보 : ${totalCount}건</b>
			</c:if>
			<c:if test="${view!=0}">
				<b style="font-size:40px">검색된 모임정보 : ${totalCount}건</b>
			</c:if>
		</div>
		<div class="container">
			<div class="col-lg-12 text-center">
				<ul class="thumbnails">
				<c:forEach var="vo" items="${list}" >
						<div class="col-sm-3">
						<div class="thumbnail">
							<a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}"><img src="${vo.meet_poster}" ></a>
							<div class="caption">
								<div>
									<li class="li_add">
										<c:if test="${vo.meet_charge=='무료'}">
											<span class="label label-success" >
												${vo.meet_charge }
											</span>
										</c:if>
										<c:if test="${vo.meet_charge=='유료'}">
											<span class="label label-danger" >
												${vo.meet_charge }
											</span>
										</c:if>
									</li>
									<li class="li_add">
										<span class="label label-primary">
											${vo.meet_cg }
										</span>
									</li>
								</div>
								<p style="text-align:left;clear:both;">${vo.meet_start} ~ ${vo.meet_end}</p>
								<p class="p_add" style="height:22px;overflow:hidden;">
									${vo.meet_subject }
								</p>
								<p align="center">
									<a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}" class="btn btn-primary btn-block">신청하기</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</ul>
			</div>
		</div>

	
	<div class="container text-center">
		<ul class="pagination">
       		<li><a href="selectsave.do?page=${curpage<11?curpage:curpage-10}&saveNum=${num}">◀◀</a></li>
       		<li><a href="selectsave.do?page=${curpage<2?curpage:curpage-1}&saveNum=${num}">◀</a></li>
       				
       		<fmt:parseNumber var="num1" value="${curpage/10}" integerOnly="true"/>
       		<c:set var="num1" value="${num1<=0?1:num1*10}"/>  
       		<c:forEach var="i"  begin="${num1}" end="${num==1?num+8:num+9}">
       			<c:choose>
       				<c:when test="${i > totalpage }"></c:when>
       				<c:when test="${i==curpage}">
	    				<li class="active">
	    					<a href="selectsave.do?page=${i}&saveNum=${num}">	${i} </a>
	    				</li>
       				</c:when>
       				<c:when test="${i <= totalpage}">
       					<li>
       						<a href="selectsave.do?page=${i}&saveNum=${num}"> ${i} </a>
       					</li>
       				</c:when>
       			</c:choose>
       		</c:forEach>
       		<li><a href="selectsave.do?page=${curpage<totalpage?curpage+1:curpage}&saveNum=${num}">▶</a></li>
            <li><a href="selectsave.do?page=${curpage<=totalpage-10?curpage+10:curpage}&saveNum=${num}">▶▶</a></li>
		</ul>
	</div>
	<div class="container" style="height:300px;"></div>
</body>
</html>












