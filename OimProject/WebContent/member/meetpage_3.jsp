<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
           	<h4><span class="oim-icon glyphicon glyphicon-user"></span>���� ����</h4>
               
                
    	<!--      <form method="post" action="../member/join_ok.jsp" name=frm>-->
         <div class="container" style="margin-bottom: 50px;">
         <h2 style="width: 1100px; margin:20px auto">�����ϱ�</h2>
      <div class="row meetingRow" style="border: 1px solid #ddd">
      
      
      <div class="col-sm-2">      
             <div class="col-sm-12 text-center" style="padding:0; margin-top:10px;">
              
                 <img style="width: 100%; height: 100%; border: 1px solid #ddd" id="thumbPreview"   src="https://static.onoffmix.com/images2/default/thumbnail_null.jpg" default="https://static.onoffmix.com/images2/default/thumbnail_null.jpg" alt="��ǥ�̹���">
              <input style="margin: 10px" type="button" class="btn btn-primary" value="��������">
             
            </div>
      </div>
      
      <div class="col-sm-10">
           
        <table class="table table-hover">
           <tr>
            <td class="col-sm-2" style="border-top:0" >
                <h4>ī�װ�/���Ӹ�</h4>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle; border-top:0">
                  
                  <script>
                      $(function(){ //dropdown��ư�� select�������� ����� ��ũ��Ʈ�ڵ�
                        $('.dropdown-menu li > a').bind('click', function (e) {
                            var cgText = $(this).text();
                            $('button.btn-category').text(cgText);
                        });
                       });
                   </script>
                   
                    <div class="btn-group" style="width:150px">
                      <button class="btn btn-default btn-category" name="category" style="width:80%;">ī�װ� ����</button>
                      <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:20%">
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu" style=" max-height:300px; overflow: scroll">
                         <li><a href="#">����</a></li>
                         <li><a href="#">����</a></li>
                         <li><a href="#">���̳�/���۷���</a></li>
                         <li><a href="#">��ȭ/����</a></li>
                         <li><a href="#">���/����</a></li>
                         <li><a href="#">���Ȱ��</a></li>
                         <li><a href="#">�Ҹ���/ģ�����</a></li>
                         <li><a href="#">������</a></li>
                         <li><a href="#">����/�ڶ�ȸ</a></li>
                         <li><a href="#">�м�/��Ƽ</a></li>
                         <li><a href="#">�̺�Ʈ/��Ƽ</a></li>
                         <li><a href="#">����</a></li>
                         <li><a href="#">�Ŀ��� ���</a></li>
                         <li><a href="#">��Ÿ</a></li>
                      </ul>
                    </div>
                    
                       <input type="text" class="form-control" style="width: 460px; display:inline-block; " name="subject" placeholder="���Ӹ��� �Է����ּ���.">

               </td>  
           </tr>
           
              <tr>
            <td class="col-sm-2">
                <h4>�����Ͻ�</h4>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle">
                      
<!--
                       <div class="input-daterange input-group" id="datepicker">
                            <input type="text" class="input-sm form-control" name="from" placeholder="From date"/>
                            <span class="input-group-addon">to</span>
                            <input type="text" class="input-sm form-control" name="to" placeholder="To date"/>

                         </div>
