package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.daffodil.ssb.dao.Country;
import edu.daffodil.ssb.dao.CountryDao;

@Service("countryService")
public class CountryService {
	
	
	private CountryDao countryDao;

	@Autowired
	public void setCountryDao(CountryDao countryDao) {
		this.countryDao = countryDao;
	}

	
	public void saveOrUpdate(Country entity) {
		countryDao.saveOrUpdate(entity);
		
	}

	
	public Country find(String id) {
		return countryDao.find(id);
	}

	
	public void delete(Country entity) {
		countryDao.delete(entity);
		
	}


	public List<Country> findAll() {
		// TODO Auto-generated method stub
		return countryDao.findAll();
	}

	
	
}
