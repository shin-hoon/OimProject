<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�� ����</title>
</head>
<body>
<div class="oim-mypage out">
       <span class=" oim-icon glyphicon glyphicon-heart"></span><h4>�� ����</h4>
       <!-- ��û���� ã���ư -->
        <div class="input-group" style="width:30%; float:right">
          <input type="text" class="form-control" placeholder="Search for...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">ã��</button>
          </span>
        </div>
</div>
	<table class="table table-hover" style="margin:6%; width:70%; margin: 0px auto;">
          <thead>
             <tr>
                <th width=10% class="text-center">��ȣ</th><!-- �� -->
                <th width=65% class="text-center">����</th>
                <th width=25% class="text-center">����</th>
             </tr>
          </thead>
          <tbody>
          
          

             <tr>
                <td class="text-center" style="vertical-align:middle;"><c:out value="${status.count }"></c:out></td><!-- ��ȣ -->
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
                <td class="text-center"  style="margin-top:10%; vertical-align:bottom">
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
                <td class="text-center"  style="margin-top:10%; vertical-align:bottom">
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
                <td class="text-center"  style="margin-top:10%; vertical-align:bottom">
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
                <td class="text-center"  style="margin-top:10%; vertical-align:bottom">
                   <input type=button class="btn btn-success btn-sm" value="��ûȮ��">
                   <input type=button class="btn btn-danger btn-sm" value="��û���">
                </td>
             </tr> 
             
          </tbody>
          
       </table>
</body>
</html>