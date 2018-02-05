<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acc Fixed Asset</title>
<script type="text/javascript">

$(function() {
		$("#purchase_date").datepicker({
			dateFormat : "yy-mm-dd"

		});
});

$(document).ready(function(){
	$("#submit").click(function(event) {
		if(validator()){
			alert("validation done!");
		}
	});
});

function validator(){
	var item_id     	=$.trim($("#item_id").val());
	var purchase_date	= $.trim($("#purchase_date").val());
	var purchase_qty	= $.trim($("#purchase_qty").val());
	var purchase_rate	= $.trim($("#purchase_rate").val());
	var depri_percent	= $.trim($("#depri_percent").val());
	var salvage_value	= $.trim($("#salvage_value").val());
	
	if(item_id == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	else if(purchase_date == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	else if(purchase_qty == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	else if(purchase_rate == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	else if(depri_percent == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	else if(salvage_value == ""){		
   	 	$("#errorMessage").html("Please Select Acc Group.");
   	    $("#errorMessage").removeClass("hidden");
   	 	
   	    
   	    $("#successMessage").addClass("hidden");	         	      	 
        return false;		                
	}
	return true;
	
}
</script>
</head>
<body>

<div class="col-md-10 col-lg-10 col-sm-10 col-md-offset-1" style="padding-top:80px;">
	<div class="panel panel-primary">
      <div class="panel-heading"><b>Fixed Asset</b></div>
      <div class="panel-body">
      		<div class="col-md-12" style="padding-top:5px">
      		<div class="col-md-2"><b>Item ID</b></div>
      		<div class="col-md-4"><input type="text" id="item_id" class="form-control"></div>
      		<div class="col-md-2"><b>Purchase Date</b></div>
      		<div class="col-md-4"><input type="date" id="purchase_date" class="form-control"></div>
      		</div>
      		<div class="col-md-12" style="padding-top:5px">
      		<div class="col-md-2"><b>purchase Quantity</b></div>
      		<div class="col-md-4"><input type="text" id="purchase_qty" class="form-control"></div>
      		<div class="col-md-2"><b>purchase Rate</b></div>
      		<div class="col-md-4"><input type="text" id="purchase_rate" class="form-control"></div>
      		</div>
      		<div class="col-md-12" style="padding-top:5px">
      		<div class="col-md-2"><b>Depreciation Percent</b></div>
      		<div class="col-md-4"><input type="text" id="depri_percent" class="form-control"></div>
      		<div class="col-md-2"><b>Salvage Value</b></div>
      		<div class="col-md-4"><input type="text" id="salvage_value" class="form-control"></div>
      		</div>
      		<div class="col-md-5"></div>
      		<div class="col-md-6">
				<input id="submit" type="button" name="submit" value="Save" class="btn btn-primary" />
				<input id="btnClear" type="button" name="btnClear" value="Clear" class="btn btn-warning" />
			</div>
      </div>
    </div>
</div>
</body>
</html>