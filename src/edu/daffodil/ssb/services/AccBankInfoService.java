package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccBankInfo;
import edu.daffodil.ssb.dao.AccBankInfoDao;



@Service("accBankInfoService")

public class AccBankInfoService {
	
	
	private AccBankInfoDao accBankInfoDao;
	
	
	@Autowired
	public void setAccBankinfoDao(AccBankInfoDao accBankInfoDao) {
		this. accBankInfoDao =  accBankInfoDao;
	}

	

	public void saveOrUpdate(AccBankInfo accBankInfo) {
		// TODO Auto-generated method stub
		accBankInfoDao.saveOrUpdate(accBankInfo);
		
	}



	public List<AccBankInfo> showAccBankInfo() {
		
		return accBankInfoDao.showAccBankInfo();
	}


     public AccBankInfo deleteAccBankInfoBy(int id) {
		
		return accBankInfoDao.deleteAccBankInfoBy(id) ;
	}



	public void deleteAccBankInfo(AccBankInfo id) {
		 accBankInfoDao.deleteAccBankInfo(id) ;
		
	}

}
