<%@ page language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="model" class="com.sist.SelectSaveModel.SelectSaveModel" />
<%
	String id = "jeong"; session.setAttribute("id", id);
	model.meetingList(request,session);
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	
	<link href="../css/oim_style.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/bootstrap.css">
	
	<style type="text/css">
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
		<form method="post" action="../selectsave/selectsave_ok.jsp">
		<div class="col-sm-12">
			<input type="hidden" name="cst_no" value="1" />
			<input type="text" name="cst_subject" size="90" maxlength="50" value="맞춤알바 이름을 입력해주세요.(최대15글자)" /><br/>
		</div>
		<div>
			<div class="col-sm-1">
				<span>모임카테고리</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">교육</button>
                	<input type="checkbox" name="cst_cg" value="교육" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강연</button>
                	<input type="checkbox" name="cst_cg" value="강연" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">세미나/컨퍼런스</button>
                	<input type="checkbox" name="cst_cg" value="세미나,컨퍼런스" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">문화/예술</button>
                	<input type="checkbox" name="cst_cg" value="문화,예술" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">방송/연예</button>
                	<input type="checkbox" name="cst_cg" value="방송,연예" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">취미활동</button>
                	<input type="checkbox" name="cst_cg" value="취미활동" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">소모임/친목행사</button>
                	<input type="checkbox" name="cst_cg" value="소모임,친목행사" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">공모전</button>
                	<input type="checkbox" name="cst_cg" value="공모전" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">전시/박람회</button>
                	<input type="checkbox" name="cst_cg" value="전시,박람회" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">패션/뷰티</button>
                	<input type="checkbox" name="cst_cg" value="패션,뷰티" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">이벤트/파티</button>
                	<input type="checkbox" name="cst_cg" value="이벤트,파티" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">여행</button>
                	<input type="checkbox" name="cst_cg" value="여행" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">후원금 모금</button>
                	<input type="checkbox" name="cst_cg" value="후원금 모금" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타</button>
                	<input type="checkbox" name="cst_cg" value="기타" class="hidden" />
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
                	<input type="checkbox" name="cst_loc" value="서울" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">부산/울산/경남</button>
                	<input type="checkbox" name="cst_loc" value="부산,울산,경남" class="hidden" />
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">인천/경기</button>
                	<input type="checkbox" name="cst_loc" value="인천,경기" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대전/충청/세종</button>
                	<input type="checkbox" name="cst_loc" value="대전,충청,세종" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">광주/전라</button>
                	<input type="checkbox" name="cst_loc" value="광주,전라" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">강원</button>
                	<input type="checkbox" name="cst_loc" value="강원" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">대구/경북</button>
                	<input type="checkbox" name="cst_loc" value="대구,경북" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">제주</button>
                	<input type="checkbox" name="cst_loc" value="제주" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">기타지역</button>
                	<input type="checkbox" name="cst_loc" value="기타지역" class="hidden" />
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
                	<input type="checkbox" name="cst_day" value="주중" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">주말</button>
                	<input type="checkbox" name="cst_day" value="주말" class="hidden" />
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
                	<input type="checkbox" name="cst_price" value="0" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000원</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000원~25,000원</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000원~40,000원</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000원~99,000원</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000원 ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden" />
				</span>
				</div>
			</div>
			<div><input type="submit" value="검색저장"/></div>
			</form>
		</div>
	
	
		<div class="container" style="margin-top:5%">
			<div class="col-lg-12 text-center">
				<ul class="thumbnails">
				<c:forEach var="vo" items="${list}" >
						<div class="col-sm-3">
						<div class="thumbnail">
							<img src="${vo.meet_poster}" >
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
								<p style="text-align:left;clear:both;">${vo.meet_start } ~ 1/5</p>
								<p class="p_add" style="height:22px;overflow:hidden;">
									${vo.meet_subject }
								</p>
								<p align="center">
									<a href="#" class="btn btn-primary btn-block">신청하기</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
				</ul>
			</div>
		</div>

	<div class="container text-center">
		<span>
       		<a href="../selectsave/selectsave.jsp?page=${curpage<11?curpage:curpage-10 }" class="btn btn-warning btn-sm">◀◀</a>&nbsp;&nbsp;&nbsp;
       		<a href="../selectsave/selectsave.jsp?page=${curpage<2?curpage:curpage-1 }" class="btn btn-warning btn-sm">◀</a>&nbsp;&nbsp;&nbsp;
       				
       		<fmt:parseNumber var="num" value="${curpage/10}" integerOnly="true"/>
       		<c:set var="num" value="${num<=0?1:num*10}"/>  
       		<c:forEach var="i"  begin="${num}" end="${num==1?num+8:num+9}">
       			<c:choose>
       				<c:when test="${i > totalpage }"></c:when>
       				<c:when test="${i==curpage}">
	    				<a href="selectsave.jsp?page=${i}">
    						<b style="color:black;font-size:40px">${i}</b>
       					</a>
       				</c:when>
       				<c:when test="${i <= totalpage}">
       					<a href="selectsave.jsp?page=${i }">
    	   					<b style="color:gray;font-size:25px">${i}</b>
       					</a>
       				</c:when>
       			</c:choose>
       		</c:forEach>
       		&nbsp; &nbsp;
       		<a href="../selectsave/selectsave.jsp?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-warning btn-sm">▶</a> &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="../selectsave/selectsave.jsp?page=${curpage<=totalpage-10?curpage+10:curpage}" class="btn btn-warning btn-sm">▶▶</a>&nbsp;
		</span>
	</div>
	<div class="container" style="height:300px;"></div>
</body>
</html>












