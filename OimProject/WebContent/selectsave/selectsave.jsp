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
	<script type="text/javascript" src="js/selectsave.js"></script>
</head>
<body>
	<div class="container">
		<div id="SubContentsTab" >
			<ul>
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
		<form method="post" action="selectsave/selectsave_ok.jsp">
		<div class="col-sm-12">
			<div class="form-group">
				<input type="hidden" name="cst_no" value="${view}" />
				<div class="input-group" style="width:100%">
					<input type="text" class="form-control"  
						id="validate-text" placeholder="������� �̸��� �Է����ּ���.(�ִ�15����)"
						name="cst_subject" maxlength="15" value="${vo.subject}"  
						required>
					<span class="input-group-addon danger"><span class="glyphicon glyphicon-remove"></span></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
			<c:set var="cst_cg" value="${fn:split(vo.cst_cg,',')}"/>
				<span class="btn btn-warning border-trim">����ī�װ�</span>				
				
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
			<div class="col-sm-3">
				<c:set var="cst_loc" value="${fn:split(vo.cst_loc,',')}"/>
				<span class="btn btn-warning border-trim">��������</span>
				
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
			<div class="col-sm-3">
				<c:set var="cst_day" value="${fn:split(vo.cst_day,',')}"/>
				<span class="btn btn-warning border-trim">���ӿ���</span>
				
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
			<div class="col-sm-3">
				<c:set var="cst_price" value="${fn:split(vo.cst_price,',')}"/>
				<span class="btn btn-warning border-trim">���Ӱ���</span>
				
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
			<div class="text-center col-sm-12 border-submit"">
				<input type="submit" class="btn btn-primary btn-sm outline" value="�˻�����"/>
				<input type="button" class="btn btn-primary btn-sm outline" id="DeleteBtn" value="�˻�����"/>
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
       		<c:forEach var="i"  begin="${num1}" end="${num1==1?num1+8:num1+9}">
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












