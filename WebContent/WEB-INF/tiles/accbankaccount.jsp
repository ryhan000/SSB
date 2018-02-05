

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc Bank Account</title>
<script type="text/javascript">

$(document).ready(function(){
	
	viewData();
	viewBankId();
	showData();
	function validator(){
		
		var bankid= $.trim($("#bankid").val());		
		if(bankid == ""){		
	   	 	$("#errorMessage").html("!! Please Enter Bank Id");
	   	    $("#errorMessage").removeClass("hidden");
	   	    $("#successMessage").addClass("hidden");	         	      	 
	        return false;		                
		}
		
        var account_number= $.trim($("#account_number").val());		
		if(account_number == ""){		
	   	 	$("#errorMessage").html("!! Please Enter Account Number");
	   	    $("#errorMessage").removeClass("hidden");
	   	    $("#successMessage").addClass("hidden");	         	      	 
	        return false;		                
		}
		
		 var branch= $.trim($("#branch").val());		
			if(branch == ""){		
		   	 	$("#errorMessage").html("!! Please Enter Bank Branch");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
		var bank_c_code= $.trim($("#bank_acc_code").val());		
			if(bank_acc_code == ""){		
		   	 	$("#errorMessage").html("!! Please Enter Bank Acc Code");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			var company_id= $.trim($("#company_id").val());		
			if(company_id == ""){		
		   	 	$("#errorMessage").html("!! Please Enter Company Id");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			var display= $.trim($("#display").val());		
			if(display == ""){		
		   	 	$("#errorMessage").html("!! Please Enter Display");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}	
			var created_by= $.trim($("#created_by").val());		
			if(created_by== ""){		
		   	 	$("#errorMessage").html("!! Please Enter Creator Name");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			
		
		return true;
	}
	
	
	/* Submitting form to controller*/
	$("#submit").click(function(event) {		
		
		event.preventDefault();
		
		if (validator()){
			
			var data= {};
			
			var tempId=$("#id").val();
			
			//alert(tempId);
			if(tempId.length==0){
				tempId="0";
			}
			
			
			
			var bankAccCode = null;
			 if( $.trim($("#bank_acc_code").val()) !== "" || $.trim($("#bank_acc_code").val()) !== null){	
				bankAccCode =bankAccCode ;
			}
			 alert(bankAccCode);
			data["id"]=tempId;
			data["bankid"] =$("#bankid").val() ;	
			data["account_number"] = $("#account_number").val();	
			data["branch"] = $("#branch").val();
			data["bank_acc_code"] = bankAccCode;
			data["company_id"] = $("#company_id").val();
			data["display"] = $("#display").val();
			data["created_by"] = $("#created_by").val();
			
			alert(JSON.stringify(data));
			//return false;
			$.ajax({
	             type: "POST",
	             url: "saveAccBankAccount",
	             data: JSON.stringify(data),
	             contentType: "application/json; charset=utf-8",             
	             success: function (successData) {
	            	showData();
	             	//$("#submit").prop("disabled", false);			                 
	                $("#successMessage").html(successData); 
	                $("#successMessage").removeClass("hidden");
	                $("#errorMessage").addClass("hidden");
	                      
	             },
	             error: function (error) {
	            	 /* $("#errorMessage").html("Error: Record Not Saved");
	            	 $("#errorMessage").removeClass("hidden");
	                 $("#submit").prop("disabled", false); */
	                 alert(JSON.stringify(error));
	             }
			}); 

		} // End of validation		
	}); // End of form submission
	
	$("#btnClear").click(function(event){
		
		$("#bank_id").val('');
		$("#accountnumber").val('');
		$("#branch").val('');
		$("#bankacccode").val('');
		$("#companyid").val('');
		$("#display").val('');
		$("#createdby").val('');
		
	});

}); 

function showData() {
	$.post("showAccBankAccount",function(data) {
						//alert(JSON.stringify(data));
						var dataTable = '<table class="table" id="accBankAccount"><tr><th>ID</th><th>Bank ID</th><th>Acc No</th><th>Branch</th><th>Acc Code</th><th>Company Id</th><th>Display</th><th>Created By</th><th>Update</th><th>Delete</th></tr>';

						for ( var key in data) {
							dataTable += '<tr><td>'
									+ data[key].id
									+ '</td><td>'
									+ data[key].bankid
									+ '</td><td>'
									+ data[key].account_number
									+ '</td><td>'
									+ data[key].branch
									+ '</td><td>'
									+ data[key].bank_acc_code
									+ '</td><td>'
									+ data[key].company_id
									+ '</td><td>'
									+ data[key].display
									+ '</td><td>'
									+ data[key].created_by
									+ '</td><td><input type="button" id="update" value="Update" class="update" onclick="funPopulate(' + data[key].id + ",'" + data[key].bankid + "','" + data[key].account_number+"','" + data[key].branch+"','" + data[key].bank_acc_code+"','" + data[key].company_id+"','" + data[key].display+"','" + data[key].created_by+  "'" + ')"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete(' +data[key].id + ')"></td></tr>';
						}

						dataTable += '</table>';

						$("#divDataTable").html(dataTable);
					})
}

function viewData() {
	$.post("showCompanyId",function(data) {
						//alert(JSON.stringify(data));
						var dataTable = '<select class="select form-control" id="company_id">';

						for ( var key in data) {
							dataTable += '<option value="'+ data[key].id + '"> '
									+ data[key].id + '</option>';
						}

						dataTable += '</select>';

						$("#sel1").html(dataTable);
					});
}

function viewBankId() {
	$.post("showBankId",function(data) {
						//alert(JSON.stringify(data));
						var dataTable = '<select class="select form-control" id="bankid">';

						for ( var key in data) {
							dataTable += '<option value="'+ data[key].id + '"> '
									+ data[key].id + '</option>';
						}

						dataTable += '</select>';

						$("#bank_id").html(dataTable);
					});
}
function funDelete(id) {

	var id = id;
	alert("Are you sure to Delete the Row?");
	$.post("deleteAccBankAccount", {id : id}, function(data) {

		showData();

		$("#successMessage").html("Data Deleted Successfully!!");
		$("#successMessage").removeClass("hidden");
		$("#errorMessage").addClass("hidden");
	});
}
function funPopulate(id,bankid,account_number,branch,bank_acc_code,company_id,display,created_by){
	alert(bank_acc_code);
	
	$("#id").val(id);
	$("#bankid").val(bankid);
	
	$("#account_number").val(account_number);
	$("#branch").val(branch);
	
	$("#bank_acc_code").val(bank_acc_code);
	$("#company_id").val(company_id);
	
	$("#display").val(display);
	$("#created_by").val(created_by);
	
}

function SearchTable() {
	  // Declare variables
	  var input, filter, table, tr, td, i;
	  input = document.getElementById("searchId");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("accBankAccount");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }
	  }
	}

	
</script>
</head>

<body>
	<div class="bootstrap-iso">
		<div class="container">
			<div class="row  col-md-offset-1">

				<div class="col-xs-10 col-sm-10 col-md-10">


					<div class="col-md-12">
						<fieldset>
							<legend>Acc Bank Account</legend>
							<div id="successMessage" align="center"
								class="hidden alert alert-success"></div>
							<div id="errorMessage" align="center"
								class="hidden alert alert-danger"></div>
						</fieldset>

					</div>

					<!--      end -->
					<!--  start form part  -->

					<div class="col-md-12">

						<!--  start first div -->
						<div class="col-md-12">
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-heading">

										<div class="row">
											<div class="col-md-6 col-md-offset-3">
												<input type="text" class="form-control" placeholder="Search By Id" id ="searchId" onkeyup="SearchTable()"/>
											</div>
										</div>

									</div>
									<div class="panel-body">
										<div id="divDataTable"></div>

									</div>
								</div>

							</div>

						</div>

						<!--  end firts div -->


						<div class="col-md-12">
							<div class="row">
								<div class="panel panel-default">
									<div class="panel-body">

										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start bank id =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bankid" style="padding-top: 5px">Bank Id:</label>
													<div class="col-md-4" id="bank_id">
														

													</div>
													<!--   =============   End bank id =========== -->
													<!--   =============   start bank number =========== -->
													<label class="control-label col-md-2 text-right"
														for="account_number" style="padding-top: 5px">Acc
														Number:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="account_number"
															name="accountnumber">
													</div>
													<!--   =============   end bank number =========== -->

												</div>
											</div>
										</div>
				<!-- =================================================== start second line ============= -->
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start branch =======================  -->
													<label class="control-label col-md-2 text-right"
														for="branch" style="padding-top: 5px">Branch:</label>
													<div class="col-md-4">
														<select class="form-control" id="branch">
															<option value="0">Select Option</option>
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
														</select>

													</div>
													<!--   =============   End bank id =========== -->
													<!--   =============   start account code =========== -->
													<label class="control-label col-md-2 text-right"
														for="bank_acc_code" style="padding-top: 5px">Acc
														Code:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="bank_acc_code"
															name="bank_acc_code">
													</div>
													</div>
													</div>
													</div>

		<!-- ======================================= end second line -->

											
										
		<!-- =============================================== start third line ==================================== -->
						
						<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start bank name =======================  -->
													<label class="control-label col-md-2 text-right"
														for="display" style="padding-top: 5px"> Display:</label>
													<div class="col-md-10">
														<input type="text" class="form-control" id="display"
															name="display">
													</div>
													<!--   =============   End bank name =========== -->
												</div>
											</div>
										</div>
						
						
		<!--  ========================================end third line =========================================== -->	
		
		<!--   ==================================== start fourth line ============================= -->	
				<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start company id =======================  -->
													<label class="control-label col-md-2 text-right"
														for="company_id" style="padding-top: 5px"> Company Id:</label>
													<div class="col-md-4" id="sel1">
														
													</div>
													
													<label class="control-label col-md-2 text-right"
														for="created_by" style="padding-top: 5px"> Created By:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="created_by"
															name="createdby">
													</div>
													
													<!--   =============   End company id =========== -->
												</div>
											</div>
										</div>
		
		
			
		
		<!--   ==================================== end fourth line ============================= -->		


									</div>
									<!-- end panel body -->
								</div>

							</div>
						</div>
		<!-- =========== button start =========================== -->	
		<div class="col-md-12">
						<div class="row">
						
							<div class="panel panel-default">
								<div class="panel-hading">
									<div class="panel-body">
										<input type="hidden" class="form-control" id="id" name="id">
										<div class="form-horizantal">
											<div class="form-group">
												<div class="col-md-4">
													<label class="col-md-12 control-label" for="blank"></label>
												</div>
												<div class="col-md-8">
													<div class="col-md-6">
														<input id="btnClear" type="button" name="btnClear"
															value="Clear" class="btn btn-warning" />
														<div class="col-md-8">
															<button id="submit" name="submit"
																class="btn btn-primary btn-block">Save</button>
														</div>
													</div>
												</div>

											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
		
		<!-- =========== button end =========================== -->				


					</div> <!-- end  full form div -->



					<!--  end form part -->


				</div>

			</div>
		</div>
	</div>
</body>
</html>
