<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc Bank Infor</title>

<script type="text/javascript">


	$(document).ready(function() {

						viewData();
						function validator() {

							var bankname = $.trim($("#bankname").val());
							if (bankname == "") {
								$("#errorMessage").html("Please Enter Bank Name.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}

							var bshortname = $.trim($("#bshortname").val());
							if (bshortname == "") {
								$("#errorMessage").html(
										"Please Enter Bank Short Name.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}
							var bcontactnumber = $.trim($("#bcontactnumber")
									.val());
							if (bcontactnumber == "") {
								$("#errorMessage").html(
										"Please Enter Contact Number.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}
							var bemail = $.trim($("#bemail").val());
							if (bemail == "") {
								$("#errorMessage").html("Please Enter Email.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}
							var bfaxno = $.trim($("#bfaxno").val());
							if (bfaxno == "") {
								$("#errorMessage")
										.html("Please Enter Fax No .");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}
							var bankurlno = $.trim($("#bankurlno").val());
							if (bankurlno == "") {
								$("#errorMessage").html("Please Enter Url No.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}
							var createdby = $.trim($("#createdby").val());
							if (createdby == "") {
								$("#errorMessage").html(
										"Please Enter  Creater Name.");
								$("#errorMessage").removeClass("hidden");
								$("#successMessage").addClass("hidden");
								return false;
							}

							return true;
						}

						/* Submitting form to controller*/
						$("#submit").click(function(event) {

											event.preventDefault();
											//alert("hello");

											if (validator()) {

												var data = {};
												
												var tempId=$("#id").val();
												
												if(tempId.length==0){
													tempId="0";
												}
												
							data["id"]=tempId;			
							data["bankname"] = $("#bankname").val();
							data["bshortname"] = $("#bshortname").val();														
							data["bcontactnumber"] = $("#bcontactnumber").val();									
							data["bemail"] = $("#bemail").val();
							data["bfaxno"] = $("#bfaxno").val();							
							data["bankurlno"] = $("#bankurlno").val();							
							data["createdby"] = $("#createdby").val();
														

												//alert(JSON.stringify(data));
												//return false;
												$
														.ajax({
															type : "POST",
															url : "saveAccBankInfo",
															data : JSON.stringify(data),
															contentType : "application/json; charset=utf-8",
															success : function(successData) {
																viewData();
																
																//$("#submit").prop("disabled", false);			                 
																$("#successMessage").html(successData);
																$("#successMessage").removeClass("hidden");
																$("#errorMessage").addClass("hidden");

															},
															error : function(error) {
																 $("#errorMessage").html("Error: Record Not Saved");
																$("#errorMessage").removeClass("hidden");
																$("#submit").prop("disabled", false); 
																//alert(JSON.stringify(error));
															}
														});

											} // End of validation		
										}); // End of form submission

						function viewData() {
							$.post("showAccBankInfo",function(data) {
												//alert(JSON.stringify(data));
												var dataTable = '<table class="table" id="accBankInfo"><tr><th>ID</th><th>Bank Name</th><th>Short Name</th><th>Contact No</th><th>Email</th><th>Fax</th><th>Url</th><th>Created By</th><th>Update</th><th>Delete</th></tr>';

												for ( var key in data) {
													dataTable += '<tr><td>'
															+ data[key].id
															+ '</td><td>'
															+ data[key].bankname
															+ '</td><td>'
															+ data[key].bshortname
															+ '</td><td>'
															+ data[key].bcontactnumber
															+ '</td><td>'
															+ data[key].bemail
															+ '</td><td>'
															+ data[key].bfaxno
															+ '</td><td>'
															+ data[key].bankurlno
															+ '</td><td>'
															+ data[key].createdby
															+ '</td><td><input type="button" id="update" value="Update" class="update" onclick="funPopulate(' + data[key].id + ",'" + data[key].bankname + "','" + data[key].bshortname+"','" + data[key].bcontactnumber+"','" + data[key].bemail+"','" + data[key].bfaxno+"','" + data[key].bankurlno+"','" + data[key].createdby+  "'" + ')"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete(' +data[key].id + ')"></td></tr>';
												}

												dataTable += '</table>';

												$("#divDataTable").html(dataTable);
											})
						}
										
						

						$("#btnClear").click(function(event) {

							$("#bankname").val('');
							$("#bshortname").val('');
							$("#bcontactnumber").val('');
							$("#bemail").val('');
							$("#bfaxno").val('');
							$("#bankurlno").val('');
							$("#createdby").val('');

						});

					});
	function funDelete(id) {

		var id = id;
		alert("Are you sure to Delete the Row?");
		$.post("deleteAccBankInfo", {id : id}, function(data) {

			viewData();

			$("#successMessage").html("Data Deleted Successfully!!");
			$("#successMessage").removeClass("hidden");
			$("#errorMessage").addClass("hidden");
		});
	}
	
	
	
	function funPopulate(id,bankname,bshortname,bcontactnumber,bemail,bfaxno,bankurlno,createdby){
		//alert(com);
		$("#id").val(id);
		$("#bankname").val(bankname);
		$("#bshortname").val(bshortname);
		$("#bcontactnumber").val(bcontactnumber);
		$("#bemail").val(bemail);
		$("#bfaxno").val(bfaxno);
		$("#bankurlno").val(bankurlno);
		$("#createdby").val(createdby);
		
	}
	
	function SearchTable() {
		  // Declare variables
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("searchId");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("accBankInfo");
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
			<div class="row  ">


				<div class="col-xs-10 col-sm-10 col-md-10">

					<div class="col-md-12">
						<fieldset>
							<legend>Acc Bank Info</legend>
							<div id="successMessage" align="center"
								class="hidden alert alert-success"></div>
							<div id="errorMessage" align="center"
								class="hidden alert alert-danger"></div>
						</fieldset>

					</div>


					<div class="col-md-12 ">
						
							<div class="panel panel-default">
								<div class=" panel-heading">
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


					<!--  ======================================  start form part  -->

					<div class="col-md-12">
						<div class="row">
						
							<div class="panel panel-default">
								
									<div class="panel-body">

										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start bank name =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bankname" style="padding-top: 5px">Bank Name:</label>
													<div class="col-md-10">
														<input type="text" class="form-control" id="bankname"
															name="bankname">
													</div>
													<!--   =============   End bank name =========== -->
												</div>
											</div>
										</div>

										<!--  end first line -->
										<!--  start second line -->
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start bank short  name =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bshortname" style="padding-top: 5px">Short
														Name:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="bshortname"
															name="bshortname">
													</div>
													<!--   =============   End bank short  name =========== -->
													<!--        ============Start bank contact  number =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bcontactnumber" style="padding-top: 5px">Contact
														Number:</label>
													<div class="col-md-4">
														<input type="text" class="form-control"
															id="bcontactnumber" name="bcontactnumber">
													</div>
													<!--   =============   End bank contact number =========== -->
												</div>
											</div>
										</div>


										<!--  end second line -->

										<!--  start third line -->

										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start email  name =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bemail" style="padding-top: 5px">Email:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="bemail"
															name="bemail">
													</div>
													<!--   =============   End email  name =========== -->
													<!--        ============Start fax  no =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bfaxno" style="padding-top: 5px">Fax No:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="bfaxno"
															name="bfaxno">
													</div>
													<!--   =============   End bank cfax no =========== -->
												</div>
											</div>
										</div>


										<!--   end third line -->

										<!--  start fourth line -->
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start bank url name =======================  -->
													<label class="control-label col-md-2 text-right"
														for="bankurlno" style="padding-top: 5px">Bank Url
														No:</label>
													<div class="col-md-10">
														<input type="text" class="form-control" id="bankurlno"
															name="bankurlno">
													</div>
													<!--   =============   End bank url  name =========== -->
												</div>
											</div>
										</div>


										<!--   end fourth line -->

										<!-- start fifth line -->
										<div class="col-md-12">
											<div class="form-horizantal">
												<div class="form-group">
													<!--        ============Start created by =======================  -->
													<label class="control-label col-md-2 text-right"
														for="createdby" style="padding-top: 5px">Created
														By:</label>
													<div class="col-md-10">
														<input type="text" class="form-control" id="createdby"
															name="createdby">
													</div>
													<!--   =============   End created by =========== -->
												</div>
											</div>
										</div>

										<!--  end fifth line -->






									
								</div>
							</div>
						</div>
						
					</div>

					<!-- End form part =========================================  -->

					<!--  start button part ============= -->

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
					</div>




					<!--  end button part================= -->










				

</div>
</div>
			</div>
		</div>
	
</body>
</html>








