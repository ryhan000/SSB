<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

	<script type="text/javascript">

	var parentlist;
	
	
	$(document).ready(function(){
		getparent();
		viewData();
		
		//viewData();
		function validator(){
			
			var cag_name	= $.trim($("#cag_name").val());
			var cag_parent	= $.trim($("#cag_parent").val());
			
			if(cag_name == ""){		
		   	 	$("#errorMessage").html("Please enter Group.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			}
			if(cag_parent == ""){		
		   	 	$("#errorMessage").html("Please Select parent");
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
				var cag_id = $("#cag_id").val();
				if(cag_id.length== 0){
					cag_id = 0;
				}
				data["cag_id"] = $("#cag_id").val();
				data["cag_name"] = $("#cag_name").val();
				data["cag_parent"] = $("#cag_parent").val();
				//alert(JSON.stringify(data));
				/*$("#errorMessage").addClass("hidden");
				$("#successMessage").html("Done!");
				$("#successMessage").removeClass("hidden");*/
				$.ajax({
		             type: "POST",
		             url: "saveAccCaGroups/"+cag_id,
		             data: JSON.stringify(data),
		             contentType: "application/json; charset=utf-8",             
		             success: function (successData) {
		            	$("#cag_id").val("");
		            	$("#cag_name").val("");
		            	$("#cag_parent").val("");
		            	 viewData();
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
		$("#btnClear").click(function(event) {	
			$("#cag_id").val('');
			$("#cag_name").val('');
			$("#cag_parent").val('');
		});
	}); // End of document ready()
	function getparent(){
		$.post("showParent", function(data){
			  parentlist= data;
			  var select = '<select class="select form-control" id="cag_parent">';
			  for(key in data)
				  {
				  select +='<option value="' +data[key].cag_id+'">' +data[key].cag_name +'</option>';
				  }
			  		select +='</option>';
				  $("#divparent").html(select);
		});
	}
	function showParent(a){
		var c_parent = a;
		for(var check in parentlist){
			if(parentlist[check].cag_id==c_parent){
				return parentlist[check].cag_name;
			}
		}
		
	}
	function viewData(){
		$.post("showAccCaGroups", function(data){
			//alert(JSON.stringify(data));
			//
			var dataTable = '<table class="table" id="tblAccountsGroup"><tr><th><b>GROUP ID</th><th><b>NAME</b></th><th class="hidden"><b>PARENT ID</b></th><th><b>PARENT</b></th><th colspan="2"><b>CONTROL</b></th></tr>';
			
			for(var key in data){
				dataTable += '<tr><td>' + data[key].cag_id + '</td><td>' + data[key].cag_name+'</td><td>' + showParent(data[key].cag_parent) +'</td><td><input type="button" id="update" onclick="populate(' + data[key].cag_id + ",'" + data[key].cag_name + "','" + data[key].cag_parent + "'" + ')" value="Update" class="update"></td><td><input type="button" id="delete" value="Delete" class="delete" onclick="funDelete(' +data[key].cag_id+ ')"></td></tr>';
			}
			
			dataTable += '</table>';
			
			$("#divDataTable").html(dataTable);
			
			
			$('#tblAccountsGroup tbody').on('click', 'tr', function () {
		        alert(table.row(this).data());
		    });
		})
	}
	function SearchTable() {
		  // Declare variables
		  var input, filter, table, tr, td, i;
		  input = document.getElementById("searchName");
		  filter = input.value.toUpperCase();
		  table = document.getElementById("tblAccountsGroup");
		  tr = table.getElementsByTagName("tr");

		  // Loop through all table rows, and hide those who don't match the search query
		  for (i = 0; i < tr.length; i++) {
		    td = tr[i].getElementsByTagName("td")[1];
		    if (td) {
		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
		        tr[i].style.display = "";
		      } else {
		        tr[i].style.display = "none";
		      }
		    }
		  }
		}
	function populate(id, name, parent){
		$("#cag_id").val(id);
		$("#cag_name").val(name);
		$("#cag_parent").val(parent);
	}
function funDelete(Id){
		
		var cag_id = Id;
		alert("Are you sure to Delete the Row?");		
		$.post("deleteAccCaGroups",{cag_id:Id},function(data){
			
			viewData();
			
			$("#successMessage").html("Data Deleted Successfully!!"); 
            $("#successMessage").removeClass("hidden");
            $("#errorMessage").addClass("hidden");
		});
	}
</script>

</head>
<body>
<div class="col-md-8 col-lg-8 col-sm-8 col-md-offset-2" style="padding-top:80px;">
		<div class="col-md-12" style="margin-bottom: 0px;">
			<div class="panel panel-primary">
			      <div class="panel-heading"><b>CHART OF ACCOUNTS GROUP</b></div>
    		</div>
	    </div>
	    <div class="col-md-12" style="margin-bottom: 0px;">
	    	<div id="successMessage" align="center" class="hidden alert alert-success"></div>
					<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>
	    	<div class="panel panel-info">
			      <div class="panel-heading">
			      		<div class="row">
			      			<div class="col-md-6 col-md-offset-3">
			      			<input type="text" class="form-control" placeholder="Search by Name." id="searchName" onkeyup="SearchTable()">
			      			</div>
			      		</div>
			      </div>
			      <div class="panel-body">
			      		<div class="table-responsive" id="divDataTable">
			      		</div>
			      </div>
    		</div>
    		
	    </div>
	    <div class="col-md-12" style="margin-bottom:0px;">
		<div class="panel panel-success">
			    <div class="panel-heading">
					     <div class="row">
					     		<label class="hidden" id="cag_id"></label>
					     		<div class="col-md-2" style="padding:5px;"><b>Group Name:</b></div>
					      		<div class="col-md-4 ">
					      		<input type="text" id="cag_name" class="form-control">
					      		</div>
					      		<div class="col-md-2" style="padding:5px;"><b>Parent:</b></div>
					      		<div id="divparent" class="col-md-4 ">
					      		
					      		</div>
					     </div>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-6 col-md-offset-5">
						<button id="submit" name="submit" class="btn btn-primary">Save</button>
						<input id="btnClear" type="button" name="btnClear" value="Clear" class="btn btn-warning" />
						</div>
					</div>
				</div>
			</div>
		</div>
			
</div>
</body>
</html>