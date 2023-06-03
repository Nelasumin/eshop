<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function handleAddressForm(addrId,baseurl,index){
	if(addrId){	
		$.post(baseurl+"/address/getAddressById.action",{addrId:addrId},function(result){
			if(result){
					$("#addressFormModal").modal();
					$("#addrProvince").val(result.addrProvince);
					$("#addrCity").val(result.addrCity);
					$("#addrArea").val(result.addrArea);
					$("#addrContent").val(result.addrContent);
					$("#addrReceiver").val(result.addrReceiver);
					$("#addrTel").val(result.addrTel);
					$("#addrId").val(result.addrId);
					$("#index").val(index);
				}
				else{
					$("#msgTitle").html("操作失败");
					$("#msgBody").html("未读到当前地址信息");
					$("#msgModal").modal();
				}
			},'json');
	}
	else{
		$("#addressFormModal").modal();
	}	
}
function setDefault(addrId,baseurl,e){
	$.post(baseurl+"/address/setDefaultAddress.action",{addrId:addrId},function(result){
		if(result.setDefault=="success"){
				$(".isDefault").html("");
				$(e.target).parent().siblings("[class='isDefault']").html("默认地址");
			}
			else{
				$("#msgTitle").html("操作失败");
				$("#msgBody").html("设置默认收货地址失败");
				$("#msgModal").modal();
			}	
	},'json');
}

function handleAddress(baseurl){
    var addrProvince=document.getElementById("addrProvince").value;
	var addrCity=document.getElementById("addrCity").value;
	var addrArea=document.getElementById("addrArea").value;
	var addrContent=document.getElementById("addrContent").value;
	var addrReceiver=document.getElementById("addrReceiver").value;
	var addrTel=document.getElementById("addrTel").value;
	$.post(baseurl+"/address/handleAddress.action",$('#addrForm').serialize(),function(result){
		if(result.index){
			$("#addressFormModal").modal('hide');
			$("#addrPro"+result.index).html(addrProvince);
			$("#addrCit"+result.index).html(addrCity);
			$("#addrAre"+result.index).html(addrArea);
			$("#addrCon"+result.index).html(addrContent);
			$("#addrRec"+result.index).html(addrReceiver);
			$("#addrTe"+result.index).html(addrTel);
			}
		else{
				$("#addressFormModal").modal('hide');
				$("#msgTitle").html("添加地址成功");
				$("#msgBody").html("添加地址成功");
				$("#msgModal").modal();
				var newrow=1;
				if($("#addressTable").length>0) newrow=$("#addressTable").find("tr").length;
				if($("#conaddressTable").length>0) newrow=$("#conaddressTable").find("tr").length;
			    var s="";
			    var addrv=addrProvince+" 省"+ addrCity+" 市"+addrArea+" 区 "+addrContent+" "+addrReceiver+" 收，电话："+addrTel;
			    if($("#addrDetails").length>0) s="<tr><td>"+newrow+"</td>";
			    if($("#confirmaddrDetails").length>0) s=s+"<tr><td><input type=radio checked name=address value="+addrv+"></td>";
			       
			    s=s+"<td><span id='addrPro"+newrow+"'>"+addrProvince+"省 </span>";
				s=s+"<span id='addrCit"+newrow+"'>"+addrCity+"</span> ";
				s=s+"<span id='addrAre"+newrow+"'>"+addrArea+"</span></td>";	
				s=s+"<td><span id='addrCon"+newrow+"'>"+addrContent+"</span></td>";	
				s=s+"<td><span id='addrRec"+newrow+"'>"+addrReceiver+"</span></td>";
				s=s+"<td><span id='addrTe"+newrow+"'>"+addrTel+"</span></td>";
				s=s+"<td class='isDefault'></td>"; 	 
				s=s+"<td><a href='#' onclick=\"handleAddressForm("+result.addrId+",'"+baseurl+"',"+newrow+"\")>修改</a> |";
				if($("#addrDetails").length>0)
				  s=s+"<a href='"+baseurl+"/address/delAddress.action?addrId="+result.addrId+"' onclick='return confirm('确定要删除这个收货地址吗？')'>删除</a>| ";
				
				s=s+"<a href='#' onclick='setDefault("+result.addrId+",'"+baseurl+"',event)'>设为默认地址</a>";
				s=s+"</td>";
				if($("#addrDetails").length>0){
				  if($("#addressTable").length==0){
					var c="<div><button class='btn btn-primary' type='submit' onclick='handleAddressForm()'>添加收货地址</button></div>";
					c=c+"<table class='table table-condensed table-hover' id='addressTable' name='addressTable'>";
			        c=c+"<thead><tr><th>#</th><th>省-市-区</th><th>街道</th><th>收件人</th><th>电话</th><th>默认地址</th><th>操作</th></tr></thead>";
					c=c+s;			        
			        $("#addrDetails").html(c);
				  }
				 else{
				  	var tables=$("#addressTable");
					var ss=$(s);
					ss.appendTo(tables);}
			   }
				if($("#confirmaddrDetails").length>0){
					 if($("#conaddressTable").length==0){
						 var c="<div><button class='btn btn-primary' type='submit' onclick='handleAddressForm()'>添加收货地址</button></div>";
							c=c+"<table class='table table-condensed table-hover' id='addressTable' name='addressTable'>";
					        c=c+"<thead><tr><th>#</th><th>省-市-区</th><th>街道</th><th>收件人</th><th>电话</th><th>默认地址</th><th>操作</th></tr></thead>";
							c=c+s;			        
					        $("#confirmaddrDetails").html(c);
					 }
					 else{
						  	var tables=$("#conaddressTable");
							var ss=$(s);
							ss.appendTo(tables);}
					   }
				$("#submitOrder").removeAttr("disabled");
				}
				
	},'json');
}

</script>
<div class="modal fade" id="addressFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<form class="form-inline" role="form" id="addrForm"  method="post" action="${pageContext.request.contextPath}/address/handleAddress.action">
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加/修改收货地址</h4>
			</div>
			<div class="modal-body">
				    <input type="hidden" id="index" name="index" value="">
					<input type="hidden" id="addrId" name="addrId" value="0"/>
					<div class="form-group">
						<label for="addrProvince"> 省 </label> 
						<input class="form-control" name="addrProvince" id="addrProvince" type="text"  placeholder="省" required value=""/>
					</div>
					<div class="form-group">
						<label for="addrCity"> 市</label> 
						<input class="form-control" name="addrCity" id="addrCity" type="text" placeholder="市" required/>
					</div>
					<div class="form-group">
						<label for="addrArea"> 区 </label> 
						<input class="form-control" name="addrArea" id="addrArea" type="text" placeholder="区" required/>
					</div>	
					<div class="form-group"> 
						<label for="addrContent"> 街道</label>
						<input class="form-control" name="addrContent" id="addrContent" type="text" placeholder="街道" required/>
					</div>				
					<div class="form-group">
						<label for="addrReceiver"> 收件人 </label> 
						<input class="form-control" name="addrReceiver" id="addrReceiver" type="text" placeholder="收件人" required/>					
					</div>					
					<div class="form-group"> 
						<label for="addrTel">	联系电话</label>
						<input class="form-control" name="addrTel" id="addrTel" type="text" placeholder="联系电话" required/>
					</div>				
				

			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button"  onclick="handleAddress('${pageContext.request.contextPath}',index)">确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>