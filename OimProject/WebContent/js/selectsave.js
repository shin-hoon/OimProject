	$(document).ready(function() {
	    $('.input-group input[required], .input-group textarea[required], .input-group select[required]').on('keyup change', function() {
			var $form = $(this).closest('form'),
	            $group = $(this).closest('.input-group'),
				$addon = $group.find('.input-group-addon'),
				$icon = $addon.find('span'),
				state = false;
	            
	    	if (!$group.data('validate')) {
				state = $(this).val() ? true : false;
			}else if ($group.data('validate') == "email") {
				state = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($(this).val())
			}else if($group.data('validate') == 'phone') {
				state = /^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/.test($(this).val())
			}else if ($group.data('validate') == "length") {
				state = $(this).val().length >= $group.data('length') ? true : false;
			}else if ($group.data('validate') == "number") {
				state = !isNaN(parseFloat($(this).val())) && isFinite($(this).val());
			}

			if (state) {
					$addon.removeClass('danger');
					$addon.addClass('success');
					$icon.attr('class', 'glyphicon glyphicon-ok');
			}else{
					$addon.removeClass('success');
					$addon.addClass('danger');
					$icon.attr('class', 'glyphicon glyphicon-remove');
			}
	        
	        if ($form.find('.input-group-addon.danger').length == 0) {
	            $form.find('[type="submit"]').prop('disabled', false);
	        }else{
	            $form.find('[type="submit"]').prop('disabled', true);
	        }
		});
	    
	    $('.input-group input[required], .input-group textarea[required], .input-group select[required]').trigger('change');
	    
	    
	});	 






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
    	   	 		history.back();
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