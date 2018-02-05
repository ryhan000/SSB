package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccBankAccount;
import edu.daffodil.ssb.dao.AccBankChecque;
import edu.daffodil.ssb.dao.AccBankChecqueDao;
import edu.daffodil.ssb.dao.AccBankInfo;


@Service("accBankChecqueService")
public class AccBankChecqueService {
	
private AccBankChecqueDao accBankChecqueDao;
	
	@Autowired
	public void setAccBankChecqueDao(AccBankChecqueDao  accBankChecqueDao) {
		this.accBankChecqueDao =   accBankChecqueDao;
	}

	public java.util.List<AccBankInfo> showBankName() {
		// TODO Auto-generated method stub
		return accBankChecqueDao.showBankName();
	}

	

	public List<AccBankAccount> showAccBankAccount(int id) {
		// TODO Auto-generated method stub
		return accBankChecqueDao.showAccBankAccount(id);
	}

	

	public void saveOrUpdate(AccBankChecque accBankchecuqe) {
		// TODO Auto-generated method stub
		accBankChecqueDao.SaveOrUpdate(accBankchecuqe);
		
	}

	public List<AccBankChecque> showAccBankCheque() {
		// TODO Auto-generated method stub
		return  accBankChecqueDao.showAccBankCheque();
	}

	
	
}
