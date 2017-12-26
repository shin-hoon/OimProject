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
	 /*üũ�ڽ� �̺�Ʈ ��ũ��Ʈ*/
    $(function () {
    	 $('#DeleteBtn').click(function(){
    	 	var id = $('#id').val();
    		var saveNum = $('#saveNum').val();
    		$.ajax({
    			type:'post',
    			url:'selectsave/selectDelete.jsp',
    			data:{"id":id,"saveNum":saveNum},
    			success:function(response){
    				alert("�������"+saveNum+" ���� �Ǿ����ϴ�.");
    				location.href="selectsave.do";
    		 	}
    		 });
    	 });
    	 
    	$(function(){
    		$('#InsertBtn').click(function(){
    	   	 	var id = $('#id2').val();
    	   	 	if(id==""){
    	   	 		alert("�α��� �� �̿����ּ���");
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
						<span id="selectSave1">�������1</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=2" ${num==2?'class="on"':''}>
						<span id="selectSave2">�������2</span>
					</a>
				</li>
				<li>
					<a href="selectsave.do?saveNum=3" ${num==3?'class="on"':''}>
						<span id="selectSave3">�������3</span>
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
				<span>����ī�װ�</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='����'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='����'?'checked':'' }			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���̳�/���۷���</button>
                	<input type="checkbox" name="cst_cg" value="���̳�,���۷���" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='���̳�' or check=='���۷���'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��ȭ/����</button>
                	<input type="checkbox" name="cst_cg" value="��ȭ,����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='��ȭ' or check=='����'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���/����</button>
                	<input type="checkbox" name="cst_cg" value="���,����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='���' or check=='����'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���Ȱ��</button>
                	<input type="checkbox" name="cst_cg" value="���Ȱ��" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='���Ȱ��'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ҹ���/ģ�����</button>
                	<input type="checkbox" name="cst_cg" value="�Ҹ���,ģ�����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='�Ҹ���' or check=='ģ�����'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">������</button>
                	<input type="checkbox" name="cst_cg" value="������" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='������'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/�ڶ�ȸ</button>
                	<input type="checkbox" name="cst_cg" value="����,�ڶ�ȸ" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='����' or check=='�ڶ�ȸ'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�м�/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�м�,��Ƽ" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='�м�' or check=='��Ƽ'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�̺�Ʈ/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�̺�Ʈ,��Ƽ" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='�̺�Ʈ' or check=='��Ƽ'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='����'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ŀ��� ���</button>
                	<input type="checkbox" name="cst_cg" value="�Ŀ��� ���" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='�Ŀ��� ���'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ</button>
                	<input type="checkbox" name="cst_cg" value="��Ÿ" class="hidden"
                		<c:forEach var="check" items="${cst_cg}">
							${check=='��Ÿ'?'checked':''}			
						</c:forEach>
					/>
            	</span>
            	</div>
				
			</div>
			<div>
				<div class="col-sm-1">
				<span>��������</span>
				</div>
				<c:set var="cst_loc" value="${fn:split(vo.cst_loc,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�λ�/���/�泲</button>
                	<input type="checkbox" name="cst_loc" value="�λ�,���,�泲" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='�λ�' or check=='���' or check=='�泲'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">��õ/���</button>
                	<input type="checkbox" name="cst_loc" value="��õ,���" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='��õ' or check=='���'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/��û/����</button>
                	<input type="checkbox" name="cst_loc" value="����,��û,����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='����' or check=='��û' or check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/����</button>
                	<input type="checkbox" name="cst_loc" value="����,����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='����' or check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�뱸/���</button>
                	<input type="checkbox" name="cst_loc" value="�뱸,���" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='�뱸' or check=='���'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ����</button>
                	<input type="checkbox" name="cst_loc" value="��Ÿ����" class="hidden"
	                	<c:forEach var="check" items="${cst_loc}">
							${check=='��Ÿ����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	</div>
            	
			</div>
			<div>
				<div class="col-sm-1">
				<span>���ӿ���</span>
				</div>
				<c:set var="cst_day" value="${fn:split(vo.cst_day,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_day" value="����" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='����'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�ָ�</button>
                	<input type="checkbox" name="cst_day" value="�ָ�" class="hidden"
	                	<c:forEach var="check" items="${cst_day}">
							${check=='�ָ�'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>���Ӱ���</span>
				</div>
				<c:set var="cst_price" value="${fn:split(vo.cst_price,',')}"/>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_price" value="0" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='0'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000��</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='10000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000��~25,000��</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='25000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000��~40,000��</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='40000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000��~99,000��</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99000'?'checked':''}
						</c:forEach>   
                	/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000�� ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden"
	                	<c:forEach var="check" items="${cst_price}">
							${check=='99001'?'checked':''}
						</c:forEach>   
                	/>
				</span>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" value="�˻�����"/>
				<input type="button" id="DeleteBtn" value="�˻�����"/>
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" name="saveNum" id="saveNum" value="${num}">
			</div>
			</form>
		</div>
	</c:forEach>
	</c:if>			
	
	
	
		<div class="container col-lg-12 text-center" style="margin-top:5%">
			<c:if test="${view==0}">
				<b style="font-size:40px">��ü �������� : ${totalCount}��</b>
			</c:if>
			<c:if test="${view!=0}">
				<b style="font-size:40px">�˻��� �������� : ${totalCount}��</b>
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
										<c:if test="${vo.meet_charge=='����'}">
											<span class="label label-success" >
												${vo.meet_charge }
											</span>
										</c:if>
										<c:if test="${vo.meet_charge=='����'}">
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
									<a href="meeting_detail.do?meet_no=${vo.meet_no}&page=${curpage}" class="btn btn-primary btn-block">��û�ϱ�</a>
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
       		<li><a href="selectsave.do?page=${curpage<11?curpage:curpage-10}&saveNum=${num}">����</a></li>
       		<li><a href="selectsave.do?page=${curpage<2?curpage:curpage-1}&saveNum=${num}">��</a></li>
       				
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
       		<li><a href="selectsave.do?page=${curpage<totalpage?curpage+1:curpage}&saveNum=${num}">��</a></li>
            <li><a href="selectsave.do?page=${curpage<=totalpage-10?curpage+10:curpage}&saveNum=${num}">����</a></li>
		</ul>
	</div>
	<div class="container" style="height:300px;"></div>
</body>
</html>












