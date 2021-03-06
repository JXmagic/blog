/**
 * Resize function without multiple trigger
 * 
 * Usage:
 * $(window).smartresize(function(){  
 *     // code here
 * });
 */
(function($,sr){
    // debouncing function from John Hann
    // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
    var debounce = function (func, threshold, execAsap) {
      var timeout;

        return function debounced () {
            var obj = this, args = arguments;
            function delayed () {
                if (!execAsap)
                    func.apply(obj, args); 
                timeout = null; 
            }

            if (timeout)
                clearTimeout(timeout);
            else if (execAsap)
                func.apply(obj, args);

            timeout = setTimeout(delayed, threshold || 100); 
        };
    };

    // smartresize 
    jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
/**
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var CURRENT_URL = window.location.href.split('#')[0].split('?')[0],
    $BODY = $('body'),
    $MENU_TOGGLE = $('#menu_toggle'),
    $SIDEBAR_MENU = $('#sidebar-menu'),
    $SIDEBAR_FOOTER = $('.sidebar-footer'),
	$LEFT_COL = $('.left_col'),
	$RIGHT_COL = $('.right_col'),
	$NAV_MENU = $('.nav_menu'),
    $FOOTER = $('footer');

$.ajax({
    type:"GET",
    url:"menuList",
    dataType:"json",
    success:function(data){
         // console.log(data.data)
          data = data.data;
          
          init_data(data,"#sidebar-menu");
          init_sidebar();
    }
})  

function init_data(data,menu){//parent_id=-1

$menu = $(menu);
for(i = 0;i<data.length;i++){
   $menu.append('<div class="menu_section" id=menu_section'+data[i].id+'>');
   $("#menu_section"+data[i].id).append('<h3>'+data[i].name+'</h3>');
  
  
   init_child(data[i].listMenu,data[i].id);   
   
}

}
function init_child(data,id){

for( y = 0;y<data.length;y++){
$('#menu_section'+id).append('<ul class="nav side-menu" id="side-menu'+id+y+'">');
 $("#side-menu"+id+y).append('<li><a><i class="'+data[y].icon+'"></i> '+data[y].name+' <span class="fa fa-chevron-down"></span></a></li>');
 $("#side-menu"+id+y+" li").append(' <ul id="child_menu'+data[y].id+y+'" class="nav child_menu" >');
 $child_menu = $("#side-menu"+id+y+" li #child_menu"+data[y].id+y);
 init_children(data[y].listMenu,$child_menu);
 
}

}
function init_children(data,ul){
for( z = 0;z<data.length;z++){
  ul.append('<li><a href="'+data[z].url+'">'+data[z].name+'</a></li>');
}
}

// Sidebar
function init_sidebar() {
// TODO: This is some kind of easy fix, maybe we can improve this
var setContentHeight = function () {
	// reset height
	$RIGHT_COL.css('min-height', $(window).height());

	var bodyHeight = $BODY.outerHeight(),
		footerHeight = $BODY.hasClass('footer_fixed') ? -1 : $FOOTER.height(),
		leftColHeight = $LEFT_COL.eq(1).height() + $SIDEBAR_FOOTER.height(),
		contentHeight = bodyHeight < leftColHeight ? leftColHeight : bodyHeight;

	// normalize content
	contentHeight -= $NAV_MENU.height() + footerHeight;

	$RIGHT_COL.css('min-height', contentHeight);
};

  $SIDEBAR_MENU.find('a').on('click', function(ev) {
	  console.log('clicked - sidebar_menu');
        var $li = $(this).parent();

        if ($li.is('.active')) {
            $li.removeClass('active active-sm');
            $('ul:first', $li).slideUp(function() {
                setContentHeight();
            });
        } else {
            // prevent closing menu if we are on child menu
            if (!$li.parent().is('.child_menu')) {
                $SIDEBAR_MENU.find('li').removeClass('active active-sm');
                $SIDEBAR_MENU.find('li ul').slideUp();
            }else
            {
				if ( $BODY.is( ".nav-sm" ) )
				{
					$SIDEBAR_MENU.find( "li" ).removeClass( "active active-sm" );
					$SIDEBAR_MENU.find( "li ul" ).slideUp();
				}
			}
            $li.addClass('active');

            $('ul:first', $li).slideDown(function() {
                setContentHeight();
            });
        }
    });



	// check active menu
	$SIDEBAR_MENU.find('a[href="' + CURRENT_URL + '"]').parent('li').addClass('current-page');

	$SIDEBAR_MENU.find('a').filter(function () {
		return this.href == CURRENT_URL;
	}).parent('li').addClass('current-page').parents('ul').slideDown(function() {
		setContentHeight();
	}).parent().addClass('active');

	// recompute content when resizing
	$(window).smartresize(function(){  
		setContentHeight();
	});

	setContentHeight();

	// fixed sidebar
	if ($.fn.mCustomScrollbar) {
		$('.menu_fixed').mCustomScrollbar({
			autoHideScrollbar: true,
			theme: 'minimal',
			mouseWheel:{ preventDefault: true }
		});
	}
};
// /Sidebar


	$(document).ready(function() {

		init_sidebar();
		
	});	
	

