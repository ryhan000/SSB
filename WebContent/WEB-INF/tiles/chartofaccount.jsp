<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart of Account</title>

<script type="text/javascript">

	$(document).ready(function(){
		getAccCaGroups();
		//viewData();
		function validator(){
			var controllevel =$.trim($("#controlllevel").val());
			var accgroup	= $.trim($("#accgroup").val());
			var accsubgroup	= $.trim($("#acccasubgroup").val());
			var controlhead	= $.trim($("#cHead_1").val());
			var subcontrolhead	= $.trim($("#cHead_2").val());
			var subsubcontrolhead	= $.trim($("#cHead_3").val());
			var controlheadname	= $.trim($("#controlheadname_1").val());
			var subcontrolheadname	= $.trim($("#controlheadname_2").val());
			var subsubcontrolheadname	= $.trim($("#controlheadname_3").val());
			alert(controlhead);
			if(accgroup == ""){		
		   	 	$("#errorMessage").html("Please Select Acc Group.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			} 
			else if(accsubgroup == ""){		
		   	 	$("#errorMessage").html("Please Select Acc Sub Group.");
		   	    $("#errorMessage").removeClass("hidden");
		   	 	
		   	    
		   	    $("#successMessage").addClass("hidden");	         	      	 
		        return false;		                
			} else if(controllevel == 1){
				if(controlhead == ""){		
			   	 	$("#errorMessage").html("Please Enter Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
				else if(controlheadname == ""){		
			   	 	$("#errorMessage").html("Please Enter Controlhead name.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
			} else if(controllevel == 2){
				if(controlhead == ""){		
			   	 	$("#errorMessage").html("Please Enter Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
				else if(controlheadname == ""){		
			   	 	$("#errorMessage").html("Please Enter Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
				else if(subcontrolhead == ""){		
			   	 	$("#errorMessage").html("Please Enter Sub Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
				else if(subcontrolheadname == ""){		
			   	 	$("#errorMessage").html("Please Enter Sub Controlhead Name.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				}
				
			} else if(controllevel == 3){
				//alert("in 3");
				if(controlhead == ""){
					
			   	 	$("#errorMessage").html("Please Enter Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;	
			        
			        
				} else if(controlheadname == ""){
					
			   	 	$("#errorMessage").html("Please Enter Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;	
			        
			        
				} else if(subcontrolhead == ""){		
					
			   	 	$("#errorMessage").html("Please Enter Sub Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;	
			        
			        
				} else if(subcontrolheadname == ""){		
					
			   	 	$("#errorMessage").html("Please Enter Sub Controlhead Name.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		
			        
				} else if(subsubcontrolhead == ""){		
			   	 	
					$("#errorMessage").html("Please Enter Sub Sub Controlhead Name.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;	
			        
				} else if(subsubcontrolheadname == ""){		
			   	 	
					$("#errorMessage").html("Please Enter Sub Sub Controlhead.");
			   	    $("#errorMessage").removeClass("hidden");
			   	 	
			   	    
			   	    $("#successMessage").addClass("hidden");	         	      	 
			        return false;		                
				} 
					
			}
			
			return true;
			
			
			
	}
		
		$("#submit").click(function(event) {		
			
			//event.preventDefault();
			
			
			if(validator()){	
				var data = [];			
				
				var controllevel =$.trim($("#controlllevel").val());
				alert("control Level value:"+controllevel);
				
				 for(var i = 1; i <= controllevel; i++){
					var element = {caId:[],caName:[],casgId:[],caComid:[],caParent:[],caLevel:[],display:[]};
					element["caId"] = $("#cHead_" + i).val();
					element["caName"] = $("#controlheadname_" + i).val();
					element["casgId"] = $("#acccasubgroup").val();
					element["caComid"] = 1;
					
					if(i ==1){
						element["caParent"] = null;
					} else if(i == 2){
						element["caParent"] = $("#cHead_1").val();
					} else if(i == 3){
						element["caParent"] = $("#cHead_2").val();
					}
					element["caLevel"] = i;
					element["display"]=1;
					alert(JSON.stringify(element));
					data.push(element);
				}
				 
				 $.ajax({
		             type: "POST",
		             url: "saveChartOfAccounts",
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
			
		}); 
	
	
	}); //End of document ready()
		
	function showDiv(elem){
		if(elem.value==1){
			document.getElementById('div2_1').style.display ="none";
			document.getElementById('div2_2').style.display ="none";
			document.getElementById('div3_1').style.display ="none";
			
		}
		else if(elem.value==2){
			document.getElementById('div2_1').style.display ="none";
			document.getElementById('div2_2').style.display ="block";
			document.getElementById('div3_1').style.display ="none";
		}
		else{
			document.getElementById('div2_1').style.display ="none";
			document.getElementById('div2_2').style.display ="block";
			document.getElementById('div3_1').style.display ="block";
		}
	}
	function getAccCaGroups(){
		$.post("showAccCaGroups", function(data){
				//alert(JSON.stringify(data));
			  var select = '<select class="select form-control" id="accgroup" onchange="GetSubAccCaGroup(this.value);">';
			  select +='<option value="">Select</option>';
			  for(key in data)
				  {
				  select +='<option value="' +data[key].cag_id+'">' +data[key].cag_name +'</option>';
				  }
			  		select +='</option>';
				  $("#accgroupdiv").html(select);
				  
		});
	}
	
	function GetSubAccCaGroup(cag_id){
		$.post("GetSubAccGroupbyGroupID",{cag_id:cag_id}, function(data){
			//alert(JSON.stringify(data));
			var selectSubacc = '<select class="select form-control" id="acccasubgroup" onchange="createhead();">';
			    selectSubacc += '<option value="0">Select</option>';
			for(key in data){
				selectSubacc += '<option value="'+data[key].casg_id+'">' +data[key].casg_name +'</option>';
			}
			selectSubacc += '</select>';
			$("#SubGroup").html(selectSubacc);
			document.getElementById('div2_1').style.display ="block";
			/* var auto = $("#controlllevel").val();
			if(auto == 1){
				auto = 1;
				controlhead(auto);
			}
			else if(auto == 2){
				auto = 2
				controlhead(auto);
			}
			else if(auto ==3){
				auto = 3;
				controlhead(auto);
			} */
		});
	}
	function createhead(){
		var acccasubgroup = $("#acccasubgroup").val();
		if(acccasubgroup != 0){
			var auto = $("#controlllevel").val();
			if(auto == 1){
				auto = 1;
				controlhead(auto);
			}
			else if(auto == 2){
				auto = 2
				controlhead(auto);
			}
			else if(auto ==3){
				auto = 3;
				controlhead(auto);
			}
		}
		else{
			$('#cHead_1').val('');
			$('#cHead_2').val('');
			$('#cHead_3').val('');
		}
	}
	
	function controlhead(auto){
		var Controlheadmax;
		var casgId = $("#acccasubgroup").val();
		$.post("getControlHeadMax",{casgId:casgId, cagId: $("#accgroup").val()} ,function(data){
			//alert(JSON.stringify(data));
			$('#cHead_1').val(data);
			
			if(auto >= 2){
				//alert(auto);
				subcontrolhead(auto);
			}
		});
		//alert(auto);
		
		
	}
	function subcontrolhead(auto){
		var casgId = $("#acccasubgroup").val();
		$.post("getSubControlHeadMax",{casgId:casgId, cagId: $("#accgroup").val(), caId:$("#cHead_1").val()} ,function(data){
			//alert(JSON.stringify(data));
			$('#cHead_2').val(data);
			if(auto == 3){
				subsubcontrolhead();
			}
		});
		//alert(auto);
		
		
	}
	function subsubcontrolhead(){
		var casgId = $("#acccasubgroup").val();
		$.post("getSubSubControlHead",{casgId:casgId, cagId: $("#accgroup").val(), caId:$("#cHead_2").val()} ,function(data){
			//alert(JSON.stringify(data));
			$('#cHead_3').val(data);
		});
	}
	function showControlhead(){
		var casgId = $("#acccasubgroup").val();
		var level = 1;
		$.post("showControlhead",{casgId:casgId} ,function(data){
			//alert(JSON.stringify(data));
		var dataTable = '<table class="table" id="accca"><tr><th><b>ID</th><th><b>NAME</b></th><th><b>Select</b></th></tr>';
			
			for(var key in data){
				dataTable += '<tr><td>' + data[key].caId + '</td><td>' + data[key].caName+'</td><td><input type="button" id="update" onclick="getValue(' + data[key].caId +","+level + ",'" + data[key].caName + "'" + ')" value="Select" class="update">'+'</td></tr>';
			}
			
			dataTable += '</table>';
			$("#datatable").html(dataTable);
		});
	}
	
	function showSubControlhead(){
		var caId = $("#cHead_1").val();
		var level = 2;
		$.post("showSubControlhead",{caId:caId} ,function(data){
			//alert(JSON.stringify(data));
		var dataTable = '<table class="table" id="accca"><tr><th><b>ID</th><th><b>NAME</b></th></tr>';
			
			for(var key in data){
				dataTable += '<tr><td>' + data[key].caId + '</td><td>' + data[key].caName+'</td><td><input type="button" id="update" onclick="getValue(' + data[key].caId +","+level + ",'" + data[key].caName + "'" + ')" value="Select" class="update">'+'</td></tr>';
			}
			
			dataTable += '</table>';
			$("#datatable").html(dataTable);
		});
	}
	function showSubSubControlhead(){
		var caId = $("#cHead_2").val();
		var level = 3;
		$.post("showSubSubControlhead",{caId:caId} ,function(data){
			//alert(JSON.stringify(data));
		var dataTable = '<table class="table" id="accca"><tr><th><b>ID</th><th><b>NAME</b></th></tr>';
			
			for(var key in data){
				dataTable += '<tr><td>' + data[key].caId + '</td><td>' + data[key].caName+'</td><td><input type="button" id="update" onclick="getValue(' + data[key].caId +","+level + ",'" + data[key].caName + "'" + ')" value="Select" class="update">'+'</td></tr>';
			}
			
			dataTable += '</table>';
			$("#datatable").html(dataTable);
		});
	}
	
	function getValue(id, level,name){
		if(level == 1){
			$("#cHead_1").val(id);
			$("#controlheadname_1").val(name);
		}
		
		else if(level == 2){
			$("#cHead_2").val(id);
			$("#controlheadname_2").val(name);
		}
		
		else if(level == 3){
			$("#cHead_3").val(id);
			$("#controlheadname_3").val(name);
		}

	
	}
	
</script>

</head>
<body>
<div class="col-mid-12 col-lg-12" style="padding-top:140px;">
	
	<form>
		<div class="panel panel-primary">
			<div class="panel-heading">CHART OF ACCOUNTS</div>
		    <div class="panel-body">
		     	<div class="col-md-12">
		     		<div id="successMessage" align="center" class="hidden alert alert-success"></div>
					<div id="errorMessage" align="center" class="hidden alert alert-danger"></div>
		      	</div>
			    <div class="col-md-12">
					<div class="col-md-3">
				      		<label>Control Code Level</label>
				      </div>
				      <div class="col-md-6">
				      		<select name="controllevel" id="controlllevel" class="form-control" onchange="showDiv(this)">
				      		<option value="1" selected="selected">One</option>
				      		<option value="2">Two</option>
				      		<option value="3">Three</option>
				      		</select>
				      </div>
				      <div class="col-md-3">
				      <input type="checkbox" name="display" value="display"><b> Display</b></div>
				</div>
				<div class="col-md-12" style="padding-top:5px" id="div1_1">
				      <div class="col-md-3">
				      		<label>Acc. Group</label>
				      </div>
				      <div class="col-md-6" id="accgroupdiv">
				      </div>
				      <div class="col-md-3"></div>
				</div>
				<div class="col-md-12" style="padding-top:5px; display: none;" id="div2_1">
				      <div class="col-md-3">
				      		<label>Acc. sub Group</label>
				      </div>
				      <div class="col-md-6" id="SubGroup">
				      		
				      </div>
				      <div class="col-md-3"></div>
				</div>
				<div class="col-md-12" style="padding-top:5px" id="div1_2">
				      <div class="col-md-3">
				      		<label>Control Head</label>
				      </div>
				      <div class="col-md-6">
				      		<div class="col-md-5"><input type="text" class="form-control" id="cHead_1"></div>
				      		<div class="col-md-7"><input type="text" id="controlheadname_1" class="form-control"></div>
				      </div>
				      <div class="col-md-3" style="padding-top:7px">
				      <a href="#" onclick="controlhead()"><span class="glyphicon glyphicon-plus-sign"></span></a>
				      <a onclick="showControlhead()" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-eye-open" ></span></a>
				      </div>
				</div>
				<div class="col-md-12" style="padding-top:5px; display: none;" id="div2_2">
				      <div class="col-md-3">
				      		<label>Sub Control Head</label>
				      </div>
				      <div class="col-md-6">
				      		<div class="col-md-5"><input type="text" class="form-control" id="cHead_2"></div>
				      		<div class="col-md-7"><input type="text" id="controlheadname_2" class="form-control"></div>
				      </div>
				      <div class="col-md-3" style="padding-top:7px">
				      <a href="#" onclick="subcontrolhead()"><span class="glyphicon glyphicon-plus-sign"></span></a>
				      <a onclick="showSubControlhead()" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-eye-open" ></span></a>
				      </div>
				</div>
				<br>
				<div class="col-md-12" style="padding-top:5px;display: none;" id="div3_1">
				      <div class="col-md-3">
				      		<label>Sub Sub Control Head</label>
				      </div>
				      <div class="col-md-6">
				      		<div class="col-md-5"><input type="text" class="form-control" id="cHead_3"></div>
				      		<div class="col-md-7"><input type="text" id="controlheadname_3" class="form-control"></div>
					      </div>
				      <div class="col-md-3" style="padding-top:7px">
				      <a href="#" onclick="subsubcontrolhead()"><span class="glyphicon glyphicon-plus-sign" id="generateControlHead"></span></a>
				      <a onclick="showSubSubControlhead()" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-eye-open" ></span></a>
				      </div>
				</div>
					<div class="col-md-12" style="padding-top:5px">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md-6">
								<input id="submit" type="button" name="submit" value="Save" class="btn btn-primary" />
								<input id="btnClear" type="button" name="btnClear" value="Clear" class="btn btn-warning" />
							</div>
					</div>
		      </div>
		</div>	
		</form>
</div>

<!-- Model -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Existing Data</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div id="datatable"></div>
      </div>
    </div>
  </div>
</div>
</body>
</html>