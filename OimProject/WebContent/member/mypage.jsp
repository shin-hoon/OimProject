<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oim.member.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������</title>

<!--�߰��Ѱ�  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!--�߰��Ѱ�  ��-->



<style type="text/css">

.tab-pane { color:black;}

/*���̺�Ÿ��: �������*/
table td:last-child {border-right:none;}
table tr:last-child td {border-bottom:none;}
/* ���̺�Ÿ��->�������  �� */

/*���̺� ������  */
.oim-icon{
   margin-right:2%;
   float:left;
}
.oim-mypage{
   margin:5%;
}

.li_add{
   float:left; 
   list-style:none;
   display:block;
   margin-top:5px;
   margin-bottom:5px;
}

ul li {
	font-family: 'Open Sans', sans-serif;
	font-size: 15px;
	font-weight: 300;
	line-height: 23px;
	letter-spacing: 0.2px;
	color: #444444;
}
body{
	color: black;
}
</style>



</head>
<body>



   
   
   
<!-- ī�װ� �� -->
   <div class="container">
	   	<!-- Mypage ���� �ΰ� �׺� -->
	   <nav class="mypage" style="background-color:#2E2E2E; height:80px;">
	      <div class="container text-left">
	         <h2 style="color:#ffffff;"><b>Mypage</b></h2>
	      </div>
	   </nav>
	<!-- Mypage ���� �ΰ� �׺�  ��-->
      <div class="tabtable" > 
        <ul class="nav nav-tabs" ><br>
          <li class="active"><a href="#tab1" data-toggle="tab">Ȩ</a></li>
          <li><a href="#tab2" data-toggle="tab">ȸ����������</a></li>
          <li><a href="#tab3" data-toggle="tab">��û����</a></li>
          <li><a href="#tab4" data-toggle="tab">�򳻿�</a></li>
          <li><a href="#tab5" data-toggle="tab">ȸ��Ż��</a></li>
        </ul>
         <div class="tab-content" style="border: 1px solid #eee">
        
<!--���� �ǰ����ϰ� �Ϸ���, ��� �Ǹ��� ������ ID�� .tab-pane�� ����� �� ��θ� .tab-content�� ���´� -->      
<!-- ���������� Ȩ -->
           <div class="tab-pane active" id="tab1"> 
             <div class="oim-mypage home">
                <span class="oim-icon glyphicon glyphicon-user"></span>${sessionScope.name }���� �����������Դϴ�
             </div>
         <!-- ȸ������ ���̺� -->
             <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-envelope"></span>�̸���
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }</td>
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-earphone"></span>�޴���ȭ
                  </td>
                  <td width=75% class="text-center" id="tel">${sessionScope.tel }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-heart"></span>����
                  </td>
                  <td width=75% class="text-center" id="gender">${sessionScope.gender }</td>                  
               </tr>
               <tr>
                  <td width=25% class="text-right">
                     <span class="oim-icon glyphicon glyphicon-calendar"></span>������
                  </td>
                  <td width=75% class="text-center" id="regdate">${sessionScope.regdate }</td>                  
               </tr>
            </table>
          </div>
          
          
<!-- ȸ���������� -->
          <div class="tab-pane" id="tab2">
             <div class="oim-mypage update">
               <span class=" oim-icon glyphicon glyphicon-pencil"></span><h4>ȸ������ ����</h4>
               <h6>
                  ���̵�� ���Ǵ� �̸����� �����Ͻ� �� �����ϴ�.
                  <br><br><br>
                  <��й�ȣ ����� ���ǻ���>
                  <br><br>
                  - ����������ȣ�� ���� �ּ� 3���� �̳����� ���������� ��й�ȣ�� ������ �ֽô� �� �����ϴ�.<br>
                  - ��й�ȣ�� �����ȣ�� Ÿ ����Ʈ�� ���� ��� ����Ǳ� �����ϴ�.<br>
                  - �ֹι�ȣ,��ȭ��ȣ,���� �� ���������� ������ ���ڳ� ���ڴ� ���Ȼ� ������ �����Ƿ� ����� ������ �ּ���.<br>   
               </h6>
            </div>
             
         <!-- ȸ������ ���̺� -->
            <form method="post" action="../member/update_ok.jsp">
                <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-envelope"></span>�̸���
                     </td>
                     <!-- db���;���  -->
                     <td width=70% class="text-center" name="id">${sessionScope.id }</td>
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-earphone"></span>�޴���ȭ
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=tel size=30 id="tel" value=${sessionScope.tel }>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>���ο� ��й�ȣ �Է� 
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=pwd size=30 id="pwd"><br>
                        <h6 style="color:#DF013A;">*��й�ȣ�� 8~24���� �̳��� �Է��� �ּ���.</h6>
                     </td>                  
                  </tr>
                  <tr>
                     <td width=30% class="text-right">
                        <span class="oim-icon glyphicon glyphicon-lock"></span>��й�ȣ ���Է�
                     </td>
                     <td width=70% class="text-center">
                        <input type=text name=pwd_ok size=30 id="pwd_ok">
                        <h6 style="color:#DF013A;">*���ο� ��й�ȣ ����Ȯ���� ���Ͽ� �ٽ� �ѹ� �Է��� �ּ���.</h6>
                     </td>                  
                  </tr>
                  <tr>
                     <td colspan="2" class="text-center">
                        <input type="submit" class="btn btn-info btn-sm" value="�����ϱ�">
                        <input type=button class="btn btn-danger btn-sm" value="���" onclick="javascript:history.back()">
                     </td>
                    </tr>
               </table>
            </form>
          </div>
          
          
          
