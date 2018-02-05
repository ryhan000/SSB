<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JOURNAL</title>

<script type="text/javascript">

	$(document).ready(function(){
		
		//viewData();
		function validator(){
			
			var voucherid	= $.trim($("#voucherid").val());
			var date	= $.trim($("#date").val());
			var project	= $.trim($("#project").val());
			var client	= $.trim($("#client").val());
			var dept	= $.trim($("#dept").val());
			var invno	= $.trim($("#invno").val());
			var chead	= $.trim($("#chead").val());
			var debit	= $.trim($("#debit").val());
			var credit	= $.trim($("#credit").val());
			
			if(voucherid == ""){		
		   	 	$("#errorMessage").html("Please enter Voucher Id.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(date == ""){		
		   	 	$("#errorMessage").html("Please enter Date.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(project == ""){		
		   	 	$("#errorMessage").html("Please enter Project Data.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(client == "none"){		
		   	 	$("#errorMessage").html("Please Selcet a Client.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(dept == "none"){		
		   	 	$("#errorMessage").html("Please Select a Department.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(invno == ""){		
		   	 	$("#errorMessage").html("Please enter Invoice No.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(chead == ""){		
		   	 	$("#errorMessage").html("Please enter Control Head number.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(debit == ""){		
		   	 	$("#errorMessage").html("Please enter Debit number.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(credit == ""){		
		   	 	$("#errorMessage").html("Please enter Credit number.");
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
				var data = {};
				data["voucherid"] = $("#voucherid").val();
				data["date"] = $("#date").val();
				data["project"] = $("#project").val();
				data["client"] = $("#client").val();
				data["dept"] = $("#dept").val();
				data["invno"] = $("#invno").val();
				data["chead"] = $("#chead").val();
				data["debit"] = $("#debit").val();
				data["credit"] = $("#credit").val();
				alert(JSON.stringify(data));
				$("#successMessage").removeClass("hidden");
	
			} // End of validation		
		}); // End of form submission
	
	
	}); // End of document ready()
	
</script>

</head>
<body>
<div class="col-md-8 col-md-offset-2">
	<form>
<div class="panel panel-primary">
      <div class="panel-heading"><b>JOURNAL</b></div>
      <div class="panel-body">
      
	      <div class="col-md-12">
	      			<div id="successMessage" align="center" class="hidden alert alert-success"></div>
					<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>
		      <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Voucher ID:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="voucherid" class="form-control">
			      			</div>
		      			</div>
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Date:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="date" class="form-control">
			      			</div>
		      			</div>		
		      		</div>
		      </div>
	      </div>
	      <div class="col-md-12" style="padding-top:5px;">
		      <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Project:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="project" class="form-control">
			      			</div>
		      			</div>
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Client:</label>
			      			<div class="col-md-8">
			      			<select name="parent" id="client" class="form-control">
					      			<option value="none">Select</option>
					      			<option value="1">1</option>
					      			<option value="1">1</option>
					      		</select>
			      			</div>
		      			</div>		
		      		</div>
		      </div>
	      </div>
	      <div class="col-md-12" style="padding-top:5px;">
		      <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Department:</label>
			      			<div class="col-md-8">
			      			<select name="parent" id="dept" class="form-control">
					      			<option value="none">Select..</option>
					      			<option value="1">1</option>
					      			<option value="1">1</option>
					      		</select>
			      			</div>
		      			</div>
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Bill/Inv.No:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="invno" class="form-control">
			      			</div>
		      			</div>
		      					
		      		</div>
		      </div>
	      </div>
	      <div class="col-md-12" style="padding-top:5px;">
	      		<div class="row">
		      		<div class="form-group">
		      			<div class="col-md-12">
			      			<label class="control-label col-md-2" style="padding-top:5px; align:right;">Control Head:</label>
			      			<div class="col-md-10">
			      			<input type="text" id="chead" class="form-control">
			      			</div>
		      			</div>
		      					
		      		</div>
		      </div>
	      </div>
	      <div class="col-md-12" style="padding-top:5px;">
		      <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Debit:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="debit" class="form-control">
			      			</div>
		      			</div>
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;">Credit:</label>
			      			<div class="col-md-8">
			      			<input type="text" id="credit" class="form-control">
			      			</div>
		      			</div>		
		      		</div>
		      </div>
	      </div>
      
      </div>
    </div>
    <div class="col-md-12">
    <div class="panel panel-info">
      <div class="panel-body">
		      <table class="table table-bordered" style="height:100%;">
		    <thead>
		      <tr>
		        <th>ACCOUNT HEAD</th>
		        <th>DEBIT</th>
		        <th>CREDIT</th>
		        <th>PROJECT NAME</th>
		        <th>CLIENT</th>
		        <th>DEPT. NAME</th>
		        <th>BILL</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>John</td>
		        <td>Doe</td>
		        <td>John</td>
		        <td>Doe</td>
		        <td>Doe</td>
		        <td>John</td>
		        <td>Doe</td>
		        
		      </tr>
		      <tr>
		        <td>Mary</td>
		        <td>John</td>
		        <td>Doe</td>
		        <td>Doe</td>
		        <td>John</td>
		        <td>Doe</td>
		        <td>Moe</td>
		        
		      </tr>
		      <tr>
		        <td>July</td>
		        <td>Dooley</td>
		        <td>John</td>
		        <td>Doe</td>
		        <td>Doe</td>
		        <td>John</td>
		        <td>Doe</td>
		        
		      </tr>
		    </tbody>
		  </table>
      </div>
    </div>
    </div>
    <div class="col-md-12">
    <div class="panel panel-info">
      <div class="panel-body">
		     <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-6">
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;"></label>
			      			<div class="col-md-8">
			      			<input type="text" class="form-control">
			      			</div>
		      			</div>
		      			<div class="col-md-6">
		      				<div class="col-md-8">
			      			<input type="text" class="form-control">
			      			</div>
			      			<label class="control-label col-md-4" style="padding-top:5px; align:right;"></label>
			      			
		      			</div>		
		      		</div>
		      </div>
      </div>
    </div>
    </div>
    <div class="col-md-12">
    <div class="panel panel-info">
      <div class="panel-body">
		     <div class="row">
		      		<div class="form-group">
		      			<div class="col-md-12">
			      			<label class="control-label col-md-2" style="padding-top:5px; align:right;">Naration:</label>
			      			<div class="col-md-10">
			      			<input type="text" class="form-control">
			      			</div>
		      			</div>	
		      		</div>
		      </div>
      </div>
    </div>
    </div>
    <div class="col-md-12">
    		<div class="panel-body">
					<div class="row">
						<div class="col-md-6 col-md-offset-5">
						<button id="submit" name="submit" class="btn btn-primary">Save</button>
						<input id="btnClear" type="button" name="btnClear" value="Clear" class="btn btn-warning" />
						</div>
					</div>
				</div>
    </div>
    </form>
</div>
</body>
</html>