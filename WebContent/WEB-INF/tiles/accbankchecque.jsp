<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc Bank Checque</title>


<script type="text/javascript">



$(document).ready(function(){
//alert("hello");
viewBankName();
viewBankAccount();
showData();
//createData();

$("#create").click(function(event) {
	event.preventDefault();
	

		if (validator()){
	createData();
		}
})

function validator(){
	
	var form= $.trim($("#form").val());		
	if(form == ""){		
   	 	$("#errorMessage").html("!! Please Enter Form Number");
   	    $("#errorMessage").removeClass("hidden");
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	
    var too= $.trim($("#too").val());		
	if(too == ""){		
   	 	$("#errorMessage").html("!! Please Enter to Number");
   	    $("#errorMessage").removeClass("hidden");
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	
	return true;
}

/* Submitting form to controller*/
	$("#submit").click(function(event) {		
		
		event.preventDefault();
		
		
		var array=[];
		var inps = document.getElementsByName('chequeNo[]');
		var inp;
		var data= [];

		
		for(var j=0;j<inps.length; j++){
			var element = {account_id:[], chequeNo:[]};
			element["account_id"] =$("#account_id").val() ;
		  	element["chequeNo"] = inps[j].value;
		  //alert(JSON.stringify(element));
		  	data.push(element);
		  	//alert(element["account_id"]);
			
		}
		//alert("Hello world");
		alert(JSON.stringify(data));
			$.ajax({
	             type: "POST",
	             url: "saveAccBankCheque",
	             data: JSON.stringify(data),
	             contentType: "application/json; charset=utf-8",             
	             success: function (successData) {
	            	
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

		 // End of validation		
	}); // End of form submission


});


function viewBankName(){
	$.post("showBankName",function(data){
		//alert(JSON.stringify(data));
	var dataTable ='<select class="select form-control" id="account_number" onchange="viewBankAccount(this.value);">';
	dataTable += '<option value="">Select</option>';
	for(var key in data){
	dataTable +='<option value="'+data[key].id+'">' + data[key].bankname + '</option>';
} 
    dataTable +='</select>';
    $("#bankname").html(dataTable);

});

}

function viewBankAccount(account_number){
	var id = $("#account_number").val();
	alert(id);
		$.post("showBankAccountById",{id : account_number},function(data){
		var dataTable ='<select class="select form-control" id="account_id">';
		for(var key in data){
		dataTable +='<option value="'+data[key].id+'">' + data[key].account_number + '</option>';
	} 
	   dataTable +='</select>';
	   $("#bank_name").html(dataTable);

	});

	} 
	
function pad (str, max) {
	  str = str.toString();
	  return str.length < max ? pad("0" + str, max) : str;
	}
	

	function createData(form, too){
		
		var form= $("#form").val();
		var too= $("#too").val();
		
		$("#chequeTable tr").remove("");
		var html = "";
		for(i=form;i<=too;i++){
			
			html +='<tr><td><input type="text" class="form-control" value="'+pad(i,6)+'" name="chequeNo[]"/></td></tr>';
		}
		
		$("#chequeTable").append(html);

	}
	
	

	function showData() {
		$.post("showAccBankCheque",function(data) {
							//alert(JSON.stringify(data));
							var dataTable = '<table class="table" id="accBankCheque"><tr><th>ID</th><th>Account Id</th><th>Cheque No</th><th>Update</th><th>Delete</th></tr>';

							for ( var key in data) {
								dataTable += '<tr><td>'
										+ data[key].cheque_id
										+ '</td><td>'
										+ data[key].account_id
										+ '</td><td>'
										+ data[key].chequeNo
										+ '</td><td><input type="button" id="update" value="Update" class="update" onclick="funPopulate(' + data[key].id + ",'" + data[key].bankid + "','" + data[key].account_number+"','" + data[key].branch+"','" + data[key].bank_acc_code+"','" + data[key].company_id+"','" + data[key].display+"','" + data[key].created_by+  "'" + ')"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete(' +data[key].id + ')"></td></tr>';
							}

							dataTable += '</table>';

							$("#divChequeTable").html(dataTable);
						})
	}
	
	function SearchTable() {
		  // Declare variables
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("searchId");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("accBankCheque");
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
			<div class="row">

				<div class="col-xs-10 col-sm-10 col-md-10">


					<!--   for full div -->

					<div class="col-md-12">
						<div class="col-md-12">
							<fieldset>
								<legend>Acc Bank Checque</legend>
								<div id="successMessage" align="center"
									class="hidden alert alert-success"></div>
								<div id="errorMessage" align="center"
									class="hidden alert alert-danger"></div>
							</fieldset>
						</div>


						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="row">
										<div class="col-md-6 col-md-offset-3">
											<input type="text" class="form-control" placeholder="search"  id ="searchId" onkeyup="SearchTable()">
										</div>
									</div>
								</div>
								<div class="panel-body">
									<div id="divChequeTable"></div>
								</div>
							</div>

						</div>

					<form id="submit_form" name="submit_form" action="${pageContext.request.contextPath}/convocation/save" method="post">
						<!--   start form part -->
						<div class="col-md-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right"
														for="bankname" style="padding-top: 5px"> Bank
														Name:</label>
													<div class="col-md-4" id="bankname">
														
													</div>
													<label class="control-label col-md-2 text-right"
														for="bankAccount" style="padding-top: 5px"> Account
														No:</label>
													<div class="col-md-4" id="bank_name">
														
													</div>
												</div>
											</div>
										</div>
									</div>

									<!--  end first line -->
									<!--  start second line -->
									<div class="row">
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right" for="form"
														style="padding-top: 5px">Form :</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="form"
															name="form">
													</div>

												</div>
												<label class="control-label col-md-2 text-right" for="to"
													style="padding-top: 5px"> To :</label>
												<div class="col-md-4">
													<input type="text" class="form-control" id="too" name="too">
												</div>
											</div>
										</div>

									</div>
									<!-- end 2nd line -->
									<div class="row">
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right" for="form"
														style="padding-top: 5px"></label>
													<div class="col-md-4">
														
													</div>

												</div>
												<label class="control-label col-md-2 text-right" for="to"
													style="padding-top: 5px"></label>
												<div class="col-md-2 col-md-offset-2">
													<button id="create" name="create"
																class="btn btn-primary">Create</button>
												</div>
											</div>
										</div>

									</div>

									<!-- end third line -->

								</div>
							</div>

						</div>
	
						<!--   end form part -->

<!-- hidden part -->
                           <div class="col-md-12">
							<div class="panel panel-default">
								
								<div class="panel-body ">
									
									<table id="chequeTable">
										<tr>
											<td><input type="text" class="form-control" name="chequeNo[]" id="chequeNo[]"/></td>
										</tr>
										
									</table>
									<input type="hidden" class="form-control" id="cheque_id" name="cheque_id">
										<div class="form-horizantal">
												<div class="form-group">
													<label class="control-label col-md-2 text-right" for="form"
														style="padding-top: 5px"></label>
													<div class="col-md-4">
														
													</div>

												</div>
												<label class="control-label col-md-2 text-right" for="to"
													style="padding-top: 5px"></label>
												<div class="col-md-2 col-md-offset-2">
												<input type="hidden" class="form-control" id="cheque_id" name="cheque_id">
													<button id="submit" name="submit"
																class="btn btn-primary">Save</button>
												</div>
											</div>
									
								</div>
							</div>

						</div>

</form>
<!-- hidden part  end  -->




					</div>
					<!--  end of full div class -->

				</div>
			</div>

		</div>

	</div>


</body>
</html>