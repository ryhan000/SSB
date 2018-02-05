package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.daffodil.ssb.dao.AccCaGroups;
import edu.daffodil.ssb.services.AccCaGroupsService;

@Controller
public class AccountingGroupController {
	@Autowired
	private AccCaGroupsService accCaGroupsService;
	
	@RequestMapping("/accountinggroup")
	public String showHome(){
		return "accountinggroup";
	}
	
@RequestMapping(value="/saveAccCaGroups/{cag_id}",method=RequestMethod.POST)
public @ResponseBody String saveAccCaGroups(@RequestBody AccCaGroups accCaGroups, @PathVariable("cag_id") int cag_id){		
if(cag_id< 1){
	accCaGroupsService.saveAccCaGroups(accCaGroups);
}
else{
	accCaGroups.setCag_id(cag_id);
	accCaGroupsService.updateAccCaGroups(accCaGroups);
}
			
return "!! Record Saved Successfully";
}

@RequestMapping(value="/deleteAccCaGroups", method=RequestMethod.POST)
public @ResponseBody String deleteAccCaGroups(@RequestParam("cag_id") int cag_id){
	AccCaGroups accCaGroups = accCaGroupsService.showAccCaGroupById(cag_id);
	if(accCaGroups != null){
		accCaGroupsService.deleteAccCaGroups(accCaGroups);
	}
	return "Successfully Deleted.";
}

@RequestMapping(value="/showAccCaGroups",method=RequestMethod.POST)
public @ResponseBody List<AccCaGroups> showAccCaGroupTable(){		
		
		return accCaGroupsService.showAccCaGroupTable();
			
	}
	
@RequestMapping(value="/showParent",method=RequestMethod.POST)
public @ResponseBody List<AccCaGroups> showAccCaGroup(){		
		
		return accCaGroupsService.showAccCaGroup();
			
	}

}
