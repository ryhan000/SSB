package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.daffodil.ssb.dao.AccBankAccount;
import edu.daffodil.ssb.dao.AccBankInfo;
import edu.daffodil.ssb.dao.FinYear;
import edu.daffodil.ssb.services.AccBankAccountService;


@Controller
public class AccBankAccountController {
	
	@Autowired
	private AccBankAccountService accBankAccountService ;
	
	@RequestMapping(value="/accbankaccount")
	public String Showpage(){
		return "accbankaccount";
		
	}
	
	// for save
	/*
		@RequestMapping(value="/saveAccBankAccount/{id}",method=RequestMethod.POST)
		public @ResponseBody String saveAccBankAccount (@RequestBody AccBankAccount accBankAccount,@PathVariable("id") int id){		
			
			if(id<1){
			accBankAccountService.saveOrUpdate(accBankAccount);
			//registrationService.saveUser(registration);
			}	
			else{
				accBankAccount.setId(id);
				accBankAccountService.saveOrUpdate(accBankAccount);
			} 
			return "!! Record Saved Successfully";
		} */
		
		@RequestMapping(value="/saveAccBankAccount",method=RequestMethod.POST)
		public @ResponseBody String saveAccBankAccount (@RequestBody AccBankAccount accBankAccount){		
			
		
			accBankAccountService.saveOrUpdate(accBankAccount);
			//registrationService.saveUser(registration);
				
			
			return "!! Record Saved Successfully";
		}
		
		
		@RequestMapping(value="/showCompanyId",method=RequestMethod.POST)
		public @ResponseBody List<FinYear> showCompanyId(){		
			
			return accBankAccountService.showCompanyId();
				
		}
		
		// show bank id in combobox
		@RequestMapping(value="/showBankId",method=RequestMethod.POST)
		public @ResponseBody List<AccBankInfo> showBankId(){		
			
			return accBankAccountService.showAccBankId();
				
		}
		
		//for show data
		@RequestMapping(value="/showAccBankAccount",method=RequestMethod.POST)
		public @ResponseBody List<AccBankAccount> showAccBankAccount(){		
			
			return accBankAccountService.showAccBankAccountInfo();
				
		}
		// for delete 
		@RequestMapping(value="/deleteAccBankAccount", method=RequestMethod.POST)
		public @ResponseBody String deleteAccBankAccount(@RequestParam("id") int id){
			AccBankAccount accBankAccount = accBankAccountService.deleteAccBankAccountBy(id);
			if( accBankAccount  != null){
				accBankAccountService.deleteAccBankAccount(accBankAccount);
			}
			return "Successfully Deleted.";
		}
		
	
	

}
