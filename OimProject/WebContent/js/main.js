//태그모임
// portfolio
   
    if($('.isotopeWrapper').length){

        var $container = $('.isotopeWrapper');
        var $resize = $('.isotopeWrapper').attr('id');
        // initialize isotope
        
        $container.isotope({
            itemSelector: '.isotopeItem',
            resizable: false, // disable normal resizing
            masonry: {
                columnWidth: $container.width() / $resize,
                
            }
        });

        $('#filter a').click(function(){
            /*$('#filter a').removeClass('current');//removeClass:클래스 속성이 가지고 있는 선택한 클래스명을 삭제합니다. 이 메소드는 선택된 클래스 모두를 제거하며 만약 해당 클래스가 없는 경우 아무런 변화가 없습니다.
            $(this).addClass('current');*/
            var selector = $(this).attr('data-filter');
            $container.isotope({
                filter: selector,
                animationOptions: {
                    duration: 1000,
                    easing: 'easeOutQuart',
                    queue: false
                }
            });
            return false;
        });
        
        
        $(window).smartresize(function(){
            $container.isotope({
            	
                masonry: {
                    /*columnWidth: $container.width() / $resize*/
                	columnWidth: $container.width() / $resize
                }
            });
        });
        

}  

