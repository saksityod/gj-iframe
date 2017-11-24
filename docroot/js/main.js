

var auThenRedirectURL = function(user,pass,url){

	
	  var htmlForm="";
		htmlForm+="<form target=\"myIframe\" method='post' id='formLoginPentaho' action='"+url+"'>";
		htmlForm+="<input type=\"hidden\" name=\"userid\" id=\"userid\" value="+user+">";
		htmlForm+="<input type=\"hidden\" name=\"password\" id=\"password\" value="+pass+">";
		htmlForm+="<input style='display:none;' type='submit' id='btnSubmit' name='btnSubmit'";
		htmlForm+="<form>";
		$("#formLoginPentaho").remove();
		$("body").append(htmlForm);
			
		
		//setTimeout(function(){
			
			//auThenRedirectURL(localStorage.getItem('user_name'),localStorage.getItem('password'),url);
			//http://192.168.1.38:8086/pentaho/api/repos/%3Apublic%3ASteel%20Wheels%3AReports%3ATop%20Customers%20%28report%29.prpt/viewer?ts=1475595423671&userid=1460600053789&password=11111
				
				$("#btnSubmit").click();
				//alert("submit");
				//$( location ).attr({"target" : "_blank"}).attr("href", url);
		//},500);
		
		
		

}

$(document).ready(function(){

function myFunction(){
	var url="http://localhost:8081/pentaho/content/saiku-ui/index.html?biplugin5=true&ts=1499933168050&ts=1499933823284";
	auThenRedirectURL($('#user_portlet').val(),$("#pass_portlet").val(),url);
} 
myFunction();
});