<!-- ��û���� -->       
          <div class="tab-pane" id="tab3">
             <div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-bookmark"></span><h4>��û����</h4>
               <!-- ��û���� ã���ư -->
                <div class="input-group" style="width:30%; float:right">
                  <input type="text" class="form-control" placeholder="Search for...">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button">ã��</button>
                  </span>
                </div><!-- /input-group -->
            </div>
            <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <thead>
                  <tr><!-- ������ �ǹ� -->
                     <th width=10% class="text-center">��ȣ</th><!-- �� -->
                     <th width=65% class="text-center">����</th>
                     <th width=25% class="text-center">����</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">��ȣ</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job�ƶ�! IT���</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">��������</span></li>
                               <br><br><br><br>
                                              ���ӱⰣ:<br>
                                              �������:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="��ûȮ��">
                        <input type=button class="btn btn-danger btn-sm" value="��û���">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">��ȣ</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job�ƶ�! IT���</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">��������</span></li>
                               <br><br><br><br>
                                              ���ӱⰣ:<br>
                                              �������:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="��ûȮ��">
                        <input type=button class="btn btn-danger btn-sm" value="��û���">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">��ȣ</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job�ƶ�! IT���</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">��������</span></li>
                               <br><br><br><br>
                                              ���ӱⰣ:<br>
                                              �������:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="��ûȮ��">
                        <input type=button class="btn btn-danger btn-sm" value="��û���">
                     </td>
                  </tr>
                  <tr>
                     <td class="text-center" style="vertical-align:middle;">��ȣ</td>
                     <td>
                        <div style="float:left; width:40%;">
                           <img src="img/img1.jpg" style="width:100%; height:100%; float:left; display:">
                        </div>
                        <div class="oim-meet" style="padding:3%; width:60%; float:left;">
                           <h4><b>Job�ƶ�! IT���</b></h4>
                           <li class="li_add"><span class="label label-danger" style="font-size:13px; margin-right:5px;">����</span></li>
                               <li class="li_add"><span class="label label-primary" style="font-size:13px;">��������</span></li>
                               <br><br><br><br>
                                              ���ӱⰣ:<br>
                                              �������:<br>
                        </div>
                     </td>
                     <td class="text-center"  style="margin-tob:10%; vertical-align:bottom">
                        <input type=button class="btn btn-success btn-sm" value="��ûȮ��">
                        <input type=button class="btn btn-danger btn-sm" value="��û���">
                     </td>
                  </tr>
                  
               </tbody>
               
            </table>
          </div>
          
          
<!-- �򳻿� -->
          <div class="tab-pane" id="tab4">
            <p>�򳻿��Դϴ�</p>
          </div>
          
          
<!-- ȸ��Ż�� -->
          <div class="tab-pane " id="tab5">
             <div class="oim-mypage out">
               <span class=" oim-icon glyphicon glyphicon-log-out"></span><h4>ȸ��Ż��</h4>
               <h6>
               <br>
                  �ȳ��ϼ���. OIM�Դϴ�
                  <br><br>
                  ȸ��Ż�� ���� �Ʒ� ������ �� Ȯ���� �ּ���.
                  <br><br>
                  ȸ��Ż�� ��û�� ȸ���� �̸��� ���̵�� ��� Ż�� ó���� ����ǰ�, 
                  ���Խ� �Է��ϼ̴� ȸ�������� ��� ������ �˴ϴ�.
                  <br>
                  ��, ������ ������ �Խù��� Ż�� �Ŀ��� �������� �ʰ� �Խù��� ������ ���Ͻô� ��쿡�� �ݵ�� �����Ͻ� ��, 
                  ȸ��Ż�� ��û�Ͻø� �˴ϴ�.
               </h6>
            </div>
            <form method="post" action="../member/delete_ok.jsp">
            <table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
               <tr>
                  <td width=25% class="text-right">
                     <span class="glyphicon glyphicon-envelope"></span>&nbsp;Ż���� ���̵�(Email)
                  </td>
                  <td width=75% class="text-center" id="email">${sessionScope.id }
                  </td>
               </tr>
               <tr>
                  <td width=30% class="text-right">
                     <span class="glyphicon glyphicon-lock"></span>&nbsp;��й�ȣ �Է�
                  </td>
                  <td width=70% class="text-center">
                     <input type=text name=om_pwd size=30 id="new-pwd">
                      <span class="help-block"><font name="check" size="2" color="#DF013A"></font>*���� ������ ���� ��й�ȣ�� �Է��� �ּ��� </span>
                      <!-- <h6 style="color:#DF013A;">*���� ������ ���� ��й�ȣ�� �Է��� �ּ���</h6> -->
                  </td>                  
               </tr>
               <tr>
                  <td colspan="2" class="text-center">
                  	 <input type="submit" class="btn btn-danger btn-sm" value="ȸ��Ż��" >
                     <input type=button class="btn btn-info btn-sm" value="�ٽû����ϱ�" onclick="javascript:history.back()">
                  </td>
               </tr>
            </table>
            </form>
         </div>
         
         
       </div>
   </div>
</div>



</body>
</html>