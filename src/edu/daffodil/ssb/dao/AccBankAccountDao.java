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
@Component("accBankAccountDao")
public class AccBankAccountDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public void saveOrUpdate(AccBankAccount accBankAccount) {
		
		session().saveOrUpdate(accBankAccount);
		
	}

	@SuppressWarnings("unchecked")
	public List<FinYear> showCompanyId() {
DetachedCriteria criteria = DetachedCriteria.forClass(FinYear.class); 
		
		return criteria.getExecutableCriteria(session()).list();
	}

	@SuppressWarnings("unchecked")
	public List<AccBankInfo> showAccBankId() {
        DetachedCriteria criteria = DetachedCriteria.forClass(AccBankInfo.class); 
		
		return criteria.getExecutableCriteria(session()).list();
	}

	@SuppressWarnings("unchecked") 
	public List<AccBankInfo> getBankList() {		
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankInfo.class);		
		return criteria.getExecutableCriteria(session()).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<AccBankAccount> showAccBankAccountInfo() {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankAccount.class); 
		
		return criteria.getExecutableCriteria(session()).list();
	}

	public AccBankAccount deleteAccBankAccountBy(int id) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankAccount.class);
		criteria.add(Restrictions.eq("id", id));
		return (AccBankAccount) criteria.getExecutableCriteria(session()).uniqueResult();
	}

	public void deleteAccBankAccount(AccBankAccount id) {
		// TODO Auto-generated method stub
		session().delete(id);
		
	}

	

}
