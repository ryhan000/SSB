<script type="text/javascript">
	$(document).ready(function(){
		gradeTable();
		function validator(){
			
			var id= $.trim($("#studentid").val());		
			
			if(id == ""){		
		   	 	$("#errorMessage").html("!! Please enter ID:");
		   	    $("#errorMessage").removeClass("hidden");
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			
			return true;
		}
$("#submit").click(function(event) {		
			
			
	event.preventDefault();
			
			
			if (validator()){
				var data = {};
				
				data["student_id"] = $("#studentid").val();	
				data["subject_name"] = $("#subjectname").val();	
				data["student_number"] = $("#mark").val();	
				
				//alert(JSON.stringify(data));
				//return false;
				$.ajax({
		             type: "POST",
		             url: "saveStudentResult",
		             data: JSON.stringify(data),
		             contentType: "application/json; charset=utf-8",             
		             success: function (successData) {
		            	alert("Data inserted");
		            	 
		             	$("#submit").prop("disabled", false);			                 
		                $("#successMessage").html(successData); 
		                $("#successMessage").removeClass("hidden");
		                $("#errorMessage").addClass("hidden");
		                      
		             },
		             error: function (error) {
		            	 $("#errorMessage").html("Error: Record Not Saved");
		            	 $("#errorMessage").removeClass("hidden");
		                 $("#submit").prop("disabled", false);
		                 
		             }
				}); 
	
			} // End of validation		
		}); // End of form submission
	});
	function gradeTable(){
		$.post("showGrade",function(data){
			var dataGrade =  '<table class="table"><tr><th>Mark</th><th>Grade</th></tr></table>';
			dataGrade +='<tr><td>+data["A_max"]+"-"+data["A_min"]</td><td>A</td></tr>';
			dataGrade +='<tr><td>+data["B_max"]+"-"+data["B_min"]</td><td>B</td></tr>';
			dataGrade +='<tr><td>+data["C_max"]+"-"+data["C_min"]</td><td>C</td></tr>';
			dataGrade +='<tr><td>+data["D_max"]+"-"+data["D_min"]</td><td>D</td></tr>';
			dataGrade +='<tr><td>+data["E_max"]+"-"+data["E_min"]</td><td>E</td></tr>';
			dataGrade +='<tr><td>+data["F_max"]+"-"+data["F_min"]</td><td>F</td></tr></table>';
			$("#gradeTable").html(dataGrade);
		})
	}
</script>
<div class="bootstrap-iso">
	<div class="container-fluid shadow">
         <div class="row">
             <div class="row">
                <div class="col-md-12">
                <div class="row alert alert-info" style="margin:20px 0 20px 0;">
				<div class="col-lg-4" align="right">
				<div class="col-lg-2">
				<div id="gradeTable"></div>
				</div>
				<div class="col-lg-2">
				<div id="searchTable">
				
				</div>
				</div>
				</div>
				<div class="col-lg-8">
					<div class="input-group">
				      	<input type="text" id="empSearch" class="form-control" placeholder="Enter Student Id">
				      	<span class="input-group-btn">
				        	<button class="btn btn-info" type="button" onclick="funSearchEmployee()">Search</button>
				      	</span>
					</div>
				</div>
			</div>
			<div id="divDataTable">
				
			</div>
                </div>
             </div>
		<div class="row">
             <div class="col-md-6"></div>
        <div class="col-md-6">
           <form id="studentform" class="form-horizontal">
				<fieldset>
				<legend>Mark Submit Panel</legend>
				<div id="successMessage" align="center" class="hidden alert alert-success"></div>
					<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>	
									
									<!-- Text input-->
									<div class="form-group">
									  <label class="col-md-4 control-label" for="studentid">Student ID :</label>  
									  <div class="col-md-4">
									  <input id="studentid" name="studentid" placeholder="143-35-111" class="form-control input-md" type="text">
									    
									  </div>
									</div>
									
									<!-- Text input-->
									<div class="form-group">
									  <label class="col-md-4 control-label" for="subjectname">Subject Name :</label>  
									  <div class="col-md-4">
									  <input id="subjectname" name="subjectname" placeholder="" class="form-control input-md" type="text">
									    
									  </div>
									</div>
									
									<!-- Text input-->
									<div class="form-group">
									  <label class="col-md-4 control-label" for="mark">Mark :</label>  
									  <div class="col-md-4">
									  <input id="mark" name="mark" placeholder="" class="form-control input-md" type="text">
									    
									  </div>
									</div>
									
									<!-- Button (Double) -->
									<div class="form-group">
									  <label class="col-md-4 control-label" for="submit"></label>
									  <div class="col-md-8">
									    <button id="submit" name="submit" value="Clear Form" class="btn btn-primary">Save</button>
									    <button id="clear" name="clear" class="btn btn-warning">Clear</button>
									  </div>
									</div>
									
									</fieldset>
									</form>
						</div>
					</div>
									
									
			</div>
		</div>
</div>