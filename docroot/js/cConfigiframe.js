var auThenRedirectURL = function(user,pass,url){
	
	  var htmlForm="";
		htmlForm+="<form target=\"myIframe\" method='post' id='formLoginPentaho' action='"+url+"'>";
		htmlForm+="<input type=\"hidden\" name=\"userid\" id=\"userid\" value="+user+">";
		htmlForm+="<input type=\"hidden\" name=\"password\" id=\"password\" value="+pass+">";
		htmlForm+="<input style='display:none;' type='submit' id='btnSubmitFormGJIFrame' name='btnSubmitFormGJIFrame'";
		htmlForm+="<form>";
		$("#formLoginPentaho").remove();
		$("body").append(htmlForm);
			
		$("#btnSubmitFormGJIFrame").click();
				
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
				alert("insert success.");
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
	//alert(instance_id)
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
				auThenRedirectURL($('#user_portlet').val(),$("#pass_portlet").val(),data[0][1]);
			}
			
		}
	});
	
}

$(document).ready(function(){
	//$("#urlGjIFrame").val("#");

	//if($("#urlGjIFrame").val()!=""){
	setTimeout(function(){
		//alert($("#instance_id").val());
		getUrlFn($("#instance_id").val(),$("#checkRole").val());
		$("#btnSubmitGjIFrame").off("click");
		$("#btnSubmitGjIFrame").on("click",function(){
			
			checkUniqueFn($("#instance_id").val(),$("#checkRole").val());

		});
	},1000);
	
	//}
	
	$(".portlet-configuration").off("click");
	$(".portlet-configuration").on("click",function(){
		getUrlFn($("#instance_id").val(),$("#checkRole").val());
		//$("#config_instance_id").val($("#instance_id").val());
	});
	

	$(".portlet-close").off("click");
	$(".portlet-close").on("click",function(){
		return false;
//		alert("delete data");
//		alert($("#instance_id").val());
//		alert($("#checkRole").val());
//		
//		return false;
		//delURLFn($("#instance_id").val(),$("#checkRole").val());
		//$("#config_instance_id").val($("#instance_id").val());
	});
	
	
	
	
});