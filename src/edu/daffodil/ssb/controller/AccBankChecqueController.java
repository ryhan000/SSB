package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.daffodil.ssb.dao.AccBankAccount;
import edu.daffodil.ssb.dao.AccBankChecque;
import edu.daffodil.ssb.dao.AccBankInfo;
import edu.daffodil.ssb.services.AccBankAccountService;
import edu.daffodil.ssb.services.AccBankChecqueService;

@Controller
public class AccBankChecqueController {

	
	@Autowired
	private AccBankChecqueService accBankChecqueService ;
	@Autowired
	private AccBankAccountService accBankAccountService;
	
	
	
	@RequestMapping(value="/accbankchecque")
	public ModelAndView showBank(){
		ModelAndView mv=new ModelAndView();
		mv.addObject("bankList",accBankAccountService.getBankList());
		mv.setViewName("accbankchecque");
		return mv;
	}
	
	
	@RequestMapping(value="/showBankName",method=RequestMethod.POST)
	public @ResponseBody List<AccBankInfo> showBankName(){	
		return accBankChecqueService.showBankName();			
	}
	
	@RequestMapping(value="/showBankAccountById",method=RequestMethod.POST)
	public @ResponseBody List<AccBankAccount> showAccBankAccount(@RequestParam("id") int id){
		return accBankChecqueService.showAccBankAccount(id);
	}
	
	@RequestMapping(value="/saveAccBankCheque",method=RequestMethod.POST)
	public @ResponseBody String saveAccBankCheque (@RequestBody List<AccBankChecque> accBankchecuqe){		
		
	
		System.out.println("Total Count: "+accBankchecuqe.size());
		
		for(AccBankChecque accBankChequeTmp:accBankchecuqe){
			//System.out.println(accBankChequeTmp.toString());
			accBankChecqueService.saveOrUpdate(accBankChequeTmp);
		}
		
		//registrationService.saveUser(registration);
			
		
		return "Record Saved Successfully.";
	}
	
	@RequestMapping(value="/showAccBankCheque",method=RequestMethod.POST)
	public @ResponseBody List<AccBankChecque> showAccBankCheque(){	
		return accBankChecqueService.showAccBankCheque();			
	}
	
	
	
	
}
