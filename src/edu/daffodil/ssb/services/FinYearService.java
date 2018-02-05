package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.daffodil.ssb.dao.FinYear;
import edu.daffodil.ssb.dao.FinYearDao;

@Service("finyearservice")
public class FinYearService {
	
	private FinYearDao finyeardao;
	
	@Autowired
	public void setUserDao(FinYearDao finyeardao) {
		this.finyeardao =  finyeardao;
	}

	//public void saveUser(AddLibrarian addlibrarian) {
		//addlibrariandao.saveUser(addlibrarian);
	//}

	public List<FinYear> showFinyear() {
		
		return finyeardao.showFinyear();
	}

}
