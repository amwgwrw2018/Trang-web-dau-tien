 $(document).ready(function(){
    	 
    		

    	  
   	    	 $(".pagination li:first-child").addClass("active");
   	   
    	    $(".pagination li").click(
    	    		function(){
    	    	$(this).siblings().removeClass("active");
    	    		$(this).addClass("active");
    	    		});
    	  
    	    $.ajax({
    	    	url:"bottomOfThePage.jsp",
    	    	type:"POST",
    	    	dataType:"text",
    	    	data:{
    	    		
    	    	},
    	    	success:function(result){
    	    		$("#bottomOfThePage").html(result);
    	    	}
    	    	
    	    });
    	  
    	
 });
    
      function sort(){
    	  document.getElementById("sorting").submit();
      }
      
      
      function getPage(begin,end,classname){
    	  for(i=0;i<document.getElementsByClassName(classname).length;i++){
    		  document.getElementsByClassName(classname)[i].style.display="none";
    	  }
    		 for(i=begin-1;i<end;i++){
    	    			 document.getElementsByClassName(classname)[i].style.display="block";
    	    		 }
    		 
    	    	}
      
      
      
      function addLuotXem(maSanPham){
    		
  		return   $.ajax({ 
  		        url : 'ThemLuotXem',
  		        type : "POST",
  		        dataType:"text",
  		        data : {
  		             maSP:maSanPham
  		        },
  		        success : function (result){
  		           
  		        }
  		    });		
  }
      
      
    