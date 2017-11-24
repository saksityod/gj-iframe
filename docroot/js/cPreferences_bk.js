var auThenRedirectURL = function(user,pass,url){
	
	  var htmlForm="";
		htmlForm+="<form target=\"myIframe\" method='post' id='formLoginPentaho' action='"+url+"'>";
		htmlForm+="<input type=\"hidden\" name=\"userid\" id=\"userid\" value="+user+">";
		htmlForm+="<input type=\"hidden\" name=\"password\" id=\"password\" value="+pass+">";
		htmlForm+="<input style='display:none;' type='submit' id='btnSubmitFormGJIFrame' name='btnSubmitFormGJIFrame'";
		htmlForm+="<form>";
		$("#formLoginPentaho").remove();
		$("body").append(htmlForm);
		setTimeout(function(){
			$("#btnSubmitFormGJIFrame").click();
		},1000);
		
				
}
var insertURLFn = function(instance_id,url,checkRole){
	$.ajax({
		url:"../../pentaho-portlet/Model/insert.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"url":url,"checkRole":checkRole},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("insert success.");
				//window.location.reload();
			}
		}
	});
};

var delURLFn = function(instance_id,checkRole){
	
	
	
	$.ajax({
		url:"../../pentaho-portlet/Model/delete.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("delete success.");
				$("#urlGjIFrame").val("http://www.see-kpi.com");
				//window.location.reload();
			}
		}
	});
};


var updateURLFn = function(instance_id,url,checkRole){
	$.ajax({
		url:"../../pentaho-portlet/Model/update.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"url":url,"checkRole":checkRole},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("update success.");
				//window.location.reload();
			}
		}
	});
};

var checkUniqueFn = function(instance_id,checkRole){
	$.ajax({
		url:"../../pentaho-portlet/Model/search.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
	
			if(data==""){
				//alert("insert");
				insertURLFn(instance_id,$("#urlGjIFrame").val(),$("#checkRole").val());
				
			}else{
				updateURLFn(instance_id,$("#urlGjIFrame").val(),$("#checkRole").val());
				
				//alert("update");
			}
			
		}
	});
}
 
var getUrlFn = function(instance_id,checkRole){
	//alert($("#action").val())
	$.ajax({
		url:"../../pentaho-portlet/Model/search.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
			//console.log(data);
		
			if(data=="" || data[0][1]=="#" || data[0][1]=="" || data[0][1]==null || data[0][1]=='null'){
				$("#urlGjIFrame").val("http://www.see-kpi.com");
				return false;
			}else{
				$("#urlGjIFrame").val(data[0][1]);
				if($("#action").val()=="show"){
					auThenRedirectURL($('#user_portlet').val(),$("#pass_portlet").val(),data[0][1]);
				}
			}
			
		}
	});
	
}

$(document).ready(function(){

		
		getUrlFn($("#instance_id").val(),$("#checkRole").val());
		
		$("#btnSubmitGjIFrame").off("click");
		$("#btnSubmitGjIFrame").on("click",function(){
			
			checkUniqueFn($("#instance_id").val(),$("#checkRole").val());

		});
		
		$("#btnDelGjIFrame").off("click");
		$("#btnDelGjIFrame").on("click",function(){
			
			delURLFn($("#instance_id").val(),$("#checkRole").val());

		});
	
	
});