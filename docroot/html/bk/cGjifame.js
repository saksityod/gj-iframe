

var auThenRedirectURL = function(user,pass,url){

	
	  var htmlForm="";
		htmlForm+="<form target=\"myIframe\" method='post' id='formLoginPentaho' action='"+url+"'>";
		htmlForm+="<input type=\"hidden\" name=\"userid\" id=\"userid\" value="+user+">";
		htmlForm+="<input type=\"hidden\" name=\"password\" id=\"password\" value="+pass+">";
		htmlForm+="<input style='display:none;' type='submit' id='btnSubmit' name='btnSubmit'";
		htmlForm+="<form>";
		$("#formLoginPentaho").remove();
		$("body").append(htmlForm);
			
		$("#btnSubmit").click();
				
		
		

}

function myFunction(url){
	
	auThenRedirectURL($('#user_portlet').val(),$("#pass_portlet").val(),url);
} 


$(document).ready(function(){



});