-->

                    <input type="text" class="form-control" name="daterange"/>

                    <script type="text/javascript">
                    $(function() {
                        $('input[name="daterange"]').daterangepicker({
                            timePicker: true,
                            timePicker24Hour: true,
                            timePickerIncrement: 1,
                            locale: {
                                format: '  YYYY-MM-DD HH:mm  ',
                            }
                        });
                    });
                    </script>
               </td>  
           </tr>
           
               <tr>
            <td class="col-sm-2">
                <h4>�������</h4>
            </td>      
               
               <td class="col-sm-9">
                   <div class="form group form-inline" style="margin-bottom:15px; vertical-align: middle">
                       <input type="text" class="form-control" size="50">
                       <input type="button" class="btn btn-default" value="�˻�">
                        <label style="font-weight: normal">
                          <input type="checkbox" name="notloc">��Ҿ���/����
                        </label>
                   </div>
                   
                    <div class="detailMap" id="detailMap">
                   <div id="map" style="width:100%; height:300px; margin: 0 auto;"></div>
                    
                        <script>
                            var map = new naver.maps.Map('map', {
                                center: new naver.maps.LatLng(37.50960113, 127.05812649), //������ �ʱ� �߽� ��ǥ
                                zoom: 8, //������ �ʱ� �� ����
                                minZoom: 1, //������ �ּ� �� ����
                                zoomControl: true, //�� ��Ʈ���� ǥ�� ����
                                zoomControlOptions: { //�� ��Ʈ���� �ɼ�
                                    position: naver.maps.Position.TOP_RIGHT
                                }
                            });
                            var marker = new naver.maps.Marker({
                                position: new naver.maps.LatLng(37.50960113, 127.05812649),
                                map: map
                            });
                            map.setOptions("mapTypeControl", true); //���� ���� ��Ʈ���� ǥ�� ����


                            // ���� ���ͷ��� �ɼ�
                            $("#interaction").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("draggable")) {
                                    map.setOptions({ //���� ���ͷ��� ����
                                        draggable: false,
                                        pinchZoom: false,
                                        scrollWheel: false,
                                        keyboardShortcuts: false,
                                        disableDoubleTapZoom: true,
                                        disableDoubleClickZoom: true,
                                        disableTwoFingerTapZoom: true
                                    });

                                    $(this).removeClass("control-on");
                                } else {
                                    map.setOptions({ //���� ���ͷ��� �ѱ�
                                        draggable: true,
                                        pinchZoom: true,
                                        scrollWheel: true,
                                        keyboardShortcuts: true,
                                        disableDoubleTapZoom: false,
                                        disableDoubleClickZoom: false,
                                        disableTwoFingerTapZoom: false
                                    });

                                    $(this).addClass("control-on");
                                }
                            });
                                                        $("#min-max-zoom").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("minZoom") === 10) {
                                    map.setOptions({
                                        minZoom: 1,
                                        maxZoom: 14
                                    });
                                    $(this).val(this.name + ': 1 ~ 14');
                                } else {
                                    map.setOptions({
                                        minZoom: 10,
                                        maxZoom: 12
                                    });
                                    $(this).val(this.name + ': 10 ~ 12');
                                }
                            });

                            //���� ��Ʈ��
                            $("#controls").on("click", function(e) {
                                e.preventDefault();

                                if (map.getOptions("scaleControl")) {
                                    map.setOptions({ //��� ���� ��Ʈ�� �����
                                        scaleControl: false,
                                        logoControl: false,
                                        mapDataControl: false,
                                        zoomControl: false,
                                        mapTypeControl: false
                                    });
                                    $(this).removeClass('control-on');
                                } else {
                                    map.setOptions({ //��� ���� ��Ʈ�� ���̱�
                                        scaleControl: true,
                                        logoControl: true,
                                        mapDataControl: true,
                                        zoomControl: true,
                                        mapTypeControl: true
                                    });
                                    $(this).addClass('control-on');
                                }
                            });

                            
                            var map = new naver.maps.Map('map', mapOptions);
                            
                        </script>
                        
                          <div class="input-group" style="margin: 15px 0 15px 0">
                           <div class="input-group-addon">
                            <span class="glyphicon glyphicon-map-marker"></span> 
                           </div>
                           <input type="text" class="form-control" name="location" value="���� ��� : [���ο������μ���] ���� ���α� ������ ����� ���α� ������ 122-6 ���δ��б�" readonly="readonly"/>
                          </div>
                          
                          <input type="text" class="form-control" placeholder="������ �ּҸ� �Է��� �ּ���.">
                </div>      
               </td>  
           </tr>
          </table>
      </div> 
      
      <div class="col-sm-12">
        <table class="table table-hover">
            <tr>
                <td class="col-sm-2">
                     <h4>��/���� ����</h4>
                </td>
                <td class="col-sm-10" style="vertical-align: middle">
                    <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" value="����"> ����
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="inlineRadioOptions" value="����"> ����
                        </label>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                     <h4>�׷켳��</h4>
                </td>
                <td class="col-sm-10" style="vertical-align: middle">
                    <table class="table table-bordered">
                       <tr>
                          <th class="text-center">�׷��</th>
                          <th class="text-center">�� �ο�</th> 
                          <th class="text-center">�������</th>
                          <th class="text-center">�����ο�</th> 
                       </tr>
                       
                       <tr>
                           <td><input type="text" class="form-control"></td>
                           <td><input type="text" class="form-control"></td>
                           <td><input type="text" class="form-control"></td>
                           <td> 
                               <select class="form-control" name=tel1>
                                <option>����</option>
                                <option>�������� 1��</option>
                                <option>�������� 2��</option>
                                <option>�������� 3��</option>
                          </select>
                           </td>
                       </tr>
                    </table>
                </td>
            </tr>
            
            
            <tr>
                <td class="col-sm-2">
                    <h4>������ ���ӼҰ�</h4>
                </td>
                <td class="col-sm-10">
                    <textarea class="form-control" rows="5" cols="55" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td colspan="2" class="col-sm-2">
                    <h4>�� ����</h4>
                    <textarea class="form-control" rows="5" cols="55" style="width: 100%"></textarea>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                    <h4>��û ���� ����ó</h4>
                </td>
                <td class="col-sm-10 form-inline" style="vertical-align: middle">
                   <label class="control-label">��ȭ��ȣ</label>
                    <select class="form-control" name=tel1 style="margin-left: 10px">
                  <option>010</option>
                  <option>011</option>
                  <option>017</option>
               </select>
               <input class="form-control" type="text" name="tel2" size=7>
               <input class="form-control" type="text" name="tel3" size=7>
               
                   <label class="control-label" style="margin-left: 20px">�̸���</label>
                     <input class="form-control" type="text" name="email1" size=10 style="margin-left: 10px">@
                     <select class="form-control" name=email2>
                  <option>naver.com</option>
                  <option>gmail.com</option>
                  <option>hanmail.net</option>
                  <option>nate.com</option>
               </select>
                </td>
            </tr>
            
            <tr>
                <td colspan="2" class="col-sm-12 text-center">
                    <input type="submit" class="btn btn-primary" value="�����Ϸ�" style="width: 12%">
                </td>
            </tr>
        </table>
          
      </div>
         
<!--      </form>-->
   </div>
  </div>

</body>
</html>