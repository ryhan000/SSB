package edu.daffodil.ssb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.daffodil.ssb.dao.AccCaSubGroups;
import edu.daffodil.ssb.services.AccountingSubGroupService;

@Controller
public class AccountingSubGroupController {
	@Autowired
	private AccountingSubGroupService accountingSubGroupService;
	
	@RequestMapping(value="/GetSubAccGroupbyGroupID",method=RequestMethod.POST)
	public @ResponseBody List<AccCaSubGroups> showAccCaSubGroupsByGroups(@RequestParam("cag_id") int cag_id){
		return accountingSubGroupService.showAccCaSubGroupsByGroups(cag_id);
	}
}
