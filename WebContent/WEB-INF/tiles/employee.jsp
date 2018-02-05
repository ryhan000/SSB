<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">


	$(document).ready(function(){
		
		
		$("#btnClear").click(function(){
			clearForm();			
		});
		
		var form = $('#submit_form');
		form.submit(function () {	
			
			var employeeId = document.forms["submit_form"]["employeeId"].value;
		    var employeeName = document.forms["submit_form"]["employeeName"].value;
		    var email = document.forms["submit_form"]["email"].value;
		    var countryId = document.forms["submit_form"]["countryId"].value;
		    
		    if (employeeId == "") {
		        alert("Insert Employee ID ???");
		        $('#employeeId').focus();
		        return false;
		    } else if(employeeName == ""){
		    	alert("Insert Employee Name ???");
		    	$('#employeeName').focus();
		        return false;
		    } else if(email==""){
		    	alert("Insert Valid Email Address ???");
		    	$('#email').focus();
		        return false;
		    }  else if(countryId == "0"){
		    	alert("Select Country ???");
		    	$('#countryId').focus();
		        return false;
		    } else {
		    	$('#btnSubmit').prop('disabled',true);
		    	$.ajax({
					type: form.attr('method'),
					url: form.attr('action'),
					data: form.serialize(),
					success: function (data) {
						$('#btnSubmit').prop('disabled',false);
						if(data==="1"){
						
						//loadGrid();
						clearForm();
						alert("Record Submitted Successfully.");
					} else if(data==="2"){
						
						//loadGrid();
						clearForm();
						alert("Record Updated Successfully.");
					} else {
						alert("Error...");
						}
					}
				});			 
				return false;		    	
		    }		
			
		});
	});
	
	function clearForm(){
	    $('#btnSubmit').prop('disabled',false);
	    $("#submit_form").trigger('reset'); 
	    $("#tempId").val('');	    
	}

</script>

<div class="bootstrap-iso">
	<div class="container-fluid">
	<div class="row">
	
		<div class="col-xs-12 col-md-6">
			<fieldset>
				<legend class="h4" style="margin:30px 0 20px 0;" id="selectedEmployeeTitle">Existing Data</legend>
				
			</fieldset>
			<div class="row alert alert-info" style="margin:20px 0 20px 0;">
				<div class="col-lg-4" align="right"><h4>Search</h4></div>
				<div class="col-lg-8">
					<div class="input-group">
				      	<input type="text" id="empSearch" class="form-control" placeholder="Enter Employee Id">
				      	<span class="input-group-btn">
				        	<button class="btn btn-info" type="button" onclick="funSearchEmployee()">Go!</button>
				      	</span>
					</div>
				</div>
			</div>
			<div id="divDataTable">
				
			</div>
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6">
			<form id="submit_form" name="submit_form" action="${pageContext.request.contextPath}/employee/save" method="post" class="well">
				<fieldset>
					<legend>Employee Information</legend>				
							
					<!-- Text input-->
					<div class="form-group">
						<label class="control-label requiredField" for="name">Employee ID</label>
						<div class="form-group">
							<input id="employeeId" name="employeeId"
								placeholder="Insert Employee ID" class="form-control" type="text" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Employee Name</label>
						<div class="form-group">
							<input id="employeeName" name="employeeName"
								placeholder="Insert Employee Naem" class="form-control" type="text" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="name">Email</label>
						<div class="form-group">
							<input id="email" name="email"
								placeholder="Insert Valid Eamil Address" class="form-control" type="text" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label requiredField" for="address">Country</label>
						<div class="form-group">
							<select id="countryId" name="countryId" class="form-control">
								 <option value="0">Select...</option>
							 <c:forEach var="i" items="${countryList}"> 
								<option value="${i.countryId}"><c:out value="${i.countryName}"/></option>
							</c:forEach> 
							</select>
						</div>
					</div>
					
					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="submit"></label>
						<div class="col-md-6">
						    <input type="hidden" id="tempId" name="tempId">
							<input id="btnClear" type="button" value="Clear Form" class="btn btn-warning" />
							<button id="btnSubmit" class="btn btn-primary">Save</button>
						</div>
					</div>
	
					
				</fieldset>
			</form>
			
		</div>
	</div>
	</div>
	</div>
	