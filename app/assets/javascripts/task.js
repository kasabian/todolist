// JavaScript Document

$(document).ready(function(){
	
	    //********************* события при наведениии
		  $('.task_fild').live('mouseover', function(e) {
			 $(this).addClass('s6');   
			 $(".s6 .s5").css({"display":"inline"});            
		   });
		  
		   $('.task_fild').live('mouseleave',function(e) {
			 $(".s6 .s5").css({"display":"none"});  
			 $(this).removeClass("s6");  
			
		   });
		   
		   
		   
		   $('.task_head').live('mouseover',function(e) {
			 $(this).addClass('title_task_edit');   
			 $(".title_task_edit .edit1").css({"display":"inline"});        
		   
		   
		   });
		  
		   $('.task_head').live('mouseleave',function(e) {
			 $(".title_task_edit .edit1").css({"display":"none"});  
			 $(this).removeClass("title_task_edit");  		
					
		   });
		    
		    
		
	
});
