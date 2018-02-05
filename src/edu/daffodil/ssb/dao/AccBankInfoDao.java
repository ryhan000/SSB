package edu.daffodil.ssb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("accBankInfoDao")

public class AccBankInfoDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(AccBankInfo accBankInfo) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(accBankInfo);
		
		
	}
	
	@SuppressWarnings("unchecked")
	public List<AccBankInfo> showAccBankInfo() {
		
       DetachedCriteria criteria = DetachedCriteria.forClass(AccBankInfo.class); 
		
		return criteria.getExecutableCriteria(session()).list();
	}

	

	public void deleteAccBankInfo(AccBankInfo id) {
		session().delete(id);
		
	}

	public AccBankInfo deleteAccBankInfoBy(int id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankInfo.class);
		criteria.add(Restrictions.eq("id", id));
		return (AccBankInfo) criteria.getExecutableCriteria(session()).uniqueResult();
	}

}
