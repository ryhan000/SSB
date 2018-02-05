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
@Component("accBankChecqueDao")
public class AccBankChecqueDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	public List<AccBankInfo> showBankName() {
		  DetachedCriteria criteria = DetachedCriteria.forClass(AccBankInfo.class); 
			
			return criteria.getExecutableCriteria(session()).list();
	}

	public AccBankAccount showBankAccount(int bankValue) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankAccount.class); 
		criteria.add(Restrictions.eq("id", bankValue));
		return (AccBankAccount) criteria.getExecutableCriteria(session()).uniqueResult();
	}
	
	@SuppressWarnings({ "unchecked" })
	public List<AccBankAccount> showAccBankAccount(int id) {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(AccBankAccount.class);
		criteria.add(Restrictions.eq("bankid", id));
		return  criteria.getExecutableCriteria(session()).list();
	}

	public void SaveOrUpdate(AccBankChecque accBankchecuqe) {
		// TODO Auto-generated method stub
		
		session().saveOrUpdate(accBankchecuqe);
	}

	@SuppressWarnings("unchecked")
	public List<AccBankChecque> showAccBankCheque() {
        DetachedCriteria criteria = DetachedCriteria.forClass(AccBankChecque.class); 
		
		return criteria.getExecutableCriteria(session()).list();
	}

}
