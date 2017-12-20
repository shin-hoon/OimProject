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
	 /*üũ�ڽ� �̺�Ʈ ��ũ��Ʈ*/
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
			<input type="text" name="cst_subject" size="90" maxlength="50" value="����˹� �̸��� �Է����ּ���.(�ִ�15����)" /><br/>
		</div>
		<div>
			<div class="col-sm-1">
				<span>����ī�װ�</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���̳�/���۷���</button>
                	<input type="checkbox" name="cst_cg" value="���̳�,���۷���" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��ȭ/����</button>
                	<input type="checkbox" name="cst_cg" value="��ȭ,����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���/����</button>
                	<input type="checkbox" name="cst_cg" value="���,����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���Ȱ��</button>
                	<input type="checkbox" name="cst_cg" value="���Ȱ��" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ҹ���/ģ�����</button>
                	<input type="checkbox" name="cst_cg" value="�Ҹ���,ģ�����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">������</button>
                	<input type="checkbox" name="cst_cg" value="������" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/�ڶ�ȸ</button>
                	<input type="checkbox" name="cst_cg" value="����,�ڶ�ȸ" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�м�/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�м�,��Ƽ" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�̺�Ʈ/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�̺�Ʈ,��Ƽ" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ŀ��� ���</button>
                	<input type="checkbox" name="cst_cg" value="�Ŀ��� ���" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ</button>
                	<input type="checkbox" name="cst_cg" value="��Ÿ" class="hidden" />
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>��������</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�λ�/���/�泲</button>
                	<input type="checkbox" name="cst_loc" value="�λ�,���,�泲" class="hidden" />
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">��õ/���</button>
                	<input type="checkbox" name="cst_loc" value="��õ,���" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/��û/����</button>
                	<input type="checkbox" name="cst_loc" value="����,��û,����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/����</button>
                	<input type="checkbox" name="cst_loc" value="����,����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�뱸/���</button>
                	<input type="checkbox" name="cst_loc" value="�뱸,���" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ����</button>
                	<input type="checkbox" name="cst_loc" value="��Ÿ����" class="hidden" />
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>���ӿ���</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_day" value="����" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�ָ�</button>
                	<input type="checkbox" name="cst_day" value="�ָ�" class="hidden" />
            	</span>
            	</div>
			</div>
			<div>
				<div class="col-sm-1">
				<span>���Ӱ���</span>
				</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_price" value="0" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000��</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000��~25,000��</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000��~40,000��</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden" />
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000��~99,000��</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden" />
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000�� ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden" />
				</span>
				</div>
			</div>
			<div><input type="submit" value="�˻�����"/></div>
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
								<p style="text-align:left;clear:both;">${vo.meet_start } ~ 1/5</p>
								<p class="p_add" style="height:22px;overflow:hidden;">
									${vo.meet_subject }
								</p>
								<p align="center">
									<a href="#" class="btn btn-primary btn-block">��û�ϱ�</a>
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
       		<a href="../selectsave/selectsave.jsp?page=${curpage<11?curpage:curpage-10 }" class="btn btn-warning btn-sm">����</a>&nbsp;&nbsp;&nbsp;
       		<a href="../selectsave/selectsave.jsp?page=${curpage<2?curpage:curpage-1 }" class="btn btn-warning btn-sm">��</a>&nbsp;&nbsp;&nbsp;
       				
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
       		<a href="../selectsave/selectsave.jsp?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-warning btn-sm">��</a> &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="../selectsave/selectsave.jsp?page=${curpage<=totalpage-10?curpage+10:curpage}" class="btn btn-warning btn-sm">����</a>&nbsp;
		</span>
	</div>
	<div class="container" style="height:300px;"></div>
</body>
</html>












