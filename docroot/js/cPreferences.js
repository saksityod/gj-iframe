var editor=[];
var auThenRedirectURL = function(user,pass,url,instance_id){
	
	  var htmlForm="";
		htmlForm+="<form target=\"myIframe-"+instance_id+"\" method='post' id='formLoginPentaho-"+instance_id+"' action='"+url+"'>";
		htmlForm+="<input type=\"hidden\" name=\"userid\" id=\"userid\" value="+user+">";
		htmlForm+="<input type=\"hidden\" name=\"password\" id=\"password\" value="+pass+">";
		htmlForm+="<input style=\"display:none;\" type=\"submit\" id=\"btnSubmitFormGJIFrame-"+instance_id+"\" name=\"btnSubmitFormGJIFrame-"+instance_id+"\">";
		htmlForm+="<form>";
		$("#formLoginPentaho-"+instance_id).remove();
		$("body").append(htmlForm);
		//setTimeout(function(){
			$("#btnSubmitFormGJIFrame-"+instance_id).click();
		//},1000);
		
				
}
var insertURLFn = function(instance_id,url,comment,checkRole,height,width){
	
	
	
	if($.trim(url)=="" || $.trim(url)=="http://"){
		alert("URL Not Empty.");
		return false;
	}
	$.ajax({
		url:"../../pentaho-portlet/Model/insert.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"url":url,"comment":comment,"checkRole":checkRole,
			"height":height,"width":width
		},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("insert success.");
				//window.location.reload();
			}else{
				alert(data);
			}
		}
	});
};

var getCommentFn = function(instance_id){
	$.ajax({
		url:"../../pentaho-portlet/Model/getComment.jsp",
		type:"post",
		dataType:"json",
		async:false,
		data:{"instance_id":instance_id,"checkRole":$("#checkRole-"+instance_id).val()},
		success:function(data){
			if(data!=""){
				$("#popoverComment-"+instance_id).popover({
					content:data[0][0]
				});
			}else{
				$("#popoverComment-"+instance_id).popover({
					content:""
				});
			}
		}
	});
}

var delURLFn = function(instance_id,checkRole){
	

	
	$.ajax({
		url:"../../pentaho-portlet/Model/delete.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("clear success.");
				//$("#urlGjIFrame-"+instance_id).val("http://www.see-kpi.com");
				$("#urlGjIFrame-"+instance_id).val("");
				$("#commentGjIFrame-"+instance_id).val("");
				editor[instance_id].setData("");
				//window.location.reload();
			}else{
				alert(data);
			}
		}
	});
};


var updateURLFn = function(instance_id,url,comment,checkRole,height,width){
	

	if($.trim(url)=="" || $.trim(url)=="http://"){
		alert("URL Not Empty.");
		return false;
	}
	
	$.ajax({
		url:"../../pentaho-portlet/Model/update.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"url":url,"comment":comment,"checkRole":checkRole,
			"height":height,"width":width},
		success:function(data){
			console.log(data);
			if(data=='success'){
				alert("update success.");
				//window.location.reload();
			}else{
				alert(data);
			}
		}
	});
};

var checkUniqueFn = function(instance_id,checkRole){
	
	var editor_data = editor[instance_id].getData();
	
	$.ajax({
		url:"../../pentaho-portlet/Model/search.jsp",
		type:"post",
		dataType:"json",
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
	
			if(data==""){

				insertURLFn(instance_id,$("#urlGjIFrame-"+instance_id).val(),editor_data,$("#checkRole-"+instance_id).val(),$("#heightGjIFrame-"+instance_id).val(),$("#widthGjIFrame-"+instance_id).val());
				
			}else{

				updateURLFn(instance_id,$("#urlGjIFrame-"+instance_id).val(),editor_data,$("#checkRole-"+instance_id).val(),$("#heightGjIFrame-"+instance_id).val(),$("#widthGjIFrame-"+instance_id).val());
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
		async:false,
		data:{"instance_id":instance_id,"checkRole":checkRole},
		success:function(data){
			//console.log(data);
			
		
			if(data=="" || data[0][1]=="#" || data[0][1]=="" || data[0][1]==null || data[0][1]=='null'){
				//$("#urlGjIFrame-"+instance_id).val("http://www.see-kpi.com");
				$("#urlGjIFrame-"+instance_id).val("");
				return false;
			}else{
				$("#urlGjIFrame-"+instance_id+"").val(data[0][1]);
				$("#commentGjIFrame-"+instance_id+"").val(data[0][4]);
				$("#heightGjIFrame-"+instance_id+"").val(data[0][5]);
				$("#widthGjIFrame-"+instance_id+"").val(data[0][6]);
				
				if($("#action-"+instance_id).val()=="show"){
					$("#myIframe-"+instance_id).css({"height":data[0][5],"width":data[0][6]});
					auThenRedirectURL($('#user_portlet-'+instance_id+'').val(),$("#pass_portlet-"+instance_id+"").val(),data[0][1],instance_id);
				}
			}
			
		}
	});
	
}

$(document).ready(function(){

	
	
	
		$.each($(".instance_id").get(),function(index,indexEntry){
				//console.log($(indexEntry).val());
				
			
			
				
			
				if($("#action-"+$(indexEntry).val()).val()=="insertUpdate"){
					//Binding CKEDITOR START.
					editor[$(indexEntry).val()]=CKEDITOR.replace( "commentGjIFrame-"+$(indexEntry).val(), {
				    	toolbar:
				    		[ ['Bold', 'Italic', 'Underline','-', 'NumberedList', 'BulletedList', '-', 'Link', 'Unlink']]
				    });
					//Binding CKEDITOR END.
					
					$("#urlGjIFrame-"+$(indexEntry).val()).change(function() {
				        if (!/^http:\/\//.test(this.value)) {
				            this.value = "http://" + this.value;
				        }
				    });
					
					
				}else{
					//$("#popoverComment-"+$(indexEntry).val()).popover();
					getCommentFn($(indexEntry).val());
					$("#displayComment-"+$(indexEntry).val()).off("click");
					$("#displayComment-"+$(indexEntry).val()).on("click",function(){
						console.log("displayComment");
					});
					
					
				}
			
				getUrlFn($(indexEntry).val(),$("#checkRole-"+$(indexEntry).val()+"").val());
				
				$("#btnSubmitGjIFrame-"+$(indexEntry).val()+"").off("click");
				$("#btnSubmitGjIFrame-"+$(indexEntry).val()+"").on("click",function(){
					//alert($(indexEntry).val());
					//alert($("#checkRole-"+$(indexEntry).val()+"").val());
					checkUniqueFn($(indexEntry).val(),$("#checkRole-"+$(indexEntry).val()+"").val());
		
				});
				
				$("#btnDelGjIFrame-"+$(indexEntry).val()+"").off("click");
				$("#btnDelGjIFrame-"+$(indexEntry).val()+"").on("click",function(){
					
					delURLFn($(indexEntry).val(),$("#checkRole-"+$(indexEntry).val()+"").val());
		
				});
		});
		

	
	
});