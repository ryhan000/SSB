package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Strings;

import edu.daffodil.ssb.dao.AccCaGroups;
import edu.daffodil.ssb.dao.AccountingChart;
import edu.daffodil.ssb.services.AccountingChartService;

@Controller
public class AccountingChartController {
	@Autowired
	private AccountingChartService accountingChartService;
	
	@RequestMapping(value="getControlHeadMax",method=RequestMethod.POST)
	public @ResponseBody String getControlHeadMax(@RequestParam("casgId") String casgId,
			@RequestParam("cagId") String cagId){
		
		AccountingChart accCa = accountingChartService.getControlHeadMax(casgId);
		String prefix = (Strings.padStart(cagId, 2, '0')  + Strings.padStart(casgId, 3, '0'));
		if(accCa == null){
			return  (prefix + "001");
		} else {
			System.out.println("Get ID: " + accCa.getCaId());
			//System.out.println("suffix: " + Strings.padStart(Integer.toString((Integer.parseInt(accCa.getCaId().substring(4)) + 1)), 3, '0'));
			return prefix + Strings.padStart(Integer.toString((Integer.parseInt(accCa.getCaId().substring(5)) + 1)), 3, '0') ;
		}
		
	}
	@RequestMapping(value="getSubControlHeadMax",method=RequestMethod.POST)
	public @ResponseBody String getSubControlHeadMax(@RequestParam("casgId") String casgId,
			@RequestParam("cagId") String cagId, @RequestParam("caId") String caId){
		//AccountingChart AccCc = accountingChartService.getControlHeadMax(casgId);
		AccountingChart AccCaSubControlHead = accountingChartService.getSubControlHeadMax(casgId, caId);
		//AccountingChart accCa = accountingChartService.getControlHeadMax(casgId);
		System.out.println(AccCaSubControlHead);
		//String prefix = (Strings.padStart(cagId, 2, '0')  + Strings.padStart(casgId, 3, '0'));
		//String cHead = Strings.padStart(Integer.toString((Integer.parseInt(accCa.getCaId().substring(5)) + 1)), 3, '0') ;
		String prefix = caId;
		System.out.println(prefix);
		if(AccCaSubControlHead == null)
			return (prefix + "001");
		else{
			System.out.println("hello2");
			System.out.println("SubControlHead:"+AccCaSubControlHead.getCaId());
			return prefix + Strings.padStart(Integer.toString((Integer.parseInt(AccCaSubControlHead.getCaId().substring(9)) + 1)), 3, '0') ;
		}
	}
	
	@RequestMapping(value="getSubSubControlHead",method=RequestMethod.POST)
	public @ResponseBody String getSubSubControlHeadMax(@RequestParam("casgId") String casgId,
			@RequestParam("cagId") String cagId, @RequestParam("caId") String caId){
		//AccountingChart accCa = accountingChartService.getControlHeadMax(casgId);
		//String cHead = Strings.padStart(Integer.toString((Integer.parseInt(accCa.getCaId().substring(5)) + 1)), 3, '0') ;
		//AccountingChart AccCaSub = accountingChartService.getSubControlHeadMax(casgId, caId);
		//String cSubHead = Strings.padStart(Integer.toString((Integer.parseInt(AccCaSub.getCaId().substring(9)) + 1)), 3, '0');
		//System.out.println("hello");
		//String prefix = (Strings.padStart(cagId, 2, '0')  + Strings.padStart(casgId, 3, '0'));
		String prefix = caId;
		AccountingChart SubSubControlHead = accountingChartService.getSubSubControlHeadMax(casgId, caId);
		//String prefix = AccCa.getCaId();
		if(SubSubControlHead == null){
			return (prefix + "001");
		}
		else{
			//System.out.println("hello2");
			System.out.println("SubControlHead:"+SubSubControlHead.getCaId());
			return prefix + Strings.padStart(Integer.toString((Integer.parseInt(SubSubControlHead.getCaId().substring(11)) + 1)), 3, '0') ;
		}
	}
	@RequestMapping(value="saveChartOfAccounts",method=RequestMethod.POST)
	public @ResponseBody String saveChartOfAccounts(@RequestBody List<AccountingChart> accountingChart){
		for(AccountingChart accountingChartTemp: accountingChart){
			accountingChartService.saveorupdate(accountingChartTemp);
		}
		return "Record Successfully";
	}
	
	@RequestMapping(value="/showControlhead",method=RequestMethod.POST)
	public @ResponseBody List<AccountingChart> showAccCaGroupTable(@RequestParam("casgId") String casgId){		
			return accountingChartService.showControlhead(casgId);
				
		}
	@RequestMapping(value="/showSubControlhead",method=RequestMethod.POST)
	public @ResponseBody List<AccountingChart> showAccCaSubGroup(@RequestParam("caId") String caId){		
			return accountingChartService.showSubControlhead(caId);
				
		}
	@RequestMapping(value="/showSubSubControlhead",method=RequestMethod.POST)
	public @ResponseBody List<AccountingChart> showAccCaSubSubGroup(@RequestParam("caId") String caId){		
			return accountingChartService.showSubSubControlhead(caId);
				
		}
}
