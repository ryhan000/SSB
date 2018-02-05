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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Repository
@Transactional
@Component("AccCaGroupsDao")
public class AccCaGroupsDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session(){
		return sessionFactory.getCurrentSession();
	}
	@RequestMapping(value="/aveAccCaGroups",method=RequestMethod.POST)
	public void saveAccCaGroup(AccCaGroups acccagroups){
		session().save(acccagroups);
	}
	
	@SuppressWarnings("unchecked")
	public List<AccCaGroups> showAccCaGroups() {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(AccCaGroups.class); 
		criteria.add(Restrictions.isNull("cag_parent"));
		return criteria.getExecutableCriteria(session()).list();
		
	}
	@SuppressWarnings("unchecked")
	public List<AccCaGroups> showAccCaGroupsTable() {
		DetachedCriteria criteria = DetachedCriteria.forClass(AccCaGroups.class); 
		criteria.add(Restrictions.isNotNull("cag_parent"));
		return criteria.getExecutableCriteria(session()).list();
		
	}
	public void updateAccCaGroups(AccCaGroups accCaGroups) {
		session().update(accCaGroups);
		
	}
	public AccCaGroups showAccCaGroupsById(int cag_id) {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(AccCaGroups.class);
		criteria.add(Restrictions.eq("cag_id", cag_id));
		return (AccCaGroups) criteria.getExecutableCriteria(session()).uniqueResult();
	}
	public void deleteAccCaGroups(AccCaGroups cag_id) {
		session().delete(cag_id);
	}
}
