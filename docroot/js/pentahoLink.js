

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


//

	$("#renderIfame").click(function(){
		//var url="http://192.168.1.49:8081/pentaho/content/saiku-ui/index.html?biplugin5=true&ts=1499933168050&ts=1499933823284";
		//var url="http://localhost:8080/pentaho/plugin/jpivot/Pivot?solution=&path=/public/Steel%20Wheels/Analysis/2005%20Q1%20Product%20Analysis.xjpivot.xjpivot&action=2005%20Q1%20Product%20Analysis.xjpivot.xjpivot";
		myFunction($("#pentahoURL").val());
	});
	//$("#renderIfame").click();
});