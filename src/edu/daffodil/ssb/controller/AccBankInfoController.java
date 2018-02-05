package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.daffodil.ssb.dao.AccBankInfo;

import edu.daffodil.ssb.services.AccBankInfoService;


@Controller
public class AccBankInfoController {
	
	@Autowired
	private AccBankInfoService accBankInfoService ;
	
	
	@RequestMapping(value="/accbankinfo")
	public String Showpage(){
		return "accbankinfo";
		
	}
	
	// for save
	@RequestMapping(value="/saveAccBankInfo",method=RequestMethod.POST)
	public @ResponseBody String saveAccBankInfo (@RequestBody AccBankInfo accBankInfo){		
		
		accBankInfoService.saveOrUpdate(accBankInfo);
		//registrationService.saveUser(registration);
			
		return "!! Record Saved Successfully";
	}
	
	//for show data
	@RequestMapping(value="/showAccBankInfo",method=RequestMethod.POST)
	public @ResponseBody List<AccBankInfo> showAccBankInfo(){		
		
		return accBankInfoService.showAccBankInfo();
			
	}
	
	// for delete 
	@RequestMapping(value="/deleteAccBankInfo", method=RequestMethod.POST)
	public @ResponseBody String deleteAccBankInfo(@RequestParam("id") int id){
		AccBankInfo accBankInfo = accBankInfoService.deleteAccBankInfoBy(id);
		if(accBankInfo  != null){
			accBankInfoService.deleteAccBankInfo(accBankInfo);
		}
		return "Successfully Deleted.";
	}
	
	

}
