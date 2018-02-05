package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.daffodil.ssb.dao.AccountingChart;
import edu.daffodil.ssb.dao.AccountingChartDao;

@Service("AccCaService")
public class AccountingChartService {
	private AccountingChartDao accountingChartDao;
	
	
	@Autowired
	public void setAccountingChartDao(AccountingChartDao accountingChartDao) {
		this.accountingChartDao = accountingChartDao;
	}



	public AccountingChart getControlHeadMax(String casgId) {
		return accountingChartDao.getControlHeadMax(casgId);
	}
	
	public AccountingChart getSubControlHeadMax(String casgId, String caId){
		return accountingChartDao.getSubControlHeadMax(casgId, caId);
	}
	
	public AccountingChart getSubSubControlHeadMax(String casgId, String caId){
		return accountingChartDao.getSubSubControlHeadMax(casgId, caId);
	}



	public void saveorupdate(AccountingChart accountingChartTemp) {
		accountingChartDao.saveorupdate(accountingChartTemp);
		
	}



	public List<AccountingChart> showControlhead(String casgId) {
		return accountingChartDao.showControlhead(casgId);
	}



	public List<AccountingChart> showSubControlhead(String caId) {
		return accountingChartDao.showSubControlhead(caId);
	}



	public List<AccountingChart> showSubSubControlhead(String caId) {
		return accountingChartDao.showSubSubControlhead(caId);
	}
	

}
