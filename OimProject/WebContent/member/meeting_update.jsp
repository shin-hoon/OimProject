<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="meeting_update_ok.do"> <!-- enctype="multipart/form-data" -->
		<div class="col-sm-2">      
		       <div class="col-sm-12 text-center" style="padding:0; height:170px; margin-top:10px;">
		        
		           <!-- <img src="https://static.onoffmix.com/images2/default/thumbnail_null.jpg" style="width: 100%; height: 100%; border: 1px solid #ddd" id="poster"
		            alt="��ǥ�̹���"> -->
		            
		            <img src="http://drive.google.com/uc?export=view&id=1IaPW70w3VoiKCDzMxd5PEPCf6zbWapQX"
		            style="width: 100%; height: 100%; border: 1px solid #ddd" id="poster" />
		           
		         <script type="text/javascript"> 
		         	$(function(){ //�������� ��ư Ŭ�������� fileŸ���� ��ư ���� Ŭ�� �̺�Ʈ �߻�
		         		$('.profile').on('click',function(){
		         			$('#upload').trigger('click');
		         		});
		         		
/* 		         		function handleImgFileSelect(e){//���� ���������� �̸����� ���
		         			
		         			var files=e.target.files;
		         			var filesArr=Array.prototype.slice.call(files);
		         			
		         			filesArr.forEach(function(f){
		         				
		         				sel_file=f;
		         				
		         				var reader=new FileReader();
		         				reader.onload=function(e){
		         					$('#poster').attr("src",e.target.result);
		         				}
		         				reader.readAsDataURL(f);
		         			});
		         		}
		         	
		         		$('#upload').on('change',handleImgFileSelect); */
		         	});
		         </script>  
		      </div>
		      
		      <div class="col-sm-12 text-center">
		        <input style="margin: 10px" type="button" class="btn btn-primary profile" value="��������">
		        <input type="file" name="upload" id="upload" accept=".jpg, .jpeg, .png"
		        style="display:none" onchange="document.getElementById('poster').src = window.URL.createObjectURL(this.files[0])">
		        
		        
		      </div>
		</div>
		
		<div class="col-sm-10">
           
        <table class="table table-hover">
           <tr>
            <td class="col-sm-2" style="border-top:0" >
                <h5>ī�װ�/���Ӹ�</h5>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle; border-top:0">
                  
                  <script>
                      $(function(){ //dropdown��ư�� select�������� ����� ��ũ��Ʈ�ڵ�
                        $('.dropdown-menu li > a').bind('click', function (e) {
                            var value = $(this).text();
                            $('input.btn-category').val(value);
                            $('input.meet_cg').val(value);
                        });
                       });
                   </script>
                   
                    <div class="btn-group" style="width:150px">
                      <input type="button" class="btn btn-default btn-category" data-toggle=dropdown name="category" value="${vo.meet_cg }" style="width:80%;"/>
					  <input type="hidden" class="meet_cg" name="${vo.meet_cg }"> <!--���� ī�װ� ���� ���� �κ�  -->

                      <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" style="width:20%; height:34px;">
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
                    
                    	<input type="text" class="form-control" style="width: 460px; display:inline-block; " name="meet_subject" placeholder="���Ӹ��� �Է����ּ���.">

               </td>  
           </tr>
           
              <tr>
            <td class="col-sm-2">
                <h5>�����Ͻ�</h5>
            </td>      
               
               <td class="col-sm-9" style="vertical-align: middle">
                      
                    <input type="text" class="form-control meet_date" name="meet_date" value="${vo.meet_start } ~ ${vo.meet_end }"/>

                    <script type="text/javascript">
                    $(function() {
                        $('.meet_date').daterangepicker({ 
                            timePicker: true,
                            timePicker24Hour: true,
                            timePickerIncrement: 10,
                            
                            locale: {
                                format:'YYYY-MM-DD HH:mm',
                                separator:' ~ ',
                                applyLabel:"Ȯ��",
                                cancelLabel:"���",
                                daysOfWeek:["��","��","ȭ","��","��","��","��"],
                                monthNames:["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"]
                            }
                        });
                    });
                    </script>
               </td>  
           </tr>
           
               <tr>
            <td class="col-sm-2">
                <h5>�������</h5>
            </td>      
               
               <td class="col-sm-9">
                   <div class="form group form-inline" style="position:relative; margin-bottom:15px; vertical-align: middle">
                       <input type="text" class="form-control" name="meet_loc" id="searchText" style="width:400px">
                       
                       
                       <input type="button" class="btn btn-default" id="searchBtn" value="�˻�">
                       
                        <label style="font-weight: normal">&nbsp;
                          <input type="checkbox" class="noplace">��Ҿ���/����
                          
                          <!--��� ���� üũ������, ���������� �̺�Ʈ �߻�  -->
                          <script type="text/javascript">
                          	$(function(){
                          	  $(".noplace").change(function(){ 
                          		 if($('.noplace').is(":checked")==true){ /*��ҹ��� üũ������  */
                          			$('.detailMap').css("display","none");
                          			$('#searchText').val('');
									$('#searchText').attr("disabled",true);
									$('#searchBtn').attr("disabled",true);
                          		}else{									/*��ҹ��� ���������� */
                          			$('.detailMap').css("display","block");
                          			$('#searchText').attr("disabled",false);
									$('#searchBtn').attr("disabled",false);
                          		} 
                          	 });
                          	});
                          </script>
                        </label>
                        
                        <div class="col-sm-12 searchArea" style="padding-left:0;">

                        </div>
                   </div>
                   
                   <div class="detailMap" id="detailMap">
                   <div id="map" style="width:100%; height:300px; margin: 0 auto; z-index:10"></div>
                    
                         <script>

 						 var oimlocation = new naver.maps.Point(309944, 552085),
                         
 						
                         map = new naver.maps.Map('map', {
                             center:oimlocation, //��ǥ ǥ��
                             zoom: 8, //������ �ʱ� �� ����
                             mapTypes: new naver.maps.MapTypeRegistry({
                                 'normal': naver.maps.NaverMapTypeOption.getNormalMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
                                     projection: naver.maps.TM128Coord
                                 }),
                                 'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
                                     projection: naver.maps.TM128Coord
                                 })
                             }),
                             minZoom: 1, //������ �ּ� �� ����
                             zoomControl: true, //�� ��Ʈ���� ǥ�� ����
                             zoomControlOptions: { //�� ��Ʈ���� �ɼ�
                             position: naver.maps.Position.TOP_RIGHT
                             }
                         });
                         
                         marker = new naver.maps.Marker({ // ������Ŀ ����
                             map: map,
                             position: oimlocation //��Ŀǥ��
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
                           
                           <input type="text" class="form-control" name="meet_loc1" value="" readonly="readonly"
                           value="${vo.meet_loc }"/>
                          </div>
                          
                          <input type="text" class="form-control" name="meet_loc2" placeholder="������ �ּҸ� �Է��� �ּ���.">
                </div>      
               </td>  
           </tr>
		    </table>
		</div> 
      
      <div class="col-sm-12">
        <table class="table table-hover">
            <tr>
                <td class="col-sm-2" style="vertical-align:middle;">
                     <h5>��/���� ����</h5>
                </td>
                <td class="col-sm-3" style="vertical-align:middle;">
                   		 <label class="radio-inline">
                          <input type="radio" name="meet_charge" value="����">����
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="meet_charge" value="����">����
                        </label>
                </td>
                
                 <td class="col-sm-7" style="vertical-align:middle;">
                    <table class="table table-bordered" style="margin-bottom:0">
                       <tr>
                          <th class="text-center">��������</th> 
                          <th class="text-center">�������</th>
                       </tr>
                       
                       <tr>
                           <td class="form-inline text-center" valign="middle"><input type="text" class="form-control" name="meet_total">��</td>
                           
                           
                           <td class="form-inline text-center" valign="middle">
						<script type="text/javascript">
						    	$(function(){	
						 	   	   $('input:radio[name="meet_charge"][value="����"]').on('click',function(){
						 	   		    $('input:text[name="meet_price"]').val('0');
						 	   		    $('input:text[name="meet_price"]').attr("disabled",true);
							   	   }); 
							   	   
							   	    $('input:radio[name="meet_charge"][value="����"]').on('click',function(){
							   	    	$('input:text[name="meet_price"]').val('');
										$('input:text[name="meet_price"]').attr("disabled",false);
								   });
							   	});
						    </script>
    
                             <input type="text" class="form-control" name="meet_price" value="${vo.meet_price }"/>��
                           </td>
                       </tr>
                    </table>
                </td>
                
            </tr>
            
            <tr>
            
            
            <tr>
                <td class="col-sm-2" style="vertical-align:middle;">
                    <h5>������ ���ӼҰ�</h5>
                </td>
                <td class="col-sm-10" colspan=2 style="padding:20px 0 20px 0">
                    <textarea class="form-control" name="meet_info" rows="8" cols="40" placeholder="���� ������ ������ �Ұ����ּ���!" style="width: 100%">${vo.meet_info }</textarea>
                </td>
            </tr>
            
            <tr>
                <td colspan="3" class="col-sm-2">
                    <h5>�� ����</h5>
                    <textarea class="form-control" name="meet_detail" rows="10" cols="45" style="width: 100%">${vo.meet_detail }</textarea>
                </td>
            </tr>
            
            <tr>
                <td class="col-sm-2">
                    <h5>��û ���� ����ó</h5>
                </td>
                <td class="col-sm-10 form-inline" style="vertical-align: middle" colspan=2>
                   <label class="control-label">��ȭ��ȣ</label>
                   <input class="form-control" type="text" name="tel" size=15 value="" disabled>
                   
                    <!-- <select class="form-control" name=tel1 style="margin-left: 10px">
						<option>010</option>
						<option>011</option>
						<option>017</option>
					</select>
					<input class="form-control" type="text" name="tel2" size=7>
					<input class="form-control" type="text" name="tel3" size=7> -->
               
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
                <td colspan="3" class="col-sm-12 text-center">
                    <input type="submit" class="btn btn-primary" value="�����Ϸ�" style="width: 12%">
                </td>
            </tr>
        </table>
          
      </div>
        </form>
	</div>
</body>
</html>