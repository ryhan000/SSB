package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccBankAccount;
import edu.daffodil.ssb.dao.AccBankAccountDao;
import edu.daffodil.ssb.dao.AccBankInfo;
import edu.daffodil.ssb.dao.FinYear;



@Service("accBankAccountService")
public class AccBankAccountService {
	
	
	private AccBankAccountDao accBankAccountDao;
	
	@Autowired
	public void setAccBankAccountDao(AccBankAccountDao accBankAccountDao) {
		this.accBankAccountDao =   accBankAccountDao;
	}
	

	public void saveOrUpdate(AccBankAccount accBankAccount) {
		// TODO Auto-generated method stub
		accBankAccountDao.saveOrUpdate(accBankAccount);
		
	}


	public List<FinYear> showCompanyId() {
		// TODO Auto-generated method stub
		return accBankAccountDao.showCompanyId();
	}


	public List<AccBankInfo> showAccBankId() {
		
		return accBankAccountDao.showAccBankId();
	}
	
	public List<AccBankInfo> getBankList(){
		return accBankAccountDao.getBankList();
		
	}


	public List<AccBankAccount> showAccBankAccountInfo() {
		// TODO Auto-generated method stub
		return accBankAccountDao.showAccBankAccountInfo();
	}


	public AccBankAccount deleteAccBankAccountBy(int id) {
		// TODO Auto-generated method stub
		return accBankAccountDao.deleteAccBankAccountBy(id);
	}


	public void deleteAccBankAccount(AccBankAccount id) {
		// TODO Auto-generated method stub
		accBankAccountDao.deleteAccBankAccount(id);
		
	}


	


	
	
	

}
