<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
 $(document).ready(function(){
	/* var wd = $(".nav-pills").width();
	jQuery(window).scroll(function() {
		$("#left_cate").css("width", wd);
	}); */

	$("#left_cate").affix({
	    offset: {
	        top: 125,
	        bottom: function () {
	            return (this.bottom = $('.bottom').outerHeight(true));
	        }
	
	 	}
	});
});
</script>
<div class="list-group" >
   	<ul class="nav nav-pills nav-stacked"  id="left_cate">
   	</ul>				
</div>


