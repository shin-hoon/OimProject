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
			<input type="text" name="cst_subject" size="90" maxlength="15" value="������� �̸��� �Է����ּ���.(�ִ�15����)" />
		</div>
		<div>
			<div class="col-sm-1">
				<span>����ī�װ�</span>
			</div>
				<div class="col-sm-11">
				<span class="button-checkbox">
	                <button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���̳�/���۷���</button>
                	<input type="checkbox" name="cst_cg" value="���̳�,���۷���" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��ȭ/����</button>
                	<input type="checkbox" name="cst_cg" value="��ȭ,����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���/����</button>
                	<input type="checkbox" name="cst_cg" value="���,����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">���Ȱ��</button>
                	<input type="checkbox" name="cst_cg" value="���Ȱ��" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ҹ���/ģ�����</button>
                	<input type="checkbox" name="cst_cg" value="�Ҹ���,ģ�����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">������</button>
                	<input type="checkbox" name="cst_cg" value="������" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/�ڶ�ȸ</button>
                	<input type="checkbox" name="cst_cg" value="����,�ڶ�ȸ" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�м�/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�м�,��Ƽ" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�̺�Ʈ/��Ƽ</button>
                	<input type="checkbox" name="cst_cg" value="�̺�Ʈ,��Ƽ" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_cg" value="����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�Ŀ��� ���</button>
                	<input type="checkbox" name="cst_cg" value="�Ŀ��� ���" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ</button>
                	<input type="checkbox" name="cst_cg" value="��Ÿ" class="hidden"/>
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
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�λ�/���/�泲</button>
                	<input type="checkbox" name="cst_loc" value="�λ�,���,�泲" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
		           	<button type="button" class="btn checkbtn" data-color="primary">��õ/���</button>
                	<input type="checkbox" name="cst_loc" value="��õ,���" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/��û/����</button>
                	<input type="checkbox" name="cst_loc" value="����,��û,����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����/����</button>
                	<input type="checkbox" name="cst_loc" value="����,����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�뱸/���</button>
                	<input type="checkbox" name="cst_loc" value="�뱸,���" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">����</button>
                	<input type="checkbox" name="cst_loc" value="����" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">��Ÿ����</button>
                	<input type="checkbox" name="cst_loc" value="��Ÿ����" class="hidden"/>
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
                	<input type="checkbox" name="cst_day" value="����" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">�ָ�</button>
                	<input type="checkbox" name="cst_day" value="�ָ�" class="hidden"/>
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
                	<input type="checkbox" name="cst_price" value="0" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">~ 10,000��</button>
                	<input type="checkbox" name="cst_price" value="10000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">10,000��~25,000��</button>
                	<input type="checkbox" name="cst_price" value="25000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">25,000��~40,000��</button>
                	<input type="checkbox" name="cst_price" value="40000" class="hidden"/>
            	</span>
				<span class="button-checkbox">
	            	<button type="button" style="padding-right:13.5%" class="btn checkbtn" data-color="primary">40,000��~99,000��</button>
                	<input type="checkbox" name="cst_price" value="99000" class="hidden"/>
            	</span>
            	<span class="button-checkbox">
	            	<button type="button" class="btn checkbtn" data-color="primary">99,000�� ~</button>
                	<input type="checkbox" name="cst_price" value="99001" class="hidden"/>
				</span>
				</div>
			</div>
			<div class="text-center">
				<input type="submit" id="InsertBtn" value="�˻�����"/>
				<input type="hidden" id="id" value="${id}">
				<input type="hidden" name="saveNum" id="saveNum" value="${num}">
			</div>
			</form>
		</div>
</body>
</html>












