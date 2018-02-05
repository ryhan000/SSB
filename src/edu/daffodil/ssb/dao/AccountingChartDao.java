package edu.daffodil.ssb.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
@Component("AccCaDao")
public class AccountingChartDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}

	public AccountingChart getControlHeadMax(String casgId) {
		
		AccountingChart maxObject = null;
 		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.isNull("caParent"));
		criteria.add(Restrictions.eq("casgId", casgId));
		criteria.addOrder(Order.desc("caId"));
		
		try{
		
		maxObject = (AccountingChart) criteria.getExecutableCriteria(session()).setMaxResults(1).uniqueResult();
		return maxObject;
		}
		catch(NullPointerException e){
			System.out.println("Try catch Exception");
			return null;
		}
		
	}

	public AccountingChart getSubControlHeadMax(String casgId, String caId) {
		AccountingChart maxObject;
		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.isNotNull("caParent"));
		criteria.add(Restrictions.eq("caLevel", Short.parseShort("2")));
		criteria.add(Restrictions.eq("casgId", casgId));
		criteria.add(Restrictions.ilike("caId", caId +"%"));
		criteria.addOrder(Order.desc("caId"));
		
		try{
			maxObject = (AccountingChart) criteria.getExecutableCriteria(session()).setMaxResults(1).uniqueResult();
			System.out.println("---"+maxObject);
			return maxObject;
		}
		catch(NullPointerException e){
			System.out.println("Try catch Exception");
			return null;
		}
	}
	
	public AccountingChart getSubSubControlHeadMax(String casgId, String caId) {
		AccountingChart maxObject;
		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.isNotNull("caParent"));
		criteria.add(Restrictions.eq("caLevel", Short.parseShort("3")));
		criteria.add(Restrictions.ilike("caId", caId +"%"));
		criteria.addOrder(Order.desc("caId"));
		
		try{
			maxObject = (AccountingChart) criteria.getExecutableCriteria(session()).setMaxResults(1).uniqueResult();
			System.out.println("---"+maxObject);
			return maxObject;
		}
		catch(NullPointerException e){
			System.out.println("Try catch Exception");
			return null;
		}
	}

	public void saveorupdate(AccountingChart accountingChartTemp) {
		// TODO Auto-generated method stub
		session().saveOrUpdate(accountingChartTemp);
	}

	@SuppressWarnings("unchecked")
	public List<AccountingChart> showControlhead(String casgId) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.eq("casgId", casgId));
		criteria.add(Restrictions.eq("caLevel", Short.parseShort("1")));
		return criteria.getExecutableCriteria(session()).list();
		
	}

	@SuppressWarnings("unchecked")
	public List<AccountingChart> showSubControlhead(String caId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.eq("caLevel", Short.parseShort("2")));
		criteria.add(Restrictions.ilike("caId", caId +"%"));
		return criteria.getExecutableCriteria(session()).list();
	}

	@SuppressWarnings("unchecked")
	public List<AccountingChart> showSubSubControlhead(String caId) {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccountingChart.class);
		criteria.add(Restrictions.eq("caLevel", Short.parseShort("3")));
		criteria.add(Restrictions.ilike("caId", caId +"%"));
		return criteria.getExecutableCriteria(session()).list();
	}
	

}
