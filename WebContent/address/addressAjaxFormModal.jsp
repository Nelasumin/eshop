<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="addressAjaxFormModal" role="dialog" aria-hidden="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form class="form-inline" role="form" id="addrForm"  method="post" >
			<div class="modal-header">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel">添加/修改收货地址</h4>
			</div>
			<div class="modal-body">
				
					<input type="hidden" id="addrId" name="addrId" value="0"/>
					<input type="hidden" id="addrIsdefault" name="addrIsdefault" value="0"/>
					<div class="form-group">
						<label for="addrProvince"> 省 </label> 
						<input class="form-control" name="addrProvince" id="addrProvince" type="text"  placeholder="省" required/>
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
				<button class="btn btn-primary" type="button" onclick="handleAddress()">确定</button>
				<button class="btn btn-default" type="button" data-dismiss="modal">关闭窗口</button>
			</div>
			</form>
		</div>

	</div>

</div